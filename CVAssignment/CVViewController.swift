//
//  CVViewController.swift
//  CVAssignment
//
//  Created by Pooya on 2019-06-01.
//  Copyright © 2019 AmirHatami. All rights reserved.
//

import UIKit

class CVViewController: UIViewController {

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(showSizeClasses())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.subviews.forEach { $0.removeFromSuperview() }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (coordinator) in
            print(self.showSizeClasses())
        }, completion: nil)
        //        print(showSizeClasses())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let cv = readInfo()
        
        let titleView = UIView()
        titleView.customizeView(round: 15 , shadowColor: UIColor.black.cgColor, backgroundColor: UIColor(hex: "0ee1f1"))
        
        let summarydetailsView = UIView()
        summarydetailsView.customizeView(round: 15 , shadowColor: UIColor.black.cgColor, backgroundColor: .lightGreen)
        
        let summarygesture:DetailsTapGesture = DetailsTapGesture(target: self, action: #selector(CVViewController.gestureTapAction))
        summarygesture.numberOfTapsRequired = 1
        summarydetailsView.isUserInteractionEnabled = true
        summarydetailsView.addGestureRecognizer(summarygesture)
        summarygesture.pageName = "summary"
        summarygesture.cvInfo = cv
        
        let knowledgeView = UIView()
        knowledgeView.customizeView(round: 15 , shadowColor: UIColor.black.cgColor, backgroundColor: .lightGreen)
        
        let knowledgegesture:DetailsTapGesture = DetailsTapGesture(target: self, action: #selector(CVViewController.gestureTapAction))
        knowledgegesture.numberOfTapsRequired = 1
        knowledgeView.isUserInteractionEnabled = true
        knowledgeView.addGestureRecognizer(knowledgegesture)
        knowledgegesture.pageName = "knowledge"
        knowledgegesture.cvInfo = cv

        let experienceView = UIView()
        experienceView.customizeView(round: 15 , shadowColor: UIColor.black.cgColor, backgroundColor: .lightGreen)
        
        let experiencegesture:DetailsTapGesture = DetailsTapGesture(target: self, action: #selector(CVViewController.gestureTapAction))
        experiencegesture.numberOfTapsRequired = 1
        experienceView.isUserInteractionEnabled = true
        experienceView.addGestureRecognizer(experiencegesture)
        experiencegesture.pageName = "experience"
        experiencegesture.cvInfo = cv

        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        print("screenWidth \(screenWidth) screenHeight\(screenHeight)")
        
        [titleView, summarydetailsView, knowledgeView, experienceView].forEach { view.addSubview($0) }
        
        titleView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 12, left: 12, bottom: 0, right: 12), size: .init(width: screenWidth-24, height: screenHeight/4-20) )
        titleView.heightAnchor.constraint(equalTo: titleView.widthAnchor).isActive = true
        
        summarydetailsView.anchor(top: titleView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 12, left: 12, bottom: 0, right: 12))
        summarydetailsView.anchorSize(to: titleView)
        
        knowledgeView.anchor(top: summarydetailsView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 12, left: 12, bottom: 0, right: 12))
        
        experienceView.anchor(top: knowledgeView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 12, left: 12, bottom: 0, right: 12))
        
        summarydetailsView.anchorSize(to: titleView)
        knowledgeView.anchorSize(to: titleView)
        experienceView.anchorSize(to: titleView)
        
        titleView.setupViews(title: cv.name , imageName: "" , details: cv.experiences[0].roleName!, maxWidth: screenWidth - 66, maxHeight: screenHeight/4 - 60  )
        summarydetailsView.setupViews(title: "Professional summary : ", imageName: "", details: cv.summary.trunc(length: 125), maxWidth: screenWidth - 66, maxHeight: screenHeight/4 - 66 )
        knowledgeView.setupViews(title: "Topics of knowledge / technical : ", imageName: "", details: cv.knowledges[0].description ?? "NA", maxWidth: screenWidth - 66, maxHeight: screenHeight/4 - 66 )
        experienceView.setupViews(title: "Past experience : ", imageName: "", details: cv.experiences[0].roleName ?? "NA", maxWidth: screenWidth - 66, maxHeight: screenHeight/4 - 66 )

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    /**
     Make *to be completed* to *to be completed*
     
     - Author:
     *Amir Hatami* **(Soonin)**
     - returns:
     to be completed
     - throws:
     Nothing
     - parameters:
     - to be completed: to be completed
     */
    @objc func gestureTapAction(sender: DetailsTapGesture!) {
        print("Calling Details Page")
        
        let DetailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsView") as! DetailsViewController
        DetailsVC.detailsViewDelegate = self
        DetailsVC.pageName = sender.pageName
        DetailsVC.cvInfo = sender.cvInfo
        present(DetailsVC,animated: true, completion: nil)
        
    }
    
    /**
     Make *to be completed* to *to be completed*
     
     - Author:
     *Amir Hatami* **(Soonin)**
     - returns:
     to be completed
     - throws:
     Nothing
     - parameters:
     - to be completed: to be completed
     */
    func readInfo() -> CV {
        var localCV = CV()
        let semaphore = DispatchSemaphore(value: 0)
        
        let jasonUrlString = "https://raw.githubusercontent.com/amhatami/CVAssignment/master/CVAssignment/sampleCV.json"
        
        guard let url = URL(string: jasonUrlString) else { print("URL-NA"); return localCV }
        URLSession.shared.dataTask(with: url) {(data, respons, err) in
            guard let data = data else { print("data-NA"); return }
            
            do {
                let decoder = JSONDecoder()
                // swift 4.1
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                //let knowledges = try decoder.decode([Knowledge].self, from: data)
                let cv = try decoder.decode(CV.self, from: data)
                localCV = cv
                print(localCV)
                semaphore.signal()
                
                DispatchQueue.main.async {
                    //TODO: Repalce semaphore
                }
                
            } catch let jsonErr {
                print("Error serializing json: \(jsonErr)")
            }
            }.resume()
        
        semaphore.wait()
        return localCV
    }
}// end of function readInfo()


extension UIUserInterfaceSizeClass: CustomStringConvertible {
    /**
     Make *to be completed* to *to be completed*
     
     - Author:
     *Amir Hatami* **(Soonin)**
     - returns:
     to be completed
     - throws:
     Nothing
     - parameters:
     - to be completed: to be completed
     */
    public var description: String {
        switch self {
        case .compact: return "compact"
        case .regular: return "regular"
        default: return "unspecified"
        }
    }
}



extension CVViewController: DetailsViewDelegate {
    
    /**
     Make *to be completed* to *to be completed*
     
     - Author:
     *Amir Hatami* **(Soonin)**
     - returns:
     to be completed
     - throws:
     Nothing
     - parameters:
     - to be completed: to be completed
     */
    func didTapSelect(image: UIImage, name: String, description: String) {
        print("didtapselect")
    }
}

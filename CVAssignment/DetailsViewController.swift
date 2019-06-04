//
//  DetailsViewController.swift
//  CVAssignment
//
//  Created by Pooya on 2019-06-02.
//  Copyright © 2019 AmirHatami. All rights reserved.
//

import UIKit

protocol DetailsViewDelegate {
    func didTapSelect(image: UIImage, name: String, description: String)
}

class DetailsViewController: UIViewController {

    var detailsViewDelegate : DetailsViewDelegate!
    var pageName : String = ""
    var cvInfo : CV?
    override func viewDidLoad() {
        super.viewDidLoad()

        print(pageName)
        let (pageTitle , pageDetails ) = pageDetailsFinder(pageName: pageName, cvInfo: cvInfo ?? CV())
        
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let detailsView = UIView()
        detailsView.customizeView(round: 15 , shadowColor: UIColor.black.cgColor, backgroundColor: .lightGreen)
        view.addSubview(detailsView)
        
        detailsView.anchor(top: view.safeAreaLayoutGuide.topAnchor , leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 22, left: 22, bottom: 22, right: 22), size: .init(width: screenWidth-44, height: screenHeight-44) )
        
        detailsView.heightAnchor.constraint(equalTo: detailsView.widthAnchor).isActive = true
        
        detailsView.setupViews(title: pageTitle , imageName: pageName, details: pageDetails , maxWidth: screenWidth - 66, maxHeight: screenHeight-66 )
        
        
        let detailsgesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeDetailsAction))
        detailsgesture.numberOfTapsRequired = 1
        detailsView.isUserInteractionEnabled = true
        detailsView.addGestureRecognizer(detailsgesture)

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
    @objc func closeDetailsAction() {
        print("second page")
        dismiss(animated: true, completion: nil)
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
    func pageDetailsFinder(pageName : String, cvInfo: CV ) -> (String , String) {
        var OutputTitle : String = ""
        var OutputDetails : String = ""

        switch pageName {
        case "summary":
            OutputTitle = "Professional summary : "
            OutputDetails = cvInfo.summary
        case "knowledge":
            OutputTitle = "Topics of knowledge / technical : "
            let knowledges = cvInfo.knowledges
            for knowledge in knowledges {
                OutputDetails += "+" + (knowledge.description ?? "") + "\n"
                OutputDetails += "\n"
            }
        case "experience":
            OutputTitle = "Past experience : "
            let experiences = cvInfo.experiences
            for experience in experiences {
                OutputDetails += experience.roleName ?? ""
                OutputDetails += "+" + (experience.roleName ?? "") + "\n"
                OutputDetails += "     " + (experience.companyName ?? "") + "\n"
//                OutputDetails += "     " + (experience.dateFrom ?? "") + " - " + (experience.dateTo ?? "") + "\n"
                OutputDetails += "     " + (experience.location ?? "") + "\n"
                OutputDetails += "     " + (experience.responsibilities ?? "") + "\n"
                OutputDetails += "     " + (experience.achievements ?? "") + "\n"
                OutputDetails += "\n"
            }
        default:
            OutputTitle = "NA"
            OutputTitle = "NA"
        }
        return(OutputTitle,OutputDetails)
    }

}

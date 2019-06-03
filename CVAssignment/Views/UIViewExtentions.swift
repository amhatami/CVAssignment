//
//  UIViewExtentions.swift
//  CVAssignment
//
//  Created by Pooya on 2019-06-01.
//  Copyright © 2019 AmirHatami. All rights reserved.
//

import UIKit

extension UIView {
    
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
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: nil, views: viewsDictionary))
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
    func customizeView(round : CGFloat , shadowColor : CGColor , backgroundColor : UIColor ) {
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = round
        self.layer.shadowColor = shadowColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = round
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
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
    func fillSuperview() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
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
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
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
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
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
    func addCustomizedLabel() {
        
        let nameLabel:UILabel = {
            let label = UILabel()
            label.text = "setting"
            label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.subheadline)  //UIFont.systemFont(ofSize: 13)
            return label
        }()
        
        let iconImageView:UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "Settings32x32")
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        
        //backgroundColor =  localslideInHandler.menuCellsBackColor //UIColor.blue
        self.addSubview(nameLabel)
        self.addSubview(iconImageView)
        
        self.addConstraintsWithFormat("H:|-8-[v0(30)]-8-[v1]", views: iconImageView,nameLabel)
        self.addConstraintsWithFormat("V:|[v0]|", views: nameLabel)
        self.addConstraintsWithFormat("V:[v0(30)]", views: iconImageView)
        
        self.addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
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
    func setupGesture(pageName : String) {
        let gesture:DetailsTapGesture = DetailsTapGesture(target: self, action: #selector(CVViewController.gestureTapAction))
        gesture.numberOfTapsRequired = 1
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(gesture)
        gesture.pageName = pageName
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
    func setupViews(title: String, imageName: String, details: String, maxWidth: CGFloat, maxHeight: CGFloat) {
        
        let titleLabel:UILabel = {
            let label = UILabel()
            label.text = title
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.sizeToFit()
            label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)  //UIFont.systemFont(ofSize: 13)
            return label
        }()
        
        let iconImageView:UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: imageName)
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()

        let detailsLabel:UILabel = {
            let label = UILabel()
            label.text = details
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingTail
            label.sizeToFit()
            label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)  //UIFont.systemFont(ofSize: 13)
            return label
        }()

        //backgroundColor =  localslideInHandler.menuCellsBackColor //UIColor.blue
        self.addSubview(titleLabel)
        self.addSubview(iconImageView)
        self.addSubview(detailsLabel)

        self.addConstraintsWithFormat("H:|-8-[v0(30)]-8-[v1(\(maxWidth))]", views: iconImageView,titleLabel)
        self.addConstraintsWithFormat("H:|-24-[v0(\(maxWidth))]", views: detailsLabel)
        self.addConstraintsWithFormat("V:|-24-[v0(30)]-8-[v1]", views: titleLabel, detailsLabel)
        self.addConstraintsWithFormat("V:|-24-[v0(30)]", views: iconImageView)
        
        self.addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }


}

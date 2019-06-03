//
//  UIViewControllerExtention.swift
//  CVAssignment
//
//  Created by Pooya on 2019-06-03.
//  Copyright © 2019 AmirHatami. All rights reserved.
//

import UIKit

extension UIViewController {
    
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
    func showSizeClasses() -> String {
        let horizontalDescription = traitCollection.horizontalSizeClass.description
        let verticalDescription = traitCollection.verticalSizeClass.description
        return ("Width: \(horizontalDescription)  height: \(verticalDescription)")
    }

    
    
    
}

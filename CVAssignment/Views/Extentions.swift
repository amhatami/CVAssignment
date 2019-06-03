//
//  Extentions.swift
//  CVAssignment
//
//  Created by Pooya on 2019-06-03.
//  Copyright © 2019 AmirHatami. All rights reserved.
//

import UIKit

/// Find more information for [Swift](http://swift.org)
///  *  *  *  *  *


//return color from RGB and HEX
extension UIColor {
    
    //few ready colors
    static let lightPink = UIColor(hex: "ffc0cb", alpha: 1)
    static let mistyRose = UIColor(hex: "ffe4e1")
    static let dustyDarkGreen  = UIColor(hex: "008080")
    static let lightlightPink = UIColor(hex: "d3ffce")
    static let lightPurple = UIColor(hex: "e6e6fa")
    static let lightGreen = UIColor(hex: "F0F6DA")
    static let lightOlive = UIColor(hex: "f6eeda")

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
    convenience init(red : Int , green : Int , Blue: Int , alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(Blue) / 255.0,
            alpha : alpha
        )
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
    convenience init(hex : String , alpha: CGFloat = 1.0) {
        
        let index0 = hex.index(hex.startIndex, offsetBy: 0)
        let index1 = hex.index(hex.startIndex, offsetBy: 1)
        let index2 = hex.index(hex.startIndex, offsetBy: 2)
        let index3 = hex.index(hex.startIndex, offsetBy: 3)
        let index4 = hex.index(hex.startIndex, offsetBy: 4)
        let index5 = hex.index(hex.startIndex, offsetBy: 5)
        
        let redHexStr = String(hex[index0...index1])     // "12"
        let greedHexStr = String(hex[index2...index3])     // "34"
        let blueHexStr = String(hex[index4...index5])     // "56"
        
        let red = UInt8(redHexStr, radix: 16)
        let green = UInt8(greedHexStr, radix: 16)
        let blue = UInt8(blueHexStr, radix: 16)
        
        self.init(
            red: CGFloat(red!) / 255.0,
            green: CGFloat(green!) / 255.0,
            blue: CGFloat(blue!) / 255.0,
            alpha : alpha
        )
        
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
    convenience init(hexint: Int , alpha : CGFloat = 1.0) {
        self.init(
            red : (CGFloat((hexint >> 16) & 0xFF)),
            green : (CGFloat((hexint >> 8) & 0xFF)),
            blue : (CGFloat(hexint & 0xFF)),
            alpha : alpha
        )
    }
    
    /**
     Make *red , green, blue, alpha hex CGFloat* to *UIColor*
     
     - Author:
     *Amir Hatami* **(Soonin)**
     - returns:
     UIColor
     - throws:
     Nothing
     - parameters:
     - red: CGFloat
     - green: CGFloat
     - blue: CGFloat
     - alpha: float number between 0 to 1
     */
    static func rgb(red: CGFloat , green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    /**
     Make *hex number* to *UIColor*
     
     - Author:
     *Amir Hatami* **(Soonin)**
     - returns:
     UIColor
     - throws:
     Nothing
     - parameters:
     - hex: hex number
     - alpha: float number between 0 to 1
     */
    static func hex(hex: Int, alpha : CGFloat = 1.0) -> UIColor {
        return UIColor(
            red : CGFloat((hex >> 16) & 0xFF),
            green : CGFloat((hex >> 8) & 0xFF),
            blue : CGFloat(hex & 0xFF),
            alpha : alpha
        )
    }
    
}//end of extension  UIColor


// pre-load one image from url and keep it on memory
func preLoadImage(imagePath : String) -> UIImage {
    
    var image : UIImage = UIImage(named: "questionMark") ?? #imageLiteral(resourceName: "questionMark")
    let url = URL(string: imagePath)
    let data = try? Data(contentsOf: url!)
    
    if let imageData = data {
        image = UIImage(data: imageData)!
    } else {
        //keep image init Value
    }
    return image
    
}

extension String {
    /*
     Truncates the string to the specified length number of characters and appends an optional trailing string if longer.
     - Parameter length: Desired maximum lengths of a string
     - Parameter trailing: A 'String' that will be appended after the truncation.
     
     - Returns: 'String' object.
     */
    func trunc(length: Int, trailing: String = "…") -> String {
        return (self.count > length) ? self.prefix(length) + trailing : self
    }
}

class DetailsTapGesture: UITapGestureRecognizer {
    var pageName = String()
    var cvInfo :CV?
}



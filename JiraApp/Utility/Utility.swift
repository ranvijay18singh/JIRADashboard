//
//  Utility.swift
//  SwiftPOCConfiguration
//
//  Created by Amit Kumar Pandey on 09/03/17.
//
//

import Foundation

class Utility: NSObject
{
    static let sharedUtility = Utility()
    
    private override init() {
    }
    
//    class func hexStringToUIColor (hex:String) -> UIColor {
//        
//        var cString:String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
//        
//        if (cString.hasPrefix("#")) {
//            cString = cString.substring(from: cString.index(after: cString.startIndex))
//        }
//        
//        if ((cString.characters.count) != 6) {
//            return UIColor.white
//        }
//        
//        var rgbValue:UInt32 = 0
//        Scanner(string: cString).scanHexInt32(&rgbValue)
//        
//        return UIColor(
//            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
//            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
//            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
//            alpha: CGFloat(1.0)
//        )
//    }
    
    class func urlEncodedString_ch(emailStr: String) -> String {
        
        let output = NSMutableString()
        guard let source = emailStr.cString(using: String.Encoding.utf8) else {
            return emailStr
        }
        let sourceLen = source.count
        
        var i = 0
        while i < sourceLen - 1 {
            let thisChar = source[i]
            if thisChar == 32 {
                output.append("+")
            }
            else {
                output.appendFormat("%c", thisChar)
            }
            i += 1
        }
        
        return output as String
    }

    class func calculateCoordinateForSubView(marginPercent:Float, relativeViewCoordinate:Float) -> Float {
        
        let relativeCoordinate:Float
        
        relativeCoordinate = marginPercent * relativeViewCoordinate / 100
        
        return relativeCoordinate
    }
    
}

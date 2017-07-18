//
//  Utility.swift
//  SwiftPOCConfiguration
//
//  Created by Amit Kumar Pandey on 09/03/17.
//
//

import Foundation
import UIKit

class Utility: NSObject
{
    static let sharedUtility = Utility()
    
    private override init() {
    }
    
    //Show and remove activity indicator
    
    class func showActivityIndicatorWithMsg (_ message : String) {
        DispatchQueue.main.async(execute: { () -> Void in
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            var activityIndicator = UIActivityIndicatorView()
            activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
            activityIndicator.color = UIColor.black
            activityIndicator.tag = 101
            let view :UIView = UIView()
            view.backgroundColor = UIColor.white
            view.layer.masksToBounds = true
            view.layer.cornerRadius = 5
            view.layer.borderWidth = (0.2)
            view.tag = 103
            let msgLabel = UILabel()
            msgLabel.text = message
            msgLabel.tag = 102
            msgLabel.textColor = UIColor.gray
            msgLabel.font = UIFont.systemFont(ofSize: 15)
            msgLabel.textAlignment = NSTextAlignment.center
            
            if let window :UIWindow = UIApplication.shared.keyWindow {
                
                window.isUserInteractionEnabled = false
                view.addSubview(activityIndicator)
                view.addSubview(msgLabel)
                window.addSubview(view)
                view.frame = CGRect(x: (window.frame.size.width-130)/2, y: window.center.y
                    , width: 130, height: 80)
                
                msgLabel.frame = CGRect(x: 0,y: 35, width: 130, height: 40)
                activityIndicator.frame = CGRect(x: 45,y: 10, width: 40, height: 40)
                activityIndicator.startAnimating()
            }
        }
        )
    }
    class func hideActivityIndicator (){
        DispatchQueue.main.async(execute: { () -> Void in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if let window :UIWindow = UIApplication.shared.keyWindow {
                window.isUserInteractionEnabled = true
                if((window.viewWithTag(103)) != nil){
                    let viewContainer: UIView = window.viewWithTag(103)!
                    let activityIndicator = viewContainer.viewWithTag(101) as! UIActivityIndicatorView
                    let msgLbl = viewContainer.viewWithTag(102) as! UILabel
                    viewContainer.removeFromSuperview()
                    msgLbl.removeFromSuperview()
                    activityIndicator.removeFromSuperview()
                }
            }
        })
    }
    
    
    
    
    // Validate the Email Address Format
    class func isEmailValid (_ emailString : String) -> Bool {
        let searchForMe = "@"
        let rangeOfString : Range! = emailString.range(of: searchForMe)
        if rangeOfString == nil {
            return false
        }
        
        let emailArray : Array? = emailString.components(separatedBy: searchForMe)
        if emailArray![0].characters.count == 0 || emailArray?.last!.characters.count == 0{
            return false
        }
        
        let searchFor = "."
        let rangeOfDot : Range! = (emailArray![1] as String).range(of: searchFor)
        if rangeOfDot == nil {
            return false
        }else {
            let arrayDotEmail : Array? = (emailArray![1] as String).components(separatedBy: searchFor)
            let charCountAfterDot = arrayDotEmail![1].characters.count
            if charCountAfterDot < 2 {
                return false
            }
            let letters = CharacterSet(charactersIn: "1234567890")
            let range = arrayDotEmail![1].rangeOfCharacter(from: letters)
            if range != nil {
                return false
            }
        }
        
        let dotToCount = ".."
        let doubleDotArray = emailString.components(separatedBy: dotToCount)
        if doubleDotArray.count > 1 {
            return false
        }
        
        let dotAtTheRateToCount = ".@"
        let dotAtTheRateToArray = emailString.components(separatedBy: dotAtTheRateToCount)
        if dotAtTheRateToArray.count > 1 {
            return false
        }
        let atTheRateDotToCount = "@."
        let atTheRateDotArray = emailString.components(separatedBy: atTheRateDotToCount)
        if atTheRateDotArray.count > 1 {
            return false
        }
        return true
        
    }
    
    //Create the alert view 
    
    class func createAlertView(_ message: String?, andTitle title : String?, buttonTitle : String?, controllerObject : AnyObject) {
        DispatchQueue.main.async(execute: { () -> Void in
            let alertMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
            controllerObject.present(alertMessage, animated: true, completion: nil)
        }
        )
        
    }
    
    
    
    
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

//
//  Utility.swift
//  SwiftPOCConfiguration
//
//  Created by Abhinav Saldi on 09/03/17.
//
//

import Foundation

class Utility: NSObject
{
    static let sharedUtility = Utility()
    
    private override init() {
    }
    
    class func hexStringToUIColor (hex:String) -> UIColor {
        
        var cString:String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = cString.substring(from: cString.index(after: cString.startIndex))
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.white
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
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
//            else if thisChar == 46 || thisChar == 45 || thisChar == 95 || thisChar == 126 ||
//                (thisChar >= 97 && thisChar <= 122) ||
//                (thisChar >= 65 && thisChar <= 90) ||
//                (thisChar >= 48 && thisChar <= 57) {
//                output.appendFormat("%c", thisChar)
//            } else {
//                output.appendFormat("%%%02X", thisChar)
//            }
            
            i += 1
        }
        
        return output as String
    }

    class func calculateCoordinateForSubView(marginPercent:Float, relativeViewCoordinate:Float) -> Float {
        
        let relativeCoordinate:Float
        
        relativeCoordinate = marginPercent * relativeViewCoordinate / 100
        
        return relativeCoordinate
    }
    
//    class func initialiseViewLayout(viewLayout:LayoutObject, relativeViewFrame:CGRect) -> CGRect {
//        
//        var xAxis:Float = 0
//        var yAxis:Float = 0
//        var width:Float = 100
//        var height:Float = 100
//        
//        let relativeViewWidth:Float = Float(relativeViewFrame.size.width)
//        let relativeViewHeight:Float = Float(relativeViewFrame.size.height)
//        
//        if (viewLayout.xAxis != nil) {
//            
//            xAxis = viewLayout.xAxis!
//        }
//        else if viewLayout.isVerticallyCentered == true {
//            
//            xAxis = Float(UIScreen.main.bounds.size.width / 2) - viewLayout.width!/2
//        }
//        else if (viewLayout.leftMargin != nil) {
//            
//            xAxis = Utility.calculateCoordinateForSubView(marginPercent: viewLayout.leftMargin!, relativeViewCoordinate: relativeViewWidth)
//        }
//        else if viewLayout.rightMargin != nil {
//            
//            xAxis = relativeViewWidth - Utility.calculateCoordinateForSubView(marginPercent: viewLayout.rightMargin!, relativeViewCoordinate: relativeViewWidth)
//            xAxis = xAxis - viewLayout.width!
//        }
//        
//        if (viewLayout.width != nil) {
//            
//            width = viewLayout.width!
//        }
//        else if (viewLayout.maxWidth != nil)
//        {
//            width = viewLayout.maxWidth!
//        }
//        else {
//            
//            width = Utility.calculateCoordinateForSubView(marginPercent: (100.0 - viewLayout.rightMargin! - viewLayout.leftMargin!), relativeViewCoordinate: relativeViewWidth)
//        }
//        
//        if (viewLayout.yAxis != nil) {
//            
//            yAxis = viewLayout.yAxis!
//        }
//        else if (viewLayout.topMargin != nil) {
//            yAxis = Utility.calculateCoordinateForSubView(marginPercent: viewLayout.topMargin!, relativeViewCoordinate: relativeViewHeight)
//        }
//        else if (viewLayout.bottomMargin != nil) {
//            
//            yAxis = relativeViewHeight - Utility.calculateCoordinateForSubView(marginPercent: viewLayout.bottomMargin!, relativeViewCoordinate: relativeViewHeight)
//            yAxis = yAxis - viewLayout.height!
//        }
//        
//        if (viewLayout.height != nil) {
//            
//            height = viewLayout.height!
//        }
//        else {
//            
//            height = Utility.calculateCoordinateForSubView(marginPercent: (100.0 - viewLayout.bottomMargin! - viewLayout.topMargin!), relativeViewCoordinate: relativeViewHeight)
//        }
//        
//        let viewFrame:CGRect = CGRect(x: CGFloat(xAxis), y: CGFloat(yAxis), width: CGFloat(width), height: CGFloat(height))
//        
//        return viewFrame
//    }
//    
//    class func fetchLabelLayoutDetails(labelObject:SFLabelObject) -> LayoutObject {
//        
//        var labelLayout:LayoutObject?
//        
//        if Constants.IPHONE {
//            
//            labelLayout = labelObject.layoutObjectDict["\(Constants.kSTRING_IPHONE_ORIENTATION_TYPE)"]
//        }
//        else {
//            
//            if UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height {
//                
//                labelLayout = labelObject.layoutObjectDict["\(Constants.kSTRING_IPAD_LANDSCAPE_ORIENTATION_TYPE)"]
//            }
//            else {
//                
//                labelLayout = labelObject.layoutObjectDict["\(Constants.kSTRING_IPAD_PORTRAIT_ORIENTATION_TYPE)"]
//            }
//        }
//        
//        return labelLayout!
//    }
//    
//    class func fetchButtonLayoutDetails(buttonObject:SFButtonObject) -> LayoutObject {
//        
//        var buttonLayout:LayoutObject?
//        
//        if Constants.IPHONE {
//            
//            buttonLayout = buttonObject.layoutObjectDict["\(Constants.kSTRING_IPHONE_ORIENTATION_TYPE)"]
//        }
//        else {
//            
//            if UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height {
//                
//                buttonLayout = buttonObject.layoutObjectDict["\(Constants.kSTRING_IPAD_LANDSCAPE_ORIENTATION_TYPE)"]
//            }
//            else {
//                
//                buttonLayout = buttonObject.layoutObjectDict["\(Constants.kSTRING_IPAD_PORTRAIT_ORIENTATION_TYPE)"]
//            }
//        }
//        
//        return buttonLayout!
//    }
//    
//    class func fetchImageLayoutDetails(imageObject:SFImageObject) -> LayoutObject {
//        
//        var imageLayout:LayoutObject?
//        
//        if Constants.IPHONE {
//            
//            imageLayout = imageObject.layoutObjectDict["\(Constants.kSTRING_IPHONE_ORIENTATION_TYPE)"]
//        }
//        else {
//            
//            if UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height {
//                
//                imageLayout = imageObject.layoutObjectDict["\(Constants.kSTRING_IPAD_LANDSCAPE_ORIENTATION_TYPE)"]
//            }
//            else {
//                
//                imageLayout = imageObject.layoutObjectDict["\(Constants.kSTRING_IPAD_PORTRAIT_ORIENTATION_TYPE)"]
//            }
//        }
//        
//        return imageLayout!
//    }
//    
//    class func fetchStarRatingLayoutDetails(starRatingObject:SFStarRatingObject) -> LayoutObject {
//        
//        var starRatingLayout:LayoutObject?
//        
//        if Constants.IPHONE {
//            
//            starRatingLayout = starRatingObject.layoutObjectDict["\(Constants.kSTRING_IPHONE_ORIENTATION_TYPE)"]
//        }
//        else {
//            
//            if UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height {
//                
//                starRatingLayout = starRatingObject.layoutObjectDict["\(Constants.kSTRING_IPAD_LANDSCAPE_ORIENTATION_TYPE)"]
//            }
//            else {
//                
//                starRatingLayout = starRatingObject.layoutObjectDict["\(Constants.kSTRING_IPAD_PORTRAIT_ORIENTATION_TYPE)"]
//            }
//        }
//        
//        return starRatingLayout!
//    }
//    
//    class func fetchTextViewLayoutDetails(textViewObject:SFTextViewObject) -> LayoutObject {
//        
//        var textViewLayout:LayoutObject?
//        
//        if Constants.IPHONE {
//            
//            textViewLayout = textViewObject.layoutObjectDict["\(Constants.kSTRING_IPHONE_ORIENTATION_TYPE)"]
//        }
//        else {
//            
//            if UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height {
//                
//                textViewLayout = textViewObject.layoutObjectDict["\(Constants.kSTRING_IPAD_LANDSCAPE_ORIENTATION_TYPE)"]
//            }
//            else {
//                
//                textViewLayout = textViewObject.layoutObjectDict["\(Constants.kSTRING_IPAD_PORTRAIT_ORIENTATION_TYPE)"]
//            }
//        }
//        
//        return textViewLayout!
//    }
//    
//    class func fetchCastViewLayoutDetails(castViewObject:SFCastViewObject) -> LayoutObject {
//        
//        var textViewLayout:LayoutObject?
//        
//        if Constants.IPHONE {
//            
//            textViewLayout = castViewObject.layoutObjectDict["\(Constants.kSTRING_IPHONE_ORIENTATION_TYPE)"]
//        }
//        else {
//            
//            if UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height {
//                
//                textViewLayout = castViewObject.layoutObjectDict["\(Constants.kSTRING_IPAD_LANDSCAPE_ORIENTATION_TYPE)"]
//            }
//            else {
//                
//                textViewLayout = castViewObject.layoutObjectDict["\(Constants.kSTRING_IPAD_PORTRAIT_ORIENTATION_TYPE)"]
//            }
//        }
//        
//        return textViewLayout!
//    }
//    
//    class func fetchSeparatorViewLayoutDetails(separatorViewObject:SFSeparatorViewObject) -> LayoutObject {
//        
//        var separatorViewLayout:LayoutObject?
//        
//        if Constants.IPHONE {
//            
//            separatorViewLayout = separatorViewObject.layoutObjectDict["\(Constants.kSTRING_IPHONE_ORIENTATION_TYPE)"]
//        }
//        else {
//            
//            if UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height {
//                
//                separatorViewLayout = separatorViewObject.layoutObjectDict["\(Constants.kSTRING_IPAD_LANDSCAPE_ORIENTATION_TYPE)"]
//            }
//            else {
//                
//                separatorViewLayout = separatorViewObject.layoutObjectDict["\(Constants.kSTRING_IPAD_PORTRAIT_ORIENTATION_TYPE)"]
//            }
//        }
//        
//        return separatorViewLayout!
//    }
//    
//    class func fetchCollectionGridLayoutDetails(collectionGridObject:SFCollectionGridObject) -> LayoutObject {
//        
//        var collectionGridLayout:LayoutObject?
//        
//        if Constants.IPHONE {
//            
//            collectionGridLayout = collectionGridObject.layoutObjectDict["\(Constants.kSTRING_IPHONE_ORIENTATION_TYPE)"]
//        }
//        else {
//            
//            if UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height {
//                
//                collectionGridLayout = collectionGridObject.layoutObjectDict["\(Constants.kSTRING_IPAD_LANDSCAPE_ORIENTATION_TYPE)"]
//            }
//            else {
//                
//                collectionGridLayout = collectionGridObject.layoutObjectDict["\(Constants.kSTRING_IPAD_PORTRAIT_ORIENTATION_TYPE)"]
//            }
//        }
//        
//        return collectionGridLayout!
//    }
//    
//    class func fetchTrayLayoutDetails(trayObject:SFTrayObject) -> LayoutObject {
//        
//        var trayLayout:LayoutObject?
//        
//        if Constants.IPHONE {
//            
//            trayLayout = trayObject.layoutObjectDict["\(Constants.kSTRING_IPHONE_ORIENTATION_TYPE)"]
//        }
//        else {
//            
//            if UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height {
//                
//                trayLayout = trayObject.layoutObjectDict["\(Constants.kSTRING_IPAD_LANDSCAPE_ORIENTATION_TYPE)"]
//            }
//            else {
//                
//                trayLayout = trayObject.layoutObjectDict["\(Constants.kSTRING_IPAD_PORTRAIT_ORIENTATION_TYPE)"]
//            }
//        }
//        
//        return trayLayout!
//    }
//    
//    
//    class func fetchVideoDetailLayoutDetails(videoDetailObject: SFVideoDetailModuleObject) -> LayoutObject
//    {
//        var videoLayout:LayoutObject?
//        
//        if Constants.IPHONE {
//            
//            videoLayout = videoDetailObject.layoutObjectDict["\(Constants.kSTRING_IPHONE_ORIENTATION_TYPE)"]
//        }
//        else {
//            
//            if UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height {
//                
//                videoLayout = videoDetailObject.layoutObjectDict["\(Constants.kSTRING_IPAD_LANDSCAPE_ORIENTATION_TYPE)"]
//            }
//            else {
//                
//                videoLayout = videoDetailObject.layoutObjectDict["\(Constants.kSTRING_IPAD_PORTRAIT_ORIENTATION_TYPE)"]
//            }
//        }
//        return videoLayout!
//    }
//    
//    class func fetchProgresViewLayoutDetails(progressViewObject:SFProgressViewObject) -> LayoutObject {
//        
//        var progressViewLayout:LayoutObject?
//        
//        if Constants.IPHONE {
//            
//            progressViewLayout = progressViewObject.layoutObjectDict["\(Constants.kSTRING_IPHONE_ORIENTATION_TYPE)"]
//        }
//        else {
//            
//            if UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height {
//                
//                progressViewLayout = progressViewObject.layoutObjectDict["\(Constants.kSTRING_IPAD_LANDSCAPE_ORIENTATION_TYPE)"]
//            }
//            else {
//                
//                progressViewLayout = progressViewObject.layoutObjectDict["\(Constants.kSTRING_IPAD_PORTRAIT_ORIENTATION_TYPE)"]
//            }
//        }
//        
//        return progressViewLayout!
//    }
//    
//    class func fetchCarouselLayoutDetails(carouselViewObject:SFJumbotronObject) -> LayoutObject {
//        
//        var carouselViewLayout:LayoutObject?
//        
//        if Constants.IPHONE {
//            
//            carouselViewLayout = carouselViewObject.layoutObjectDict["\(Constants.kSTRING_IPHONE_ORIENTATION_TYPE)"]
//        }
//        else {
//            
//            if UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height {
//                
//                carouselViewLayout = carouselViewObject.layoutObjectDict["\(Constants.kSTRING_IPAD_LANDSCAPE_ORIENTATION_TYPE)"]
//            }
//            else {
//                
//                carouselViewLayout = carouselViewObject.layoutObjectDict["\(Constants.kSTRING_IPAD_PORTRAIT_ORIENTATION_TYPE)"]
//            }
//        }
//        
//        return carouselViewLayout!
//    }
//    
//    class func fetchPageControlLayoutDetails(pageControlObject:SFPageControlObject) -> LayoutObject {
//        
//        var pageControlLayout:LayoutObject?
//        
//        if Constants.IPHONE {
//            
//            pageControlLayout = pageControlObject.layoutObjectDict["\(Constants.kSTRING_IPHONE_ORIENTATION_TYPE)"]
//        }
//        else {
//            
//            if UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height {
//                
//                pageControlLayout = pageControlObject.layoutObjectDict["\(Constants.kSTRING_IPAD_LANDSCAPE_ORIENTATION_TYPE)"]
//            }
//            else {
//                
//                pageControlLayout = pageControlObject.layoutObjectDict["\(Constants.kSTRING_IPAD_PORTRAIT_ORIENTATION_TYPE)"]
//            }
//        }
//        
//        return pageControlLayout!
//    }
    
    class func addGradientToView(mainView:UIView) {
        
        let size = mainView.bounds.size
        let path:UIBezierPath = UIBezierPath.init()
        path.move(to: CGPoint(x: 0, y: size.height * 0.5))
        path.addLine(to: CGPoint(x: size.width, y: size.height * 0.5))
        path.addLine(to: CGPoint(x: size.width, y: size.height))
        path.addLine(to: CGPoint(x: 0, y: size.height))
        
        mainView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOffset = CGSize(width: 10, height: 10)
        mainView.layer.shadowOpacity = 0.7
        mainView.layer.shadowRadius = 50
        mainView.layer.shadowPath = path.cgPath
    }
    
    class func presentAlertController(alertTitle: String, alertMessage:String, alertActions:Array<UIAlertAction>) -> UIAlertController {
        
        let alertController:UIAlertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        for action:UIAlertAction in alertActions {
            
            alertController.addAction(action)
        }
        
        return alertController
    }
    
//    class func getBaseScreenHeightMultiplier() -> CGFloat {
//    
//        var baseScreenMultiplier:CGFloat = 0.0
//        let heightOfScreen = UIScreen.main.bounds.size.height
//        let widthOfScreen = UIScreen.main.bounds.size.width
//        
//        if Constants.IPHONE {
//            
//            if heightOfScreen > widthOfScreen {
//                
//                baseScreenMultiplier = heightOfScreen / 667
//            }
//            else {
//                
//                baseScreenMultiplier = heightOfScreen / 375
//            }
//        }
//        else {
//            
//            if heightOfScreen > widthOfScreen {
//                
//                baseScreenMultiplier = heightOfScreen / 1024
//            }
//            else {
//                
//                baseScreenMultiplier = heightOfScreen / 768
//            }
//        }
//        
//        return baseScreenMultiplier
//    }
//    
//    class func getBaseScreenWidthMultiplier() -> CGFloat {
//        
//        var baseScreenMultiplier:CGFloat = 0.0
//        let heightOfScreen = UIScreen.main.bounds.size.height
//        let widthOfScreen = UIScreen.main.bounds.size.width
//        
//        if Constants.IPHONE {
//            
//            if heightOfScreen > widthOfScreen {
//                
//                baseScreenMultiplier = widthOfScreen / 375
//            }
//            else {
//                
//                baseScreenMultiplier = widthOfScreen / 667
//            }
//        }
//        else {
//            
//            if heightOfScreen > widthOfScreen {
//                
//                baseScreenMultiplier = widthOfScreen / 768
//            }
//            else {
//                
//                baseScreenMultiplier = widthOfScreen / 1024
//            }
//        }
//        
//        return baseScreenMultiplier
//    }
//    
//    
//    class func fetchLayoutDetailsFromDictionary(layoutObjectDict:Dictionary<String, LayoutObject>) -> LayoutObject {
//        
//        var layoutObject:LayoutObject?
//        
//        if Constants.IPHONE {
//            
//            layoutObject = layoutObjectDict["\(Constants.kSTRING_IPHONE_ORIENTATION_TYPE)"]
//        }
//        else {
//            
//            if UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height {
//                
//                layoutObject = layoutObjectDict["\(Constants.kSTRING_IPAD_LANDSCAPE_ORIENTATION_TYPE)"]
//            }
//            else {
//                
//                layoutObject = layoutObjectDict["\(Constants.kSTRING_IPAD_PORTRAIT_ORIENTATION_TYPE)"]
//            }
//        }
//        
//        return layoutObject!
//    }
    
    //MARK: method to create title view
    class func createNavigationTitleView(navBarHeight:CGFloat) -> UIImageView {
        
        let image = UIImage(named: "sfnavlogo")
        let titleLogo = UIImageView(image: image)
        titleLogo.contentMode = .scaleAspectFit
        
        let xAxis:CGFloat = UIScreen.main.bounds.size.width / 2 - (image?.size.width)!/2
        let yAxis:CGFloat = navBarHeight/2 - (image?.size.height)!/2 - 5
        
        titleLogo.frame = CGRect(x: xAxis, y: yAxis, width: (image?.size.width)!, height: (image?.size.height)!)
        
        return titleLogo
    }
    
    
    //MARK: method to get uuid from sskeychain
//    func getUUID() -> String {
//        
//        let retrieveUUID = SSKeychain.password(forService: Bundle.main.bundleIdentifier!, account: "user")
//        
//        if retrieveUUID != nil {
//            
//            return retrieveUUID!
//        }
//        else {
//            
//            return generateUUID()
//        }
//    }
//    
//    func generateUUID() -> String {
//        
//        let theUUID:CFUUID = CFUUIDCreate(kCFAllocatorDefault)
//        
//        let string:CFString = CFUUIDCreateString(kCFAllocatorDefault, theUUID)
//        
//        let uuid:String = string as String
//        
//        SSKeychain.setPassword(uuid, forService: Bundle.main.bundleIdentifier!, account: "user")
//        
//        return uuid
//    }
}

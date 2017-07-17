//
//  Constants.swift
//  SwiftPOCConfiguration
//
//  Created by Amit Kumar Pandey on 09/03/17.
//
//

import Foundation
import UIKit

class Constants
{
    //MARK:
    //MARK: COMMON Constants
    //MARK:

    #if os(iOS)
        static let IPHONE = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    #endif
    static let kSTRING_IPHONE_ORIENTATION_TYPE = "iPhone"
    static let kSTRING_IPAD_LANDSCAPE_ORIENTATION_TYPE = "iPadLandscape"
    static let kSTRING_IPAD_PORTRAIT_ORIENTATION_TYPE = "iPadPortrait"
    static let kSTANDARDUSERDEFAULTS = UserDefaults.standard
    static let kUSERID = "UserId"
    static let kAPPDELEGATE:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    static let kNetWorkStatus = "networkStatus"
    static let kStrCancel = "Cancel"
    static let kStrRetry = "Retry"
    static let kInternetConnection = "Internet Connection"
    static let kInternetConntectionRefresh = "There is an error loading \(Bundle.main.infoDictionary?["CFBundleDisplayName"] ?? ""). Please check your Internet Connection and try again later"
    static let kVideoImagePlaceholder = "videoImagePlaceholder"
    
    //MARK:
    //MARK: FONT Constants
    //MARK:
    struct Font {
        static let FONT_TITLE_LABEL_IPHONE = UIFont(name: "Roboto-Medium", size: 13.0)
        static let FONT_TITLE_LABEL_IPAD = UIFont(name: "Roboto-Regular", size: 17.0)
        static let FONT_GRID_SUBTITLE_IPHONE = UIFont(name: "OpenSans-SemiboldItalic", size: 10.0)
        static let FONT_GRID_SUBTITLE_IPAD = UIFont(name: "OpenSans-SemiboldItalic", size: 12.0)
        static let FONT_POSTER_TITLE_LABEL_IPHONE = UIFont(name: "Roboto-Bold", size: 12.0)
        static let FONT_POSTER_SUBTITLE_LABEL_IPHONE = UIFont(name: "Roboto-Light", size: 12.0)
        static let FONT_POSTER_TITLE_LABEL_IPAD = UIFont(name: "Roboto-Bold", size: 14.0)
        static let FONT_POSTER_SUBTITLE_LABEL_IPAD = UIFont(name: "Roboto-Light", size: 14.0)
    }

}


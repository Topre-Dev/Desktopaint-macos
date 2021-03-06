//
//  AppInfo.swift
//  Desktopaint-core
//
//  Created by Nghia Tran on 5/31/18.
//  Copyright © 2020 com.topre.Desktopaint.core. All rights reserved.
//

import Foundation

public struct AppInfo {

    public static let current = AppInfo(bundleInfo: Bundle.main.infoDictionary!)
    
    public let appVersion: String
    public let buildNumber: String

    private init(bundleInfo: [String: Any]) {
        appVersion = bundleInfo["CFBundleShortVersionString"] as! String
        buildNumber = bundleInfo["CFBundleVersion"] as! String
    }
}

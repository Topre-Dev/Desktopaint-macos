//
//  PushAction.swift
//  artify-core
//
//  Created by Nghia Tran on 6/19/18.
//  Copyright © 2018 com.art.artify.core. All rights reserved.
//

import Foundation
import NotificationCenter

enum PushContentType {
    case applyWallpaperSuccess
}

// MARK: - PushContentType
protocol PushContent {

    // Type
    var type: PushContentType { get }

    // Contents
    var title: String { get }
    var subTitle: String? { get }
    var message: String { get }

    // Actions
    var actions: [PushAction] { get }

    // Options
    var sound: String { get }
    var imageName: String { get }
}

// MARK: - Default PushContentType
extension PushContent {

    // Default sound
    var sound: String { return NSUserNotificationDefaultSoundName }

    // Default Image
    var imageName: String { return "" }

    // Sub title
    var subTitle: String? { return nil }

    // Sub actions
    var actions: [PushAction] { return [] }

    // Build
    func build() -> NSUserNotification {
        let noti = NSUserNotification()

        // Content
        noti.title = title
        noti.subtitle = subTitle
        noti.informativeText = message

        // Sound
        noti.soundName = sound

        // Image
        //        if let appIconPath = Bundle.allBundles.first!.pathForImageResource("AppIcon") {
        //            noti.contentImage = NSImage(contentsOfFile: appIconPath)
        //        }

        // Action
        noti.hasActionButton = !actions.isEmpty

        // Add Buttons
        actions.forEach { (action) in
            switch action.type {
            case .closeNotification:
                noti.otherButtonTitle = action.title
            case .openURL:
                noti.actionButtonTitle = action.title
                noti.userInfo = action.userInfo
            }
        }
        return noti
    }
}

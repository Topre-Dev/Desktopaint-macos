//
//  TrackingService.swift
//  artify-core
//
//  Created by Nghia Tran on 6/4/18.
//  Copyright © 2018 com.art.artify.core. All rights reserved.
//

import Foundation

public protocol Trackable {

    func tracking(_ type: TrackingService.Kind)
}

public protocol TrackingServiceType {

    func tracking(_ type: TrackingService.Kind)
}

public final class TrackingService: TrackingServiceType {

    public enum Kind {
        case openApp
        case exitApp
        case fetchFeaturePhoto(FetchFeaturePhotoParam)
        case launchOnStartup(LaunchOnStartupParam)
        case setWallapper(SetWallpaperParam)

        public var methodName: String {
            switch self {
            case .openApp:
                return "Open app"
            case .exitApp:
                return "Exit app"
            case .fetchFeaturePhoto:
                return "Fetch feature photo"
            case .launchOnStartup:
                return "Launch on startup"
            case .setWallapper:
                return "Set wallpaper"
            }
        }
    }

    // MARK: - Variable
    private let trackable: Trackable

    // MARK: - Init
    public init(trackable: Trackable) {
        self.trackable = trackable
    }

    public func tracking(_ type: TrackingService.Kind) {
        trackable.tracking(type)
    }
}

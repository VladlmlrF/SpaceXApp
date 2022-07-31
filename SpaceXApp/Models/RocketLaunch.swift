//
//  RocketLaunch.swift
//  SpaceXApp
//
//  Created by Anastasia on 28.07.22.
//

import Foundation

struct RocketLaunch {
    let launchName: String
    let date: String
    let isLaunchSucceded: Bool
    
    var imageName: String {
        return isLaunchSucceded ? "launchSucces" : "launchFail"
    }
}

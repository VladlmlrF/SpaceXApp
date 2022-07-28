//
//  File.swift
//  SpaceXApp
//
//  Created by Anastasia on 28.07.22.
//

import Foundation

struct Settings {
    enum LengthUnit {
        case m
        case ft
        
        var title: String {
            switch self {
            case .m:
                return "m"
            case .ft:
                return "ft"
            }
        }
    }
    
    enum MassUnit {
        case kg
        case ib
        
        var title: String {
            switch self {
            case .kg:
                return "kg"
            case .ib:
                return "ib"
            }
        }
    }

    let height: LengthUnit
    let diameter: LengthUnit
    
    let weight: MassUnit
    let payload: MassUnit
    
}

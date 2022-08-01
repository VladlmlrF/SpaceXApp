//
//  File.swift
//  SpaceXApp
//
//  Created by Anastasia on 28.07.22.
//

import Foundation

struct Settings {
    enum LengthUnit: Int {
        case m
        case ft
    }
    
    enum MassUnit: Int {
        case kg
        case lb
    }

    var height: LengthUnit
    var diameter: LengthUnit
    
    var weight: MassUnit
    var payload: MassUnit
    
}

//
//  File.swift
//  SpaceXApp
//
//  Created by Anastasia on 28.07.22.
//

import Foundation

struct Settings {
    enum LengthUnit: String {
        case m
        case ft
    }
    
    enum MassUnit: String {
        case kg
        case lb
    }

    var height: LengthUnit
    var diameter: LengthUnit
    var weight: MassUnit
    var payload: MassUnit
}

//
//  File.swift
//  SpaceXApp
//
//  Created by Anastasia on 28.07.22.
//

import Foundation

struct Settings {
    enum LengthUnit: String {
        case m = "м"
        case ft = "фут"
    }
    
    enum MassUnit: String {
        case kg = "кг"
        case ib = "фунт"
    }

    var height: LengthUnit
    var diameter: LengthUnit
    
    var weight: MassUnit
    var payload: MassUnit
    
}

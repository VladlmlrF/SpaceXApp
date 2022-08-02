//
//  File.swift
//  SpaceXApp
//
//  Created by Anastasia on 28.07.22.
//

struct Settings {
    enum LengthUnit: String {
        case m
        case ft
        
        var text: String {
            switch self {
            case .m:
                return "м"
            case .ft:
                return "фут"
            }
        }
        
        func format(value: Double) -> String {
            switch self {
            case .m:
                return String(value)
            case .ft:
                return String(format: "%.2f", value * 3.28)
            }
        }
    }
    
    enum MassUnit: String {
        case kg
        case lb
        
        var text: String {
            switch self {
            case .kg:
                return "кг"
            case .lb:
                return "фунт"
            }
        }
        
        func format(value: Double) -> String {
            switch self {
            case .kg:
                return String(value)
            case .lb:
                return String(format: "%.2f", value * 2.2)
            }
        }
    }

    var height: LengthUnit
    var diameter: LengthUnit
    var weight: MassUnit
    var payload: MassUnit
}

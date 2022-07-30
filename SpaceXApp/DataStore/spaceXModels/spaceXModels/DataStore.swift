//
//  DataStore.swift
//  spaceXModels
//
//  Created by Владимир Фалин on 30.07.2022.
//

class DataStore {
    static let shared = DataStore()
    
    let images = ["falcon1", "falcon9", "falconHeavy", "starship"]
    let names = ["Falcon 1", "Falcon 9", "Falcon Heavy", "Starship"]
    let heights = [22.25, 70, 70, 118]
    let diameters = [1.68, 3.7, 12.2, 9]
    let masses = [30146.0, 549054, 1420788, 1335000]
    let loads = [450.0, 22800, 63800, 150000]
    let firstFlights = ["24.03.2006", "04.06.2010", "06.02.2018", "01.12.2021"]
    let countryes = ["Маршалловы острова", "США", "США", "США"]
    let costs = ["$6 млн", "$50 млн", "$90 млн", "$7 млн"]
    let firstStageEngines = ["1", "9", "27", "37"]
    let firstStageFuels = ["44,3", "385", "1155", "3300"]
    let firstStageBurns = ["169", "162", "162", "?"]
    let secondStageEngines = ["1", "1", "1", "6"]
    let secondStageFuels = ["3.38", "90", "90", "1200"]
    let secondStageBurns = ["378", "397", "397", "118"]
    
    private init() {}
}


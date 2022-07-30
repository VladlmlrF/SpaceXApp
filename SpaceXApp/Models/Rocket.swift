//
//  Rocket.swift
//  SpaceXApp
//
//  Created by Владимир Фалин on 30.07.2022.
//

struct Rocket {
    let image: String
    let name: String
    let height: Double
    let diameter: Double
    let mass: Double
    let load: Double
    let firstFlight: String
    let country: String
    let cost: String
    let firstStageEngines: String
    let firstStageFuel: String
    let firstStageBurn: String
    let secondStageEngines: String
    let secondStageFuel: String
    let secondStageBurn: String
}

extension Rocket {
    static func getRockets() -> [Rocket] {
        var rockets: [Rocket] = []
        
        let images = DataStore.shared.images
        let names = DataStore.shared.names
        let heights = DataStore.shared.heights
        let diameters = DataStore.shared.diameters
        let masses = DataStore.shared.masses
        let loads = DataStore.shared.loads
        let firstFlights = DataStore.shared.firstFlights
        let countryes = DataStore.shared.countryes
        let costs = DataStore.shared.costs
        let firstStageEngines = DataStore.shared.firstStageEngines
        let firstStageFuels = DataStore.shared.firstStageFuels
        let firstStageBurns = DataStore.shared.firstStageBurns
        let secondStageEngines = DataStore.shared.secondStageEngines
        let secondStageFuels = DataStore.shared.secondStageFuels
        let secondStageBurns = DataStore.shared.firstStageBurns
        
        for index in 0..<images.count {
            let rocket = Rocket(
                image: images[index],
                name: names[index],
                height: heights[index],
                diameter: diameters[index],
                mass: masses[index],
                load: loads[index],
                firstFlight: firstFlights[index],
                country: countryes[index],
                cost: costs[index],
                firstStageEngines: firstStageEngines[index],
                firstStageFuel: firstStageFuels[index],
                firstStageBurn: firstStageBurns[index],
                secondStageEngines: secondStageEngines[index],
                secondStageFuel: secondStageFuels[index],
                secondStageBurn: secondStageBurns[index]
            )
            rockets.append(rocket)
        }
        return rockets
    }
}

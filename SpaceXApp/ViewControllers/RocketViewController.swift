//
//  ViewController.swift
//  SpaceXApp
//
//  Created by Владимир Фалин on 26.07.2022.
//

import UIKit

class RocketViewController: UIViewController {

    @IBOutlet weak var rocketName: UILabel!
    
    var numberOfPages = 0
    var currentPage = 0
    var rocket: Rocket!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        rocketName.text = rocket.name
    }


}


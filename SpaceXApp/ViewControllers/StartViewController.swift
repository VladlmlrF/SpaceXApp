//
//  StartViewController.swift
//  SpaceXApp
//
//  Created by Владимир Фалин on 27.07.2022.
//

import UIKit

class StartViewController: UIViewController {

    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(someFunc),
            userInfo: nil,
            repeats: false
        )
    }

    @objc func someFunc() {
        performSegue(withIdentifier: "toMainScreen", sender: nil)
    }
}

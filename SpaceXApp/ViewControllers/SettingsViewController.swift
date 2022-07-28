//
//  ViewController.swift
//  SpaceXApp
//
//  Created by Владимир Фалин on 26.07.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet private var heightSegmentedControl: UISegmentedControl!
    @IBOutlet private var diameterSegmentedControl: UISegmentedControl!
    @IBOutlet private var massSegmentedControl: UISegmentedControl!
    @IBOutlet private var payloadSegmentedControl: UISegmentedControl!
    
    private let textUnselectedColor = UIColor.white
    private let textSelectedColor = UIColor.black
    var settings = Settings(
        height: .m,
        diameter: .m,
        weight: .kg,
        payload: .kg
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let segmentedControlers = [
            heightSegmentedControl,
            diameterSegmentedControl,
            massSegmentedControl,
            payloadSegmentedControl
        ]
        
        selectSegment(title: settings.height.title, in: heightSegmentedControl)
        selectSegment(title: settings.diameter.title, in: diameterSegmentedControl)
        selectSegment(title: settings.weight.title, in: massSegmentedControl)
        selectSegment(title: settings.payload.title, in: payloadSegmentedControl)
        
        
        for segmentedControler in segmentedControlers {
            segmentedControler?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: textUnselectedColor], for: .normal)
            segmentedControler?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: textSelectedColor], for: .selected)
        }
    }

    @IBAction func closeAction() {
        
    }
    
    private func selectSegment(title: String, in segmentedControl: UISegmentedControl) {
        for index in 0..<segmentedControl.numberOfSegments {
            if title == segmentedControl.titleForSegment(at: index) {
                segmentedControl.selectedSegmentIndex = index
                break
            }
        }
    }
    
}


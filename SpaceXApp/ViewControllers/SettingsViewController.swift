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

    var delegate: SettingsViewControllerDelegate!
    var heightIndex: Int!
    var diameterIndex: Int!
    var massIndex: Int!
    var loadIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let segmentedControlers = [
            heightSegmentedControl,
            diameterSegmentedControl,
            massSegmentedControl,
            payloadSegmentedControl
        ]
        
        heightSegmentedControl.selectedSegmentIndex = heightIndex
        diameterSegmentedControl.selectedSegmentIndex = diameterIndex
        massSegmentedControl.selectedSegmentIndex = massIndex
        payloadSegmentedControl.selectedSegmentIndex = loadIndex
        
        for segmentedControler in segmentedControlers {
            segmentedControler?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: textUnselectedColor], for: .normal)
            segmentedControler?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: textSelectedColor], for: .selected)
        }
    }

    @IBAction func closeAction() {
        delegate?.setUnits(
            settings: Settings(
                height: Settings.LengthUnit(rawValue: heightSegmentedControl.selectedSegmentIndex) ?? .m,
                diameter: Settings.LengthUnit(rawValue: diameterSegmentedControl.selectedSegmentIndex) ?? .m,
                weight: Settings.MassUnit(rawValue: massSegmentedControl.selectedSegmentIndex) ?? .kg,
                payload: Settings.MassUnit(rawValue: payloadSegmentedControl.selectedSegmentIndex) ?? .kg
            )
        )
        dismiss(animated: true)
    }
}


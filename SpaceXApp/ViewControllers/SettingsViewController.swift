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
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let segmentedControlers = [
            heightSegmentedControl,
            diameterSegmentedControl,
            massSegmentedControl,
            payloadSegmentedControl
        ]
        
        selectSegment(title: settings.height.rawValue, in: heightSegmentedControl)
        selectSegment(title: settings.diameter.rawValue, in: diameterSegmentedControl)
        selectSegment(title: settings.weight.rawValue, in: massSegmentedControl)
        selectSegment(title: settings.payload.rawValue, in: payloadSegmentedControl)
        
        for segmentedControler in segmentedControlers {
            segmentedControler?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: textUnselectedColor], for: .normal)
            segmentedControler?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: textSelectedColor], for: .selected)
        }
    }

    @IBAction func closeAction() {
        settings.height = Settings.LengthUnit(rawValue: heightSegmentedControl.selectedTitle()) ?? .m
        settings.diameter = Settings.LengthUnit(rawValue: diameterSegmentedControl.selectedTitle()) ?? .m
        settings.weight = Settings.MassUnit(rawValue: massSegmentedControl.selectedTitle()) ?? .kg
        settings.payload = Settings.MassUnit(rawValue: payloadSegmentedControl.selectedTitle()) ?? .kg
        delegate.setUnits(settings: settings)
        dismiss(animated: true)
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

private extension UISegmentedControl {
    func selectedTitle() -> String {
        self.titleForSegment(
            at: self.selectedSegmentIndex
        ) ?? ""
    }
}


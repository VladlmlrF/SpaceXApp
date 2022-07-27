//
//  ViewController.swift
//  SpaceXApp
//
//  Created by Владимир Фалин on 26.07.2022.
//

import UIKit

class RocketViewController: UIViewController {

    //MARK: - IB Outlets
    
    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var rocketNameLabel: UILabel!
    @IBOutlet weak var heightView: UIView!
    @IBOutlet weak var diameterView: UIView!
    @IBOutlet weak var massView: UIView!
    @IBOutlet weak var loadsView: UIView!
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var heightUnitLabel: UILabel!
    @IBOutlet weak var diameterValueLabel: UILabel!
    @IBOutlet weak var diameterUnitLabel: UILabel!
    @IBOutlet weak var massValueLabel: UILabel!
    @IBOutlet weak var massUnitLabel: UILabel!
    @IBOutlet weak var loadValueLabel: UILabel!
    @IBOutlet weak var loadUnitLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private properties
    
    private let showLaunchesButton = UIButton(type: .roundedRect)
    private let sectionNames = [
        "",
        "ПЕРВАЯ СТУПЕНЬ",
        "ВТОРАЯ СТУПЕНЬ"
    ]
    
    // MARK: - Properties
    
    var heightUnit = "м"
    var diameterUnit = "м"
    var massUnit = "кг"
    var loadUnit = "кг"
    
    var numberOfPages = 0
    var currentPage = 0
    var rocket: Rocket!
    
    // MARK: - view life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        rocketImageView.image = UIImage(named: rocket.image)
        
        backgroundView.backgroundColor = .black
        backgroundView.layer.cornerRadius = 30
        
        rocketNameLabel.text = rocket.name
        
        setupViews()
        
        heightValueLabel.text = rocket.height.formatted()
        heightUnitLabel.text = heightUnit
        
        diameterValueLabel.text = rocket.diameter.formatted()
        diameterUnitLabel.text = diameterUnit
        
        massValueLabel.text = rocket.mass.formatted()
        massUnitLabel.text = massUnit
        
        loadValueLabel.text = rocket.load.formatted()
        loadUnitLabel.text = loadUnit
        
        setupTableView()
    }
    
    // MARK: - IB Actions
    
    @IBAction func toSettings() {
        //Переход на экран с настройками от Насти
    }
    
    //MARK: - Private methods
    
    private func setupViews() {
        for view in [heightView, diameterView, massView, loadsView] {
            view?.backgroundColor = .darkGray
            view?.layer.cornerRadius = 30
        }
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
    }
    
    @objc func toLaunches() {
        // Переход на экран с запусками от Насти
    }
}

// MARK: - UITableViewDelegate

extension RocketViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .black
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.textColor = .lightGray
            header.textLabel?.font = .boldSystemFont(ofSize: 18)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2 {
            return 160
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 80)
        footerView.backgroundColor = .black
        showLaunchesButton.frame = CGRect(x: 0, y: 30, width: footerView.frame.width - 60, height: 60)
        showLaunchesButton.center.x = footerView.center.x
        showLaunchesButton.setTitle("Посмотреть запуски", for: .normal)
        showLaunchesButton.setTitleColor(.white, for: .normal)
        showLaunchesButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        showLaunchesButton.layer.cornerRadius = 20
        showLaunchesButton.backgroundColor = .darkGray
        showLaunchesButton.addTarget(self, action: #selector(toLaunches), for: .touchUpInside)
        footerView.addSubview(showLaunchesButton)
        return footerView
    }
}

// MARK: - UITableViewDataSource

extension RocketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rocketCell", for: indexPath)
        cell.backgroundColor = .black
        var content = cell.defaultContentConfiguration()
        content.textProperties.color = .white
        content.secondaryTextProperties.color = .white
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                content.text = "Первый запуск"
                content.secondaryText = rocket.firstFlight
            case 1:
                content.text = "Страна"
                content.secondaryText = rocket.country
            case 2:
                content.text = "Стоимость запуска"
                content.secondaryText = rocket.cost
            default:
                break
            }
        } else if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                content.text = "Количество дигателей"
                content.secondaryText = rocket.firstStageEngines
            case 1:
                content.text = "Количество топлива, тонн"
                content.secondaryText = rocket.firstStageFuel
            case 2:
                content.text = "Время сгорания, с"
                content.secondaryText = rocket.firstStageBurn
            default:
                break
            }
        } else if indexPath.section == 2 {
            switch indexPath.row {
            case 0:
                content.text = "Количество дигателей"
                content.secondaryText = rocket.secondStageEngines
            case 1:
                content.text = "Количество топлива, тонн"
                content.secondaryText = rocket.secondStageFuel
            case 2:
                content.text = "Время сгорания, с"
                content.secondaryText = rocket.secondStageBurn
            default:
                break
            }
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionNames[section]
    }
}

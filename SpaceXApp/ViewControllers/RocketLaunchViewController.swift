//
//  RocketLaunchViewController.swift
//  SpaceXApp
//
//  Created by Anastasia on 31.07.22.
//

import UIKit

class RocketLaunchViewController: UITableViewController {
    var rocketName: String!
    var rocketLaunches: [RocketLaunch]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        changeNavBar()
        tableView.allowsSelection = false
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return rocketLaunches.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "launch", for: indexPath)
        let launch = rocketLaunches[indexPath.section]
        var content = cell.defaultContentConfiguration()
        content.text = launch.launchName
        content.secondaryText = launch.date
        content.textProperties.color = .white
        content.secondaryTextProperties.color = .white
        content.imageProperties.maximumSize = CGSize(width: 32, height: 32)
        content.image = UIImage(named: launch.imageName)
        content.directionalLayoutMargins.top = 15
        content.directionalLayoutMargins.bottom = 15
        cell.contentConfiguration = content
        return cell
    }
    
    private func changeNavBar() {
        title = rocketName
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}

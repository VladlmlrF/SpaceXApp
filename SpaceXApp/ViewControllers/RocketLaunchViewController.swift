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
        title = rocketName
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
        content.image = UIImage(named: launch.imageName)
        cell.contentConfiguration = content
        return cell
    }
}

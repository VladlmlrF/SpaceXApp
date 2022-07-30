//
//  PageViewController.swift
//  SpaceXApp
//
//  Created by Владимир Фалин on 26.07.2022.
//

import UIKit

class PageViewController: UIPageViewController {

    private let rockets = Rocket.getRockets()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        self.dataSource = self
        
        guard let rocketVC = showRocket(0) else { return }
        self.setViewControllers([rocketVC], direction: .forward, animated: true)
    }
    
    private func showRocket(_ index: Int) -> RocketViewController? {
        guard index >= 0 else { return nil }
        guard index < rockets.count else { return nil }
        guard let rocketVC = storyboard?.instantiateViewController(withIdentifier: "rocketVC") as? RocketViewController else { return nil }
        
        rocketVC.rocket = rockets[index]
        rocketVC.currentPage = index
        rocketVC.numberOfPages = rockets.count
        
        return rocketVC
    }
}

// MARK: - PageViewControllerDataSource

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let rocketVC = viewController as? RocketViewController else { return nil }
        let index = rocketVC.currentPage
        
        return showRocket(index - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let rocketVC = viewController as? RocketViewController else { return nil }
        let index = rocketVC.currentPage
        
        return showRocket(index + 1)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        rockets.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
}

//
//  HomePageViewController.swift
//  LottieDocs
//
//  Created by AD0507-ADE-MB-1 on 23/12/2021.
//

import UIKit

class HomePageViewController: UIPageViewController {
    
    var pages: [UIViewController] = {
        var pages = [UIViewController]()
        
        let recentVC = BrowserViewController()
        recentVC.titleLabel.text = "Recent"
        recentVC.view.backgroundColor = .darkGray
        pages.append(recentVC)
        
        let featuredVC = BrowserViewController()
        featuredVC.titleLabel.text = "Featured"
        featuredVC.view.backgroundColor = .lightGray
        pages.append(featuredVC)
        
        let popularVC = BrowserViewController()
        popularVC.titleLabel.text = "Popular"
        popularVC.view.backgroundColor = .white
        pages.append(popularVC)
        
        return pages
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        dataSource = self
        
        setViewControllers([pages[0]], direction: .forward, animated: false, completion: nil)
    }
}

extension HomePageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController),
              index > 0
        else { return nil }
        return pages[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController),
              index < pages.count - 1
        else { return nil }
        return pages[index + 1]
    }
}

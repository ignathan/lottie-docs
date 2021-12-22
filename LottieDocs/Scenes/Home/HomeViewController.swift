//
//  HomeViewController.swift
//  LottieDocs
//
//  Created by AD0507-ADE-MB-1 on 23/12/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    let segmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["Recent", "Featured", "Popular"])
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.selectedSegmentIndex = 0
        return segmentControl
    }()
    let homepageVC = HomePageViewController(transitionStyle: .scroll,
                                            navigationOrientation: .horizontal,
                                            options: nil)
    
    var previousIndex = 0
    
    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        
        addChild(homepageVC)
        
        let contentView = homepageVC.view!
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentControl)
        view.addSubview(contentView)
        
        let topConstraint: NSLayoutConstraint = {
            if #available(iOS 11.0, *) {
                return segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            } else {
                return segmentControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor)
            }
        }()
        let bottomConstraint: NSLayoutConstraint = {
            if #available(iOS 11.0, *) {
                return contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            } else {
                return contentView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor)
            }
        }()
        NSLayoutConstraint.activate([
            segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topConstraint,
            segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 1),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomConstraint,
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        
        segmentControl.addTarget(self, action: #selector(segmentValueChanged), for: .valueChanged)
    }
    
    @objc
    func segmentValueChanged() {
        
        homepageVC.setViewControllers([homepageVC.pages[segmentControl.selectedSegmentIndex]],
                                      direction: segmentControl.selectedSegmentIndex > previousIndex ? .forward : .reverse,
                                      animated: true)
        { [weak self] _ in
            
            guard let self = self else { return }
            
            self.previousIndex = self.segmentControl.selectedSegmentIndex
        }
    }
}

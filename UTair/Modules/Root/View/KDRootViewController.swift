//
//  RootKDRootViewController.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, RootViewInput {
    
    @IBOutlet var tabBarButtons: [UIButton]!
    @IBOutlet weak var childController: UIView!
    @IBOutlet weak var contentView: UIView!
    
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    
	var output: RootViewOutput!
	
	// MARK: Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		output.viewIsReady()
	}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setBlueStyle()
    }
	
	
	// MARK: RootViewInput
    func setupInitialState(controllers: [UIViewController]!) {
        viewControllers = controllers
        putViewController(index: selectedIndex)
        setupNavigation()
    }
    
    func setupNavigation() {
        navigationController?.setBlueStyle()
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "questionIcon"), style: .done, target: self, action: #selector(RootViewController.actionQuestionTap))
        navigationItem.titleView = UIImageView.init(image: UIImage.init(named: "logo")) 
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func actionQuestionTap() {
        output.handleQuestion()
    }
    
    @IBAction func actionBarButtonsTap(_ sender: UIButton) {
        if sender.tag == selectedIndex {
            return
        }
        
        putViewController(index: sender.tag)
    }
    
    fileprivate func putViewController(index: Int) {
        let previous = selectedIndex
        let previousVC = viewControllers[previous]
        
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        selectedIndex = index
        
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
    }
}

//
//  Popup.swift
//  UTair
//
//  Created by Юрий Логинов on 09.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import UIKit

let HidenFrame = CGRect.init(x: 0, y: -64, width: ScreenWidth, height: 64)
let ShownFrame = CGRect.init(x: 0, y: 0, width: ScreenWidth, height: 64)

class Popup : UIView {
    
    @IBOutlet weak var textLabel: UILabel!
    var removeTimer: Timer?
    var currentPopup: Popup?
    
    static func showPopup(title: String) {
        let popup = create(title: title)
        popup.setupGesture()
        popup.showPopup()
        popup.remove(delay: 3.0)
    }
    
    fileprivate static func create(title: String) -> Popup {
        let popup = Bundle.main.loadNibNamed(String(describing: Popup.self), owner: nil, options: nil)?.first as! Popup
        popup.frame = HidenFrame
        popup.textLabel.text = title
    
        return popup
    }
    
    fileprivate func setupGesture() {
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(Popup.actionTapGesture))
        self.addGestureRecognizer(gesture)
    }
    
    @objc func actionTapGesture() {
        remove(animated: true)
    }
    
    fileprivate func showPopup() {
        currentPopup?.remove(animated: true)
        currentPopup = self
        
        self.frame = HidenFrame
        UIApplication.shared.keyWindow?.addSubview(self)
        UIView.animate(withDuration: 0.2) { 
            self.frame = ShownFrame
        }
    }
    
    fileprivate func remove(animated: Bool) {
        if let timer = removeTimer {
            if timer.isValid {
                timer.invalidate()
            }
        }
        
        var duration: TimeInterval
        if animated {
            duration = 0.2
        } else {
            duration = 0
        }
        
        UIView.animate(withDuration: duration, animations: { 
            self.frame = HidenFrame
        }) { completed in
            self.removeFromSuperview()
        }
    }
    
    fileprivate func remove(delay: TimeInterval) {
        removeTimer = Timer.scheduledTimer(withTimeInterval: delay, repeats: false, block: { [weak self] timer in
            self?.remove(animated: true)
            timer.invalidate()
        })
    }
}

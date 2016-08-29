//
//  ViewController.swift
//  Demo
//
//  Created by Jan Dammshäuser on 29.08.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit
import JDSegues

class ViewController: UIViewController {

    @IBAction func upperBtn(sender: UIButton) {
        performSegueWithIdentifier(Segues.ScaleIn.rawValue, sender: self)
    }

    @IBAction func lowerBtn(sender: UIButton) {
        let nextVC = SecondViewController()
        
        let segue = JDSegueScaleIn(identifier: nil, source: self, destination: nextVC)
        
        segue.animationCenterPoint = sender.center
        
        segue.perform()
    }
    
}


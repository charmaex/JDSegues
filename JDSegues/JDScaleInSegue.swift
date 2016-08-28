//
//  JDScaleInSegue.swift
//  JDSegues
//
//  Created by PJ Vea on 8/4/15.
//  Copyright © 2015 Vea Software. All rights reserved.
//

import UIKit

class JDScaleInSegue: UIStoryboardSegue {
    
    private var centerPoint: CGPoint?
    
    convenience init(identifier: String?, source: UIViewController, destination: UIViewController, point: CGPoint) {
        self.init(identifier: identifier, source: source, destination: destination)
        
        centerPoint = point
    }
    
    override func perform() {
        let sourceVC = self.sourceViewController
        let destinationVC = self.destinationViewController
        let destCenter = sourceVC.view.center
        
        
        destinationVC.view.frame = sourceVC.view.frame
        
        if let center = centerPoint {
            destinationVC.view.center = center
        }
        
        sourceVC.view.addSubview(destinationVC.view)
        
        destinationVC.view.transform = CGAffineTransformMakeScale(0.05, 0.05)
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
            
            destinationVC.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
            destinationVC.view.center = destCenter
            
            }) { (finished) -> Void in
                
                sourceVC.presentViewController(destinationVC, animated: false) {
                    sourceVC.view.subviews.last?.removeFromSuperview()
                }
                
                
        }
    }
}
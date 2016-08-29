//
//  JDSegueScaleIn.swift
//  JDSegues
//
//  Created by Jan Dammshäuser on 28.08.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/**
 Lorem ipsum dolor sit amet.
 
 - parameter Consectetur adipisicing elit.
 
 - returns: Sed do eiusmod tempor.
 */
@objc
public class JDSegueScaleIn: UIStoryboardSegue {
    
    /**
     Defines at which point the animation should start.
     Defaults to center of the screen.
    */
    public var animationCenterPoint: CGPoint?
    
    public var transitionTime: NSTimeInterval = 0.5
    
    public var transitionDelay: NSTimeInterval = 0
    
    public override func perform() {
        let sourceVC = self.sourceViewController
        let destinationVC = self.destinationViewController
        let destCenter = sourceVC.view.center
        
        
        destinationVC.view.frame = sourceVC.view.frame
        
        if let center = animationCenterPoint {
            destinationVC.view.center = center
        }
        
        sourceVC.view.addSubview(destinationVC.view)
        
        destinationVC.view.transform = CGAffineTransformMakeScale(0.05, 0.05)
        
        UIView.animateWithDuration(transitionTime, delay: transitionDelay, options: .CurveEaseInOut, animations: { () -> Void in
            
            destinationVC.view.transform = CGAffineTransformMakeScale(1, 1)
            destinationVC.view.center = destCenter
            
            }) { (finished) -> Void in
                
                sourceVC.presentViewController(destinationVC, animated: false) {
                    sourceVC.view.subviews.last?.removeFromSuperview()
                }
                
                
        }
    }
}
//
//  JDSegueScaleIn.swift
//  JDSegues
//
//  Created by Jan Dammshäuser on 28.08.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit


/// Segue that scales in from a point or the center of the screen.
@objc
public class JDSegueScaleIn: UIStoryboardSegue {
    
    /// Defines at which point the animation should start
    /// - parameter Default: center of the screen
    public var animationCenterPoint: CGPoint?
    
    /// Time the transition animation takes
    /// - parameter Default: 0.5 seconds
    public var transitionTime: NSTimeInterval = 0.5
    
    /// Time the transition animation is delayed after calling
    /// - parameter Default: 0 seconds
    public var transitionDelay: NSTimeInterval = 0
    
    /// Animation Curve
    /// - parameter Default: CurveLinear
    public var animationOption: UIViewAnimationOptions = .CurveLinear
    
    
    public override func perform() {
        let sourceVC = self.sourceViewController
        let destinationVC = self.destinationViewController
        let destCenter = sourceVC.view.center
        
        destinationVC.view.frame = sourceVC.view.frame
        
        destinationVC.view.transform = CGAffineTransformMakeScale(0.05, 0.05)
        
        if let center = animationCenterPoint {
            destinationVC.view.center = center
        }
        
        let delayTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(transitionDelay * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue(), {
            
            sourceVC.view.addSubview(destinationVC.view)
            
            UIView.animateWithDuration(self.transitionTime, delay: 0, options: self.animationOption, animations: {
                
                destinationVC.view.transform = CGAffineTransformMakeScale(1, 1)
                destinationVC.view.center = destCenter
                
            }) { finished in
                sourceVC.presentViewController(destinationVC, animated: false, completion: nil)
            }
            
        })
        
    }
}
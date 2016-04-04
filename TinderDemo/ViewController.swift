//
//  ViewController.swift
//  TinderDemo
//
//  Created by Prasanthi Relangi on 4/1/16.
//  Copyright © 2016 prasanthi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var draggableView: DraggableView!
    
    //For pan gesture handling
    var originalCenter: CGPoint!
    var originalTransform: CGAffineTransform!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        originalCenter = profileImageView.center
        originalTransform = profileImageView.transform
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onPan(sender: UIPanGestureRecognizer) {
        print("Panning")
        
        
        let translation = sender.translationInView(view)
        let point = sender.locationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            //originalCenter =
            originalCenter = profileImageView.center
            originalTransform = profileImageView.transform
            
        }
        else if sender.state == UIGestureRecognizerState.Changed {
            profileImageView.center = CGPoint(x: self.originalCenter.x + sender.translationInView(view).x, y: originalCenter.y)
            
            var multiplier = 1.0
            if point.y < view.frame.height/2 {
                multiplier = -1.0
            } else {
                multiplier = 1.0
            }
            
            let xOffset = translation.x
            let angle = CGFloat(multiplier * 1 * M_PI/180) / 20 * xOffset
            
            self.profileImageView.transform = CGAffineTransformRotate(originalTransform, angle)
        }
        else if sender.state == UIGestureRecognizerState.Ended {
            if translation.x > 100 || translation.x < -100 {
                self.profileImageView.hidden = true
            }
            else {
                self.profileImageView.transform = originalTransform
                self.profileImageView.center = originalCenter
            }
        }
        
    }
    
    
    @IBAction func onLike(sender: AnyObject) {
        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.profileImageView.center = CGPoint(x: self.originalCenter.x+250, y: self.originalCenter.y)
            let angle =  CGFloat(45 * M_PI/180)
            self.profileImageView.transform = CGAffineTransformRotate(self.originalTransform, angle)
            
            }) { (finished:Bool) -> Void in
                if finished == true {
                    self.profileImageView.hidden = true
                }
                
                
        }
        
        
        
        
        
        
    
    }

    @IBAction func onCancel(sender: AnyObject) {
        profileImageView.center = originalCenter
        profileImageView.transform = originalTransform
        profileImageView.hidden = false
    
    }
   

}


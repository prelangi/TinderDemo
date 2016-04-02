//
//  ViewController.swift
//  TinderDemo
//
//  Created by Prasanthi Relangi on 4/1/16.
//  Copyright © 2016 prasanthi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var panGesture: UIPanGestureRecognizer!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLike(sender: AnyObject) {
    }

    @IBAction func onCancel(sender: AnyObject) {
    }
   
}


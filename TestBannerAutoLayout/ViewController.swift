//
//  ViewController.swift
//  TestBannerAutoLayout
//
//  Created by Duncan Lowrie on 16/12/2015.
//  Copyright © 2015 Cherry Apps Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bannerContainer: UIView!
    @IBOutlet weak var contentContainer: UIView!
    @IBOutlet weak var bannerhHeightConstraint: NSLayoutConstraint!
    
    var originalBannerHeight: CGFloat = 0.0
    var firstRun = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.addTapRecognizer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addTapRecognizer(){
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("tapAction:")))
    }
    
    func tapAction(sender: AnyObject){
        if firstRun {
            self.originalBannerHeight = self.bannerContainer.frame.height
            firstRun = false
        }
        
        //toggle heights...
        var newBannerHeight: CGFloat = 0.0
        if self.bannerhHeightConstraint.constant == 0.0 {
            newBannerHeight = self.originalBannerHeight
        }
        UIView.animateWithDuration(0.5) { () -> Void in
            self.bannerhHeightConstraint.constant =     newBannerHeight
            self.view.layoutIfNeeded()
        }
        
    }


}


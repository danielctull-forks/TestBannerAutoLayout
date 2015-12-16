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
    @IBOutlet weak var bannerMarginConstraint: NSLayoutConstraint!
    
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
        
        //toggle heights...
        var margin: CGFloat = 0.0
        if bannerMarginConstraint.constant == 0.0 {
            margin = self.bannerContainer.systemLayoutSizeFittingSize(CGSize(width: view.bounds.width, height: CGFloat.max)).height
        }

        UIView.animateWithDuration(0.5) { () -> Void in
            self.bannerMarginConstraint.constant = margin
            self.view.layoutIfNeeded()
        }
        
    }


}


//
//  ReviewViewController.swift
//  TzuTzu
//
//  Created by Yi-Chin Hsu on 2016/9/3.
//  Copyright © 2016年 Yi-Chin Hsu. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    
    @IBOutlet var backgroundImageView:UIImageView!
    @IBOutlet var ratingStackView:UIStackView!
    
    @IBOutlet var dislikeButton:UIButton!
    @IBOutlet var goodButton:UIButton!
    @IBOutlet var greatButton:UIButton!
    
    var rating:String?


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        ratingStackView.transform = CGAffineTransformMakeScale(0.0, 0.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
    
        UIView.animateWithDuration(0.4, delay: 0.0, options: [], animations: {
            
            self.ratingStackView.transform = CGAffineTransformIdentity
        
        }, completion: nil)
    
    }
    
    @IBAction func ratingSelected(sender: UIButton) {
        
        switch (sender.tag) {
        case 100: rating = "dislike"
        case 200: rating = "good"
        case 300: rating = "great"
        default: break
        }
        
        
        performSegueWithIdentifier("unwindToDetailView", sender: sender)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}

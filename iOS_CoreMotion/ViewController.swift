//
//  ViewController.swift
//  iOS_CoreMotion
//
//  Created by Sandeep Jangra on 2020-01-21.
//  Copyright © 2020 Karan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpWallpaper()
        // Do any additional setup after loading the view.
    }
    func setUpWallpaper()  {
        let min = CGFloat(-20)
        
        let max = CGFloat(20)
        
        let xMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        
        xMotion.minimumRelativeValue = min
        xMotion.maximumRelativeValue = max

         let yMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongHorizontalAxis)
        yMotion.minimumRelativeValue = min
               yMotion.maximumRelativeValue = max
        
        
        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [xMotion,yMotion]
        
        imageView.addMotionEffect(motionEffectGroup)
    }

}


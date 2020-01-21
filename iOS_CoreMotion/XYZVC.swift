//
//  XYZVC.swift
//  iOS_CoreMotion
//
//  Created by Sandeep Jangra on 2020-01-21.
//  Copyright © 2020 Karan. All rights reserved.
//

import UIKit
import CoreMotion

class XYZVC: UIViewController {

    @IBOutlet weak var square: UIView!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
   // Like the location manager we need a motion manager here
    var motionManager : CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main){data,error in
            guard let accelerometerData = data else {return}
            
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 1
            formatter.maximumFractionDigits = 2
            
            let x = formatter.string(for:  accelerometerData.acceleration.x)!
            
            let y = formatter.string(for:  accelerometerData.acceleration.y)!
            let z = formatter.string(for:  accelerometerData.acceleration.z)!
        
            
            self.xLabel.text = "X : \(x)"
            self.yLabel.text = "Y : \(y)"
            self.zLabel.text = "Z : \(z)"
        }
        // Do any additional setup after loading the view.
    }
    

    func moveSquare(x : CGFloat , y : CGFloat ){
        let xPosition = square.frame.origin.x
        let yPosition = square.frame.origin.y
        
        let width = square.frame.size.width
        let height = square.frame.size.height
        
        //get device frame size
        
        let screen = UIScreen.main.bounds
        let screenWidth = screen.width
        let screenHeight = screen.height
        
        UIView.animate(withDuration: 0){
           guard (xPosition + x >= 0 && xPosition + width + x <= screenWidth) && (yPosition - y >= 0 && yPosition + height - y <= screenHeight) else {return}
             
            self.square.frame = CGRect(x: xPosition + x, y: yPosition - y, width: width, height: height)
        }
        
       }

}

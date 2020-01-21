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
            
        }
        // Do any additional setup after loading the view.
    }
    

    

}

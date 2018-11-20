//
//  PositionVC.swift
//  swiftAnimation
//
//  Created by juntuo on 2018/11/12.
//  Copyright © 2018 juntuo. All rights reserved.
//

import UIKit

class PositionVC: UIViewController {
    @IBOutlet weak var animateImg: UIImageView!
    
    @IBOutlet weak var moveToX: UITextField!
    @IBOutlet weak var moveToY: UITextField!
    @IBOutlet weak var centerToX: UITextField!
    @IBOutlet weak var centerToY: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func clickAction(_ sender: Any) {

        // 清除所有的动画
        animateImg.layer.removeAllAnimations()

        let pX = Double(moveToX.text ?? "100")
        let pY = Double(moveToY.text ?? "100")

        let cX = Double(centerToX.text ?? "0.5")
        let cY = Double(centerToY.text ?? "0.5")

        let animate = Animation.baseAnimationWithKeyPath("position", fromValue: NSValue(cgPoint: CGPoint(x: 0, y: 100)), toValue: NSValue(cgPoint: CGPoint(x: pX!, y: pY!)), duration: 1.5, repeatCount: Float.infinity, timingFunction: CAMediaTimingFunctionName.easeOut.rawValue)

        animateImg.layer.anchorPoint = CGPoint(x: cX!, y: cY!)
        animateImg.layer.add(animate, forKey: "position")



    }
    //

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

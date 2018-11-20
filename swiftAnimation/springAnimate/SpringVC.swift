//
//  SpringVC.swift
//  swiftAnimation
//
//  Created by juntuo on 2018/11/13.
//  Copyright © 2018 juntuo. All rights reserved.
//

import UIKit

class SpringVC: UIViewController {

    @IBOutlet weak var massSlider: UISlider!
    @IBOutlet weak var stiffSlider: UISlider!
    @IBOutlet weak var dampingSlider: UISlider!
    @IBOutlet weak var massProgress: UILabel!
    @IBOutlet weak var stiffProgress: UILabel!
    @IBOutlet weak var dampingProgress: UILabel!
    @IBOutlet weak var springView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        springView.layer.cornerRadius = 30
        springView.layer.masksToBounds = true

        massProgress.text = String(massSlider.value)
        stiffProgress.text = String(stiffSlider.value)
        dampingProgress.text = String(dampingSlider.value)

    }
    //质量
    @IBAction func massSliderAction(_ sender: UISlider) {
         let text = "\(sender.value)"
         massProgress.text = text
    }
    //刚度
    @IBAction func stiffSliderAction(_ sender: UISlider) {
        let text = "\(sender.value)"
        stiffProgress.text = text
    }
    //阻尼
    @IBAction func dampingSliderAction(_ sender: UISlider) {
        let text = "\(sender.value)"
        dampingProgress.text = text
    }
    //开始动画
    @IBAction func clickAction(_ sender: Any) {
        //先移除动画
        springView.layer.removeAllAnimations()

        let springAnimate = Animation.springAnimationWithPath("position.y", mass: textToCGFloat(text: massProgress.text!), stiffness: textToCGFloat(text: stiffProgress.text!), damping: textToCGFloat(text: dampingProgress.text!), fromValue: nil, toValue: UIScreen.main.bounds.height - 30)
        springAnimate.isRemovedOnCompletion = false
        springAnimate.fillMode = CAMediaTimingFillMode.forwards
        springView.layer.add(springAnimate, forKey: "position.y")


    }
    func textToCGFloat(text : String) -> CGFloat {
        return CGFloat((text as NSString).floatValue)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

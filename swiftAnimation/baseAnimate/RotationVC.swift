//
//  RotationVC.swift
//  swiftAnimation
//
//  Created by juntuo on 2018/11/12.
//  Copyright © 2018 juntuo. All rights reserved.
//

import UIKit

class RotationVC: UIViewController {

    @IBOutlet weak var XPathWay: UIImageView!
    @IBOutlet weak var YPathWay: UIImageView!
    @IBOutlet weak var ZPathWay: UIImageView!
    @IBOutlet weak var CustomPathWay: UIImageView!
    @IBOutlet weak var XTextValue: UITextField!
    @IBOutlet weak var YTextValue: UITextField!
    @IBOutlet weak var animateBt: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        animationFromXPathWay()
        animateFromYPathWay()
        animateFromZPathWay()

    }
    //沿X轴
    private func animationFromXPathWay(){

        let animate = Animation.baseAnimationWithKeyPath("transform.rotation.x", fromValue: nil, toValue: 2 * M_PI, duration: 1.0, repeatCount: Float.infinity, timingFunction: CAMediaTimingFunctionName.linear.rawValue)

        XPathWay.layer.add(animate, forKey: "transform.rotation.x")


    }
    //沿Y轴
    private func animateFromYPathWay(){
        let animate = Animation.baseAnimationWithKeyPath("transform.rotation.y", fromValue: nil, toValue: 2 * M_PI, duration: 1.0, repeatCount: Float.infinity, timingFunction: CAMediaTimingFunctionName.linear.rawValue)

        YPathWay.layer.add(animate, forKey: "transform.rotation.y")
    }

    //沿Z轴
    private func animateFromZPathWay(){
        let animate = Animation.baseAnimationWithKeyPath("transform.rotation.z", fromValue: nil, toValue: 2 * M_PI, duration: 1.0, repeatCount: Float.infinity, timingFunction: CAMediaTimingFunctionName.linear.rawValue)

        ZPathWay.layer.add(animate, forKey: "transform.rotation.z")
    }

    @IBAction func clickAction(_ sender: Any) {

        let x : Double = (XTextValue.text! as NSString).doubleValue
        let y : Double = (YTextValue.text! as NSString).doubleValue
        CustomPathWay.layer.anchorPoint = CGPoint(x: x, y: y)
        CustomPathWay.layer.removeAllAnimations()
        let animate = Animation.baseAnimationWithKeyPath("transform.rotation.z", fromValue: nil , toValue: 2 * M_PI, duration: 1.0, repeatCount: Float.infinity, timingFunction: CAMediaTimingFunctionName.linear.rawValue)
        CustomPathWay.layer.add(animate, forKey: "transform.rotation.z")
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

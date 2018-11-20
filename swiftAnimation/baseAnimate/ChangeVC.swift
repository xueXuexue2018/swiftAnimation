//
//  ChangeVC.swift
//  swiftAnimation
//
//  Created by juntuo on 2018/11/13.
//  Copyright © 2018 juntuo. All rights reserved.
//

import UIKit

class ChangeVC: UIViewController {
    @IBOutlet weak var bgColor: UILabel!
    @IBOutlet weak var cornerRadius: UILabel!

    @IBOutlet weak var borderColor: UILabel!
    @IBOutlet weak var borderWidth: UILabel!
    @IBOutlet weak var alph: UILabel!
    @IBOutlet weak var shadow: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()


        //背景色
        let bgColorAnimate = Animation.baseAnimationWithKeyPath("backgroundColor", fromValue: UIColor.red.cgColor, toValue: UIColor.green.cgColor, duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)

        bgColorAnimate.autoreverses = true
        bgColor.layer.add(bgColorAnimate, forKey: "backgroundColor")

        //圆角
        let cornerAnimate = Animation.baseAnimationWithKeyPath("cornerRadius", fromValue: nil, toValue: 25, duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)
        cornerAnimate.autoreverses = true
//        cornerRadius.layer.shadowColor = UIColor.red.cgColor
//        cornerRadius.layer.shadowOpacity = 1.0
        cornerRadius.layer.borderWidth = 7
        cornerRadius.layer.add(cornerAnimate, forKey: "cornerRadius")

        //边框颜色
        let borderColorAnimate = Animation.baseAnimationWithKeyPath("borderColor", fromValue: nil, toValue: UIColor.green.cgColor, duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)
        borderColorAnimate.autoreverses = true
        borderColor.layer.borderWidth = 5
        borderColor.layer.add(borderColorAnimate, forKey: "borderColor")

        //边框
        let borderWAnimate = Animation.baseAnimationWithKeyPath("borderWidth", fromValue: 0, toValue: 5, duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)
        borderWAnimate.autoreverses = true
        borderWidth.layer.borderColor = UIColor.red.cgColor
        borderWidth.layer.add(borderWAnimate, forKey: "borderWidth")


        //不透明度
        let opacityAnimate = Animation.baseAnimationWithKeyPath("opacity", fromValue: nil, toValue: 0.2, duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)
        opacityAnimate.autoreverses = true
        alph.layer.add(opacityAnimate, forKey: "opacity")


        //阴影
        let  shadowAnimate = Animation.baseAnimationWithKeyPath("shadowOpacity", fromValue: 0, toValue: 0.8, duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)
        shadowAnimate.autoreverses = true
        shadow.layer.shadowColor = UIColor(white: 0, alpha: 0.5).cgColor
        shadow.layer.shadowOffset = CGSize(width: 0, height: 3)
        shadow.layer.shadowRadius = 8
        shadow.layer.add(shadowAnimate, forKey: "shadowOpacity")

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

//
//  ScaleVC.swift
//  swiftAnimation
//
//  Created by juntuo on 2018/11/13.
//  Copyright © 2018 juntuo. All rights reserved.
//

import UIKit

class ScaleVC: UIViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //整体缩放
        let scaleAnimate = Animation.baseAnimationWithKeyPath("transform.scale", fromValue: nil, toValue: 1.2, duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)
        scaleAnimate.autoreverses = true
        image1.layer.add(scaleAnimate, forKey: "transform.scale")

        //沿y轴缩放
        let scaleYAnimate = Animation.baseAnimationWithKeyPath("transform.scale.y", fromValue: nil, toValue: 1.2, duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)
        scaleYAnimate.autoreverses = true
        image2.layer.add(scaleYAnimate, forKey: "transform.scale.y")

        //沿x轴缩放
        let scaleXAnimate = Animation.baseAnimationWithKeyPath("transform.scale.x", fromValue: nil, toValue: 1.2, duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)
        scaleXAnimate.autoreverses = true
        image3.layer.add(scaleXAnimate, forKey: "transform.scale.x")

        //bounds缩放
        let boundsAnimate = Animation.baseAnimationWithKeyPath("bounds", fromValue: nil, toValue: NSValue(cgRect: CGRect(x: 0, y: 0, width: 50, height: 50)), duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)
        boundsAnimate.autoreverses = true
        image4.layer.add(boundsAnimate, forKey: "bounds")

        //width缩放
        let widthAnimate = Animation.baseAnimationWithKeyPath("contentsRect.size.width", fromValue: nil, toValue: 0.5, duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)

        widthAnimate.autoreverses = true
        image5.layer.add(widthAnimate, forKey: "contentsRect.size.width")

        //height 缩放
        let heightAnimate = Animation.baseAnimationWithKeyPath("contentsRect.size.height", fromValue: nil, toValue: 0.5, duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)
        heightAnimate.autoreverses = true
        image6.layer.add(heightAnimate, forKey: "contentsRect.size.height")



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

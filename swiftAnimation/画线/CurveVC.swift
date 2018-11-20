//
//  CurveVC.swift
//  swiftAnimation
//
//  Created by juntuo on 2018/11/15.
//  Copyright © 2018 juntuo. All rights reserved.
//

import UIKit

class CurveVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       view.layer.addSublayer(curveLayer)
        curveLayer.add(showAnimate(), forKey: "strokeEnd")
    }
    // 画曲线
    lazy var curveLayer:CAShapeLayer = {
        let curve = CAShapeLayer()
        curve.frame = view.frame
        curve.strokeColor = UIColor.red.cgColor
        curve.lineWidth = 2
        curve.fillColor = nil

        //路径
         let mainPath = UIBezierParc4randomath()
        mainPath.move(to: CGPoint(x: 20, y: 200))
        // to:endPoint

        mainPath.addCurve(to: CGPoint(x: 400, y: 200), controlPoint1: CGPoint(x: 100, y: 100), controlPoint2: CGPoint(x: 300, y: 400))
        curve.path = mainPath.cgPath
        
        return curve
    }()
    //动画
    private func showAnimate()->CABasicAnimation{
        let curveAnimate = Animation.baseAnimationWithKeyPath("strokeEnd", fromValue: 0, toValue: 1, duration: 1, repeatCount: Float.infinity, timingFunction: nil)

        return curveAnimate

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

//
//  KeyFrameVC.swift
//  swiftAnimation
//
//  Created by juntuo on 2018/11/13.
//  Copyright © 2018 juntuo. All rights reserved.
//

import UIKit


class KeyFrameVC: UIViewController {
    let circlePath = UIBezierPath(roundedRect: CGRect(x: 150, y: 300, width: 200, height: 200), cornerRadius: 100).cgPath

    @IBOutlet weak var rectImg: UIImageView!
    @IBOutlet weak var circleImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        keepRectMove()
        keepCircleMove()
    }
    //沿着矩形旋转
    private func keepRectMove(){
        //矩形的四个顶点
        let values = [NSValue(cgPoint: CGPoint(x: 150, y: 100)),
                      NSValue(cgPoint: CGPoint(x: 150, y: 200)),
                      NSValue(cgPoint: CGPoint(x: 250, y: 200)),
                      NSValue(cgPoint: CGPoint(x: 250, y: 100)),
                      NSValue(cgPoint: CGPoint(x: 150, y: 100))]

        let keyTimes = [NSNumber(value: 0.0),
                        NSNumber(value: 0.1),
                        NSNumber(value: 0.5),
                        NSNumber(value: 0.8),
                        NSNumber(value: 1.0)]
         //线性 kCAAnimationLinear linear
        let keyFrameAni = Animation.keyFrameAnimationWithKeyPath("position", values: values, keyTimes: keyTimes, path: nil, duration: 5, cacluationMode: CAAnimationCalculationMode.linear.rawValue, rotationMode: "auto")
        keyFrameAni.repeatCount = Float.infinity
        rectImg.layer.add(keyFrameAni, forKey: "position")
        view.layer.addSublayer(rectLayer)

    }
    //沿着圆形旋转
    private func keepCircleMove(){

        let keyFrameAni = Animation.keyFrameAnimationWithKeyPath("position", values: nil, keyTimes: nil, path: circlePath, duration: 5, cacluationMode: CAAnimationCalculationMode.paced.rawValue, rotationMode: "auto")
        keyFrameAni.repeatCount = Float.infinity
        circleImg.layer.add(keyFrameAni, forKey: "position")
        view.layer.addSublayer(circleLayer)
    }

    // 矩形框
    fileprivate lazy var rectLayer:CAShapeLayer = {
        let circleLayer = CAShapeLayer()
        //描边颜色
        circleLayer.strokeColor = UIColor.red.cgColor
        //填充颜色
        circleLayer.fillColor = nil
        circleLayer.lineCap = CAShapeLayerLineCap.round
        circleLayer.lineJoin = CAShapeLayerLineJoin.round

        //边框宽度
        circleLayer.lineWidth = 2

        let rectPath = CGPath(rect: CGRect.init(x: 150, y: 100, width: 100, height: 100), transform: nil)
        //路径
        circleLayer.path = rectPath
        return circleLayer
    }()

    //圆形框
    fileprivate lazy var circleLayer:CAShapeLayer = {
        let circleLayer = CAShapeLayer()
        //描边颜色
        circleLayer.strokeColor = UIColor.red.cgColor
        //填充颜色
        circleLayer.fillColor = nil
        circleLayer.lineCap = CAShapeLayerLineCap.round
        circleLayer.lineJoin = CAShapeLayerLineJoin.round

        //边框宽度
        circleLayer.lineWidth = 2
        //路径
        circleLayer.path = circlePath


        return circleLayer
    }()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

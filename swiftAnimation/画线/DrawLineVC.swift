//
//  DrawLineVC.swift
//  swiftAnimation
//
//  Created by juntuo on 2018/11/14.
//  Copyright © 2018 juntuo. All rights reserved.
//

import UIKit

class DrawLineVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(circleLayer)
        view.layer.addSublayer(menuLayer)

        //添加动画
        circleLayer.add(showAnimation(time: 1), forKey: "drawLineAnimation")
       //延迟2秒出现勾
        let time: TimeInterval = 1
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
             self.view.layer.addSublayer(self.lineLayer)
           self.lineLayer.add(self.showAnimation(time: 1), forKey: "drawLineAnimation")
        }


    }
    // 动画
    private func showAnimation(time: CFTimeInterval)->CAAnimationGroup{
        //创建画圆动画
        let drawLineAnimate = Animation.baseAnimationWithKeyPath("strokeEnd", fromValue: 0, toValue: 1, duration: time, repeatCount: nil, timingFunction: nil)

        //全部组合起来
        let groupAni = CAAnimationGroup()
        //动画数组
        groupAni.animations = [drawLineAnimate]

        //这里的时间一定要>= 上面最长的动画时间
        groupAni.duration = time + 0.5
        //翻转
        groupAni.autoreverses = false
        return groupAni

    }
    //画圆
    lazy var circleLayer: CAShapeLayer = {
        //创建一个layer 用于显示
        let shapeLayer = CAShapeLayer()
        //设置区域
        shapeLayer.frame = view.bounds
        //边框颜色
        shapeLayer.strokeColor = UIColor.red.cgColor
        //边框宽度
        shapeLayer.lineWidth = 2
        //n边框路径
        //        shapeLayer.path = UIBezierPath(roundedRect: CGRect(x: 100, y: 100, width: 200, height: 200), cornerRadius: 100).cgPath
        shapeLayer.path = UIBezierPath(roundedRect: CGRect(x:100 , y: 100, width:200, height :200 ), cornerRadius: 100).cgPath

        shapeLayer.fillColor = nil

        return shapeLayer
    }()

    //画勾
    lazy var lineLayer: CAShapeLayer = {
       let shapeLayer = CAShapeLayer()
        shapeLayer.frame = view.bounds
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 2

        
         let mainPath = UIBezierPath()

        //起点
        mainPath.move(to: CGPoint(x: 150, y: 180))
        //
        mainPath.addLine(to: CGPoint(x: 200, y: 220))
        mainPath.addLine(to: CGPoint(x: 270, y: 130))

        shapeLayer.path = mainPath.cgPath

        shapeLayer.fillColor = nil

        return shapeLayer
    }()

    //画一个下拉菜单
    lazy var menuLayer: CAShapeLayer = {

        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = CGRect(x: 200, y: 400, width: 200, height: 200)
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 2

        let width = 200
         let height = 200
        let mainPath = UIBezierPath()
//        mainPath.move(to: CGPoint(x: 300, y: 300))
//        //
//        mainPath.addLine(to: CGPoint(x: 280, y: 320))
//        mainPath.addLine(to: CGPoint(x: 180, y: 320))
//        mainPath.addLine(to: CGPoint(x: 180, y: 500))
//        mainPath.addLine(to: CGPoint(x: 380, y: 500))
//        mainPath.addLine(to: CGPoint(x: 380, y: 320))
//        mainPath.addLine(to: CGPoint(x: 330, y: 320))
//        mainPath.addLine(to: CGPoint(x: 300, y: 300))

        mainPath.move(to: CGPoint(x: 0, y: 10))
        mainPath.addLine(to: CGPoint(x: width-35, y: 10))
         mainPath.addLine(to: CGPoint(x: width-25, y: 0))
         mainPath.addLine(to: CGPoint(x: width-15, y: 10))
         mainPath.addLine(to: CGPoint(x: width, y: 10))
         mainPath.addLine(to: CGPoint(x: width, y: height))
         mainPath.addLine(to: CGPoint(x: 0, y: height))

        shapeLayer.path = mainPath.cgPath

        return shapeLayer
    }()

}

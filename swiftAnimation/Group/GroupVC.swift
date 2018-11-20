//
//  GroupVC.swift
//  swiftAnimation
//
//  Created by juntuo on 2018/11/13.
//  Copyright © 2018 juntuo. All rights reserved.
//

import UIKit

class GroupVC: UIViewController {

    @IBOutlet weak var groupImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        startAnimation()

    }
    private func startAnimation(){
        //画圆角
        let cornerAnimate = Animation.baseAnimationWithKeyPath("cornerRadius", fromValue: nil, toValue: 10, duration: 0.75, repeatCount: nil, timingFunction: nil)
//        //边框宽度
        let borderWAnimate = Animation.baseAnimationWithKeyPath("borderWidth", fromValue: nil, toValue: 5, duration: 1.25, repeatCount: nil, timingFunction: nil)
//        //边框颜色
        let borderColorAnimate = Animation.baseAnimationWithKeyPath("borderColor", fromValue: nil, toValue: UIColor.white.cgColor, duration: 1.0, repeatCount: nil, timingFunction: nil)
//        //缩放
        let scaleAnimate = Animation.baseAnimationWithKeyPath("transform.scale", fromValue: nil, toValue: 0.5, duration: 1.5, repeatCount: nil, timingFunction: nil)
//        //位移
        let positionAnimate = Animation.baseAnimationWithKeyPath("position.y", fromValue: nil, toValue: 200, duration: 1.6, repeatCount: nil, timingFunction: nil)

        //全部组合起来
        let groupAni = CAAnimationGroup()
        //动画数组
        groupAni.animations = [cornerAnimate, borderWAnimate, borderColorAnimate, scaleAnimate, positionAnimate]
        //重复x次数
        groupAni.repeatCount = Float.infinity
        //这里的时间一定要>= 上面最长的动画时间
        groupAni.duration = 1.8
        //翻转
        groupAni.autoreverses = true
        groupImg.layer.add(groupAni, forKey: "groupAnimation")
//        groupImg.layer.borderWidth = 2


     //如果使用了cornerRadius之后那么shadow效果就会失效，解决方法就是创建一个Layer，添加上去
        //阴影
        let shadowAnimate = Animation.baseAnimationWithKeyPath("shadowOffset", fromValue: NSValue(cgSize: CGSize(width: -5, height: -5)), toValue: NSValue(cgSize: CGSize(width: 5, height: 5)), duration: 1.5, repeatCount: nil, timingFunction: nil)
      // 阴影颜色
        let shadowColorAnimate = Animation.baseAnimationWithKeyPath("shadowColor", fromValue: nil, toValue: UIColor.gray.cgColor, duration: 1.5, repeatCount: nil, timingFunction: nil)
        //阴影不透明f度
        let shadowOpacityAni = Animation.baseAnimationWithKeyPath("shadowOpacity", fromValue: nil, toValue: 0.7, duration: 1.25, repeatCount: nil, timingFunction: nil)

        //圆角
        let shadowRadiusAni = Animation.baseAnimationWithKeyPath("shadowOpacity", fromValue: 2, toValue: 10, duration: 1.25, repeatCount: nil, timingFunction: nil)

        //创建新的layer
        let shapeLayer = CAShapeLayer()
        // 设置大小
        shapeLayer.frame = groupImg.frame
        //设置路径
        shapeLayer.path = CGPath(ellipseIn: groupImg.bounds, transform: nil)
        //创建动画组
        let layerGroup = CAAnimationGroup()

        //动画数组
        layerGroup.animations = [shadowAnimate, shadowColorAnimate, shadowOpacityAni, shadowRadiusAni,positionAnimate,scaleAnimate]
        //重复x次数
        layerGroup.repeatCount = Float.infinity
        //这里的时间一定要>= 上面最长的动画时间
        layerGroup.duration = 1.8
        //翻转
        layerGroup.autoreverses = true
        //把图层添加进去
        view.layer.insertSublayer(shapeLayer, at: 0)
        //添加动画
        shapeLayer.add(layerGroup, forKey: "layerGroup")

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

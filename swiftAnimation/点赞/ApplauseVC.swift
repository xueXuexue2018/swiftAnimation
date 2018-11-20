//
//  ApplauseVC.swift
//  swiftAnimation
//
//  Created by juntuo on 2018/11/15.
//  Copyright © 2018 juntuo. All rights reserved.
//

import UIKit

class ApplauseVC: UIViewController {

    @IBOutlet weak var numLb: UILabel!
    @IBOutlet weak var applauseBt: UIButton!
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func clickAction(_ sender: Any) {
        count += 1
        numLb.text = String(count)
        showAnimate()
    }
    //创建动画
    private func showAnimate(){
        //取随机图片
        let index = arc4random_uniform(7)
        let imageName = "applause_\(index)"
        //创建ImageView
        let imageView = UIImageView(frame: CGRect(x: applauseBt.frame.origin.x+30, y: applauseBt.frame.origin.y-30, width: 40, height: 40))
        view.insertSubview(imageView, belowSubview: applauseBt)
        imageView.image = UIImage(named: imageName)

        imageView.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        imageView.alpha = 0

        //弹出动画
        UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: UIView.AnimationOptions.curveEaseOut, animations: {
            imageView.transform = CGAffineTransform.identity
            imageView.alpha = 0.9
        }, completion: nil)

        //随机偏转角度
        let i = Int(arc4random_uniform(2))

        //// -1 OR 1,随机方向
        let rotationDirection = 1-(2 * i)

        //随机角度
        let rotationFraction = Double(arc4random_uniform(10))
        let d = 4 + rotationFraction * 0.2
        let I = Int(M_PI / d)



        //图片在上升过程中旋转
        UIView.animate(withDuration: 4) {
            imageView.transform = CGAffineTransform.init(rotationAngle: CGFloat(rotationDirection * I))
        }

        //动画路径
        let heartTravePath = UIBezierPath()
        heartTravePath.move(to: imageView.center)
        //随机终点
        let viewX = Int(imageView.center.x)
        let viewY = Int(imageView.center.y)

        //随机control点
        let j = Int(arc4random_uniform(2))
        // 随机放向 -1 OR 1
        let travelDirection = 1 - (2 * j)
        let m1 = viewX + travelDirection * (ArcRandom(num: 20) + 50)
        let animation = CAKeyframeAnimation(keyPath: "position")
        //设置5个位置点

        let p1 = CGPoint(x:viewX, y:viewY)

        let p2 = CGPoint(x:Double(m1), y:100)

        let p3 = CGPoint(x:100.0, y:400)

        let p4 = CGPoint(x:300, y:400)

        let p5 = CGPoint(x:150, y:200)

        animation.values = [NSValue(cgPoint: p1), NSValue(cgPoint: p2),

                            NSValue(cgPoint: p3), NSValue(cgPoint: p4), NSValue(cgPoint: p5)]
        //每个动作的时间百分比
        animation.keyTimes = [NSNumber(value: 0.0), NSNumber(value: 0.4),

                              NSNumber(value: 0.6), NSNumber(value: 0.8), NSNumber(value: 1.0), ]
        animation.duration = 6.0

        imageView.layer.add(animation, forKey: "Image-Move")
        //动画消失
        UIView.animate(withDuration: 3, animations: {
            imageView.alpha = 0
        }) { (finish) in
            imageView.removeFromSuperview()
        }

    }

    private func ArcRandom(num: Int)->Int{
        return Int(arc4random_uniform(UInt32(num)))
    }

}

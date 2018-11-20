//
//  FireVC.swift
//  swiftAnimation
//
//  Created by juntuo on 2018/11/13.
//  Copyright © 2018 juntuo. All rights reserved.
//

import UIKit

class FireVC: UIViewController {
    @IBOutlet weak var fireImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       view.backgroundColor = UIColor.black

        fireEmitter.emitterCells = [fire]
        view.layer.addSublayer(fireEmitter)
    }

  // 创建一个粒子
    lazy var fire: CAEmitterCell = {
        let cell = CAEmitterCell()
        //粒子的创建速率 默认0
        cell.birthRate = 200
        //粒子的存活时间 单位s
        cell.lifetime = 0.3
        //粒子的生存时间容差 0.3 += (0.0 ~ 0.5)
        cell.lifetimeRange = 0.5
        //粒子的颜色
        cell.color = UIColor.white.cgColor
        //粒子内容
        cell.contents = UIImage(named: "DazFire")?.cgImage
        cell.contentsRect = CGRect(x: 0, y: 0, width: 0.8, height: 2)
        //粒子名称
        cell.name = "fire"
        //粒子的速度
        cell.velocity = 20
        //粒子的速度容差
        cell.velocityRange = 10
        //粒子在xy平面的发射角度
        cell.emissionLongitude = CGFloat((Double.pi / 2) + (Double.pi / 4))
        //粒子缩放速度
        cell.scaleSpeed = 0.3
        //粒子缩放大小 默认1
        cell.scale = 1
        //粒子缩放容差
        cell.scaleRange = 0.2
        //粒子旋转度 默认是 0
        cell.spin = 0.2
        //粒子旋转度容差
        cell.spinRange = 0.4
        /* 以及其他属性介绍
         redRange       红色容差
         greenRange     绿色容差
         blueRange      蓝色容差
         alphaRange     透明度容差
         redSpeed       红色速度
         greenSpeed     绿色速度
         blueSpeed      蓝色速度
         alphaSpeed     透明度速度
         contentsRect   渲染范围
         */

        return cell
    }()

    //创建一个发射器对象
    lazy var fireEmitter: CAEmitterLayer = {
        let emitter = CAEmitterLayer()
        //设置中心店

        emitter.emitterPosition = CGPoint(x: fireImg.center.x + 40 , y: fireImg.center.y-30)
        //设置尺寸
        //        emitter.emitterSize = CGSize(width: 20, height: 20)
        //设置发射模式
        /*
         public let kCAEmitterLayerPoints: String     从一个点发出
         public let kCAEmitterLayerOutline: String    从边缘发出
         public let kCAEmitterLayerSurface: String    从表面发出
         public let kCAEmitterLayerVolume: String     从发射器中发出
         */
        emitter.emitterMode = CAEmitterLayerEmitterMode.outline
        //设置发射器形状
        /*
         public let kCAEmitterLayerPoint: String        点
         public let kCAEmitterLayerLine: String         线
         public let kCAEmitterLayerRectangle: String    矩形
         public let kCAEmitterLayerCuboid: String       立方体
         public let kCAEmitterLayerCircle: String       圆形
         public let kCAEmitterLayerSphere: String       球
         */
        emitter.emitterShape = CAEmitterLayerEmitterShape.sphere
        //设置发射器渲染模式
        /*
         CA_EXTERN NSString * const kCAEmitterLayerUnordered        无序
         CA_EXTERN NSString * const kCAEmitterLayerOldestFirst      生命久的粒子会被渲染在最上层
         CA_EXTERN NSString * const kCAEmitterLayerOldestLast       后产生的粒子会被渲染在最上层
         CA_EXTERN NSString * const kCAEmitterLayerBackToFront      粒子的渲染按照Z轴的前后顺序进行
         CA_EXTERN NSString * const kCAEmitterLayerAdditive         混合模式
         */
        emitter.renderMode = CAEmitterLayerRenderMode.unordered
        return emitter
    }()

}

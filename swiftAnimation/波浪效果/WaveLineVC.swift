//
//  WaveLineVC.swift
//  swiftAnimation
//
//  Created by juntuo on 2018/11/13.
//  Copyright © 2018 juntuo. All rights reserved.
//

import UIKit

class WaveLineVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        let waveLineView = WaveLineView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        view.addSubview(waveLineView)
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

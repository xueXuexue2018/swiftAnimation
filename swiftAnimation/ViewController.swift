//
//  ViewController.swift
//  swiftAnimation
//
//  Created by juntuo on 2018/11/12.
//  Copyright © 2018 juntuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSource:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.delegate = self
        tableView.dataSource = self

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        dataSource = ["沿轴线转动","坐标点转动","变化","缩放","移动","弹跳","组合","波浪效果","火苗","画线","点赞","曲线运动"]

    }


}
extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = dataSource[indexPath.row]
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let rvc = RotationVC()

            self.navigationController?.pushViewController(rvc, animated: true)
        case 1:
            let pvc = PositionVC()

            self.navigationController?.pushViewController(pvc, animated: true)
        case 2:
            let cvc = ChangeVC()

            self.navigationController?.pushViewController(cvc, animated: true)
        case 3:
            let svc = ScaleVC()

            self.navigationController?.pushViewController(svc, animated: true)
        case 4:
            let kvc = KeyFrameVC()

            self.navigationController?.pushViewController(kvc, animated: true)
        case 5:
            let spring = SpringVC()

            self.navigationController?.pushViewController(spring, animated: true)
        case 6:
            let group = GroupVC()

            self.navigationController?.pushViewController(group, animated: true)
        case 7:
            let wave = WaveLineVC()

            self.navigationController?.pushViewController(wave, animated: true)
        case 8:
            let fire = FireVC()

            self.navigationController?.pushViewController(fire, animated: true)
        case 9:
            let line = DrawLineVC()

            self.navigationController?.pushViewController(line, animated: true)
        case 10:
            let applause = ApplauseVC()

            self.navigationController?.pushViewController(applause, animated: true)
        case 11:
            let curve = CurveVC()

            self.navigationController?.pushViewController(curve, animated: true)
        default:
            print("没有")
        }
    }
}

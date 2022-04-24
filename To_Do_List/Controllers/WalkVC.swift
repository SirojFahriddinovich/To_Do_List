//
//  WalkVC.swift
//  To_Do_List
//
//  Created by Macbook Air on 13/03/22.
//

import UIKit

class WalkVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func startTap(_ sender: Any) {
        let vc = TasksVC.init(nibName: "TasksVC", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

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

    @IBAction func nextTapped(_ sender: UIButton) {
        let vc = LoginVC.init(nibName: "LoginVC", bundle: nil)
        self.present(vc, animated: true, completion: nil)
    }
    
}

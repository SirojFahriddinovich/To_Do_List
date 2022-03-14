//
//  LoginVC.swift
//  To_Do_List
//
//  Created by Macbook Air on 13/03/22.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var blurView: UIVisualEffectView! {
        didSet {
            blurView.alpha = 0.98
        }
    }
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var genderTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func gesture(_ sender: UITapGestureRecognizer) {
        print("Tap_______")
    }
    
}

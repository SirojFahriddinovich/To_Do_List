//
//  AddTaskVC.swift
//  To_Do_List
//
//  Created by Macbook Air on 24/04/22.
//

import UIKit

class AddTaskVC: UIViewController {

    @IBOutlet weak var cor: UIView! {
        didSet {
            cor.layer.cornerRadius = cor.frame.height / 2 - 35
        }
    }
    
    @IBOutlet var PrioretyBtns: [UIButton]!
    
    let colors : [UIColor] = [.systemYellow, .systemGreen, .systemRed, .systemIndigo]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func xTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func prioretyTapped(_ sender: UIButton) {
        for i in self.PrioretyBtns.enumerated() {
            if i.offset == sender.tag {
                self.PrioretyBtns[sender.tag].setImage(nil, for: .normal)
                self.PrioretyBtns[sender.tag].backgroundColor = self.colors[sender.tag]
                self.PrioretyBtns[i.offset].setTitleColor(.white, for: .normal)
            } else {
                i.element.setImage(UIImage(systemName: "circle.fill"), for: .normal)
                i.element.tintColor = self.colors[i.offset]
                i.element.backgroundColor = .clear
                self.PrioretyBtns[i.offset].setTitleColor(UIColor.systemGray2 as! UIColor, for: .normal)
            }
        }
    }
    
    
}

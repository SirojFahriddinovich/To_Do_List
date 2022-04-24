//
//  TaskTVC.swift
//  To_Do_List
//
//  Created by Macbook Air on 24/04/22.
//

import UIKit

class TaskTVC: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func updateCell(index : Int) {
        if index % 2 == 0 {
            self.backView.transform = .init(translationX: 400, y: 0)
        } else {
            self.backView.transform = .init(translationX: -400, y: 0)
        }
    }
    
    func animateCell() {
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0) {
            self.backView.transform = .identity
        }
    }
    
}

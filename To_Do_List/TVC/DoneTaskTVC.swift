//
//  DoneTaskTVC.swift
//  To_Do_List
//
//  Created by Macbook Air on 24/04/22.
//

import UIKit

class DoneTaskTVC: UITableViewCell {
    
    @IBOutlet weak var bacView: UIView!
    var index = 0
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    
    func updateCell(index : Int) {
        self.index = index
        if index % 2 == 0 {
            self.bacView.transform = .init(translationX: 400, y: 0)
        } else {
            self.bacView.transform = .init(translationX: -400, y: 0)
        }
    }
    
    func animateCell() {
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0) {
            self.bacView.transform = .identity
        }
    }
}

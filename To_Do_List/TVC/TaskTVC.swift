//
//  TaskTVC.swift
//  To_Do_List
//
//  Created by Macbook Air on 24/04/22.
//

import UIKit

class TaskTVC: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var NotifBtn: UIButton!
    @IBOutlet weak var prioretyView: UIView!

    let priorety : [String] = ["Yellow","Green","Red","blue"]
    let colors : [UIColor] = [.systemYellow, .systemGreen, .systemRed, .systemIndigo]
    var index = 0

    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func updateCell(task : TaskDM, index : Int) {
        
        self.index = index
        task.isNotif ? (NotifBtn.tintColor = .systemYellow ) : (NotifBtn.tintColor = .lightGray)
        self.dateLbl.text = task.date
        self.titleLbl.text = task.title
        for i in self.priorety.enumerated() {
            if task.priorety == i.element {
                prioretyView.backgroundColor = colors[i.offset]
            }
        }

        
    }
    
    @IBAction func doneBtnTapped(_ sender: Any) {
        print("DONE")
    }
    
    @IBAction func notifBtnTapped(_ sender: Any) {
        if NotifBtn.tintColor == .lightGray {
            NotifBtn.tintColor = .systemYellow
        } else {
            NotifBtn.tintColor = .lightGray
        }
        print("NOTIF")
    }
    
    
}

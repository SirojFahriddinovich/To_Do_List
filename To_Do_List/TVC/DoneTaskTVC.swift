//
//  DoneTaskTVC.swift
//  To_Do_List
//
//  Created by Macbook Air on 24/04/22.
//

import UIKit

class DoneTaskTVC: UITableViewCell {
    
    @IBOutlet weak var bacView: UIView!    
    @IBOutlet weak var prioretyView: UIView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var notifBtn: UIButton!
    
    let priorety : [String] = ["Yellow","Green","Red","blue"]
    let colors : [UIColor] = [.systemYellow, .systemGreen, .systemRed, .systemIndigo]
    var index = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
   
    func updateCell(task : TaskDM, index : Int) {
        
        self.index = index
        task.isNotif ? (notifBtn.tintColor = .systemYellow ) : (notifBtn.tintColor = .lightGray)
        self.dateLbl.text = task.date
        self.titleLbl.text = task.title
        for i in self.priorety.enumerated() {
            if task.priorety == i.element {
                prioretyView.backgroundColor = colors[i.offset]
            }
        }

        
    }

    
    @IBAction func doneTap(_ sender: Any) {
        print("DONE")
    }
    
    @IBAction func notifTap(_ sender: Any) {
        print("NOTIF")
    }
    
}

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
    @IBOutlet weak var titTxtFld: UITextField!
    @IBOutlet weak var dateTxtFld: UITextField!
    @IBOutlet var PrioretyBtns: [UIButton]!
    @IBOutlet weak var errorLbl: UILabel!
    let priorety : [String] = ["Yellow","Green","Red","blue"]
    let colors : [UIColor] = [.systemYellow, .systemGreen, .systemRed, .systemIndigo]
    let datePicker = UIDatePicker()
    let formatter = DateFormatter()
    var addNew : ((TaskDM) -> ())?
    var tag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePicker()
    }
    
    
    @IBAction func xTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func addTap(_ sender: Any) {
        if titTxtFld.text!.count > 3 && !dateTxtFld.text!.isEmpty {
            //  MAKE TASK
            let newTask = TaskDM()
            newTask.isDone = true
            newTask._id = "\(Date())"
            newTask.title = titTxtFld.text!
            newTask.date = formatter.string(from: datePicker.date)
            newTask.priorety = self.priorety[tag]
            addNew?(newTask)
            self.dismiss(animated: true)
        } else {
            self.errorLbl.textColor = .systemRed
            errorLbl.transform = .init(translationX: 100, y: 0)
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: []) {
                self.errorLbl.transform = .identity
            }
        }
    }
    
    @IBAction func prioretyTapped(_ sender: UIButton) {
        for i in PrioretyBtns.enumerated() {
            if i.offset == sender.tag {
                self.PrioretyBtns[sender.tag].setImage(nil, for: .normal)
                self.PrioretyBtns[sender.tag].backgroundColor = self.colors[sender.tag]
                self.PrioretyBtns[i.offset].setTitleColor(.white, for: .normal)
            } else {
                i.element.setImage(UIImage(systemName: "circle.fill"), for: .normal)
                i.element.tintColor = self.colors[i.offset]
                i.element.backgroundColor = .clear
                self.PrioretyBtns[i.offset].setTitleColor(UIColor.systemGray2, for: .normal)
            }
        }
    }
    
    
}

//MARK: - DATEPICKER METHODS
extension AddTaskVC {
    
    func setDatePicker() {
        datePicker.datePickerMode = .dateAndTime
        datePicker.backgroundColor = .clear
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.minimumDate = Date()
        dateTxtFld.inputView = datePicker
        formatter.dateFormat = "MMMM-dd HH:mm"
        datePicker.addTarget(self, action: #selector(self.dateChanged), for: .allEvents)
    }
    
    @objc func dateChanged() {
        dateTxtFld.text = formatter.string(for: datePicker.date)
    }
    
}

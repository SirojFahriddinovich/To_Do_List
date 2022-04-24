//
//  TasksVC.swift
//  To_Do_List
//
//  Created by Macbook Air on 24/04/22.
//

import UIKit

class TasksVC: UIViewController {

    @IBOutlet weak var notifView: UIView!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
            tableView.register(UINib(nibName: "TaskTVC", bundle: nil), forCellReuseIdentifier: "TaskTVC")
            tableView.register(UINib(nibName: "DoneTaskTVC", bundle: nil), forCellReuseIdentifier: "DoneTaskTVC")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func xTap(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.notifView.transform = .init(translationX: 0, y: 80)
            self.notifView.isHidden = true
        }
     
    }
    
    
    @IBAction func addTap(_ sender: Any) {
        let vc = AddTaskVC.init(nibName: "AddTaskVC", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
}


extension TasksVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTVC", for: indexPath) as! TaskTVC
            cell.updateCell(index: indexPath.row)
            cell.animateCell()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DoneTaskTVC", for: indexPath) as! DoneTaskTVC
            cell.updateCell(index: indexPath.row)
            cell.animateCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "UnDone"
        } else {
            return "Done"
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let remove = UIContextualAction(style: .normal, title: "delete") { _, _, _ in
            print("Deleted")
        }
        
        remove.image = UIImage(named: "tr")
        remove.backgroundColor = .white
        
        let configuration = UISwipeActionsConfiguration(actions: [remove])
        
        return configuration
    }
    
}

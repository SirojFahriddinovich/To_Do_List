//
//  TasksVC.swift
//  To_Do_List
//
//  Created by Macbook Air on 24/04/22.
//

import UIKit
import RealmSwift

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
    
    var realm = try! Realm()
    var tasks = [TaskDM]()
    var doneTasks = [TaskDM]()
    var unDoneTasks = [TaskDM]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTasks()
    }
    
    @IBAction func xTap(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.notifView.transform = .init(translationX: 0, y: 80)
            self.notifView.isHidden = true
        }
     
    }
    
    
    @IBAction func addTap(_ sender: Any) {

        let vc = AddTaskVC.init(nibName: "AddTaskVC", bundle: nil)
        vc.addNew = { task in
            self.tasks.append(task)
            self.saveTask(task: task)
        }
        fetchTasks()
        self.tableView.reloadData()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
}

//MARK:  - TABLEVIEW
extension TasksVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return  self.tasks.count
        } else {
            return self.tasks.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTVC", for: indexPath) as! TaskTVC
            cell.updateCell(task: self.tasks[indexPath.row], index: indexPath.row)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DoneTaskTVC", for: indexPath) as! DoneTaskTVC
            cell.updateCell(task: self.tasks[indexPath.row], index: indexPath.row)
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
            if indexPath.section == 0 {
                self.deleteTask(task: self.tasks[indexPath.row])
            } else {
                self.deleteTask(task: self.tasks[indexPath.row])
            }
            print("Deleted")
        }
        
        remove.image = UIImage(named: "tr")
        remove.backgroundColor = .white
        
        let configuration = UISwipeActionsConfiguration(actions: [remove])
        return configuration
    }
    
}


//MARK: REALM METHODS
extension TasksVC {
    
    ///Save the task to realm
    func saveTask(task : TaskDM) {
       try! self.realm.write {
           self.realm.add(task)
        }
    }
    
    ///Get tasks from realm
    func fetchTasks() {
        self.tasks = realm.objects(TaskDM.self).compactMap{$0}
        tableView.reloadData()
    }
    
    ///Delete task from realim
    func deleteTask(task : TaskDM) {
        for i in self.tasks.enumerated() {
            if task == i.element {
               try! realm.write {
                    realm.delete(self.tasks[i.offset])
                    tasks.remove(at: i.offset)
                    tableView.reloadData()
                }
            }
        }
    }


}

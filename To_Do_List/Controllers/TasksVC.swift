//
//  TasksVC.swift
//  To_Do_List
//
//  Created by Macbook Air on 14/03/22.
//
import Foundation
import UIKit

class TasksVC: UIViewController {
    
    @IBOutlet weak var natifView: UIView!
    
    @IBOutlet weak var userImage: UIImageView! {
        didSet {
            if let img = loadImageFromDiskWith(fileName: "user") {
                self.userImage.image = img
            }
        }
    }
    
    @IBOutlet weak var hiUserLbl: UILabel! {
        didSet {
            if let name = UserDefaults.standard.string(forKey: "username") {
                self.hiUserLbl.text = "Hello \(name)!"
            }
        }
    }
    
    @IBOutlet weak var tasksCountLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func xTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.natifView.transform = CGAffineTransform(translationX: 0, y: 70)
            self.natifView.isHidden =  true
        }
    }
    
    
}

extension TasksVC {
    
    func loadImageFromDiskWith(fileName: String) -> UIImage? {
        
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        
        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageUrl.path)
            return image
            
        }
        
        return nil
    }
    
}

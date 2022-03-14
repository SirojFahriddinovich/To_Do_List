//
//  LoginVC.swift
//  To_Do_List
//
//  Created by Macbook Air on 13/03/22.
//
import Foundation
import UIKit

class LoginVC: UIViewController  {
    
    @IBOutlet weak var blurView: UIVisualEffectView! {
        didSet {
            blurView.alpha = 0.98
        }
    }
    
    @IBOutlet weak var userImage: UIImageView!
    
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var genderTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func getImage(_ sender: UITapGestureRecognizer) {
        showAlert()
        print("Tap_______")
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        UserDefaults.standard.set(nameTF.text!, forKey: "username")
        saveImage(imageName: "user", image: userImage.image!)
        let vc = TasksVC.init(nibName: "TasksVC", bundle: nil)
        self.present(vc, animated: true, completion: nil)
    }

    func saveImage(imageName: String, image: UIImage) {
        
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let fileName = imageName
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        print(fileURL)
        guard let data = image.jpegData(compressionQuality: 1) else { return }
     
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                print("Removed old image")
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }
        }
        
        do {
            try data.write(to: fileURL)
        } catch let error {
            print("error saving file with error", error)
        }
    }
    
    
    
    
    func getImage() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }

    
}


//MARK: - GET IMAGE DELEGATE
extension LoginVC :  UIImagePickerControllerDelegate & UINavigationControllerDelegate  {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let imageE = info[.editedImage] as? UIImage else {
        
            return
        }

        userImage.image = imageE
        picker.dismiss(animated: true)
        
    }
}

//MARK: - ALERT VC
extension LoginVC  {
    
    func showAlert() {
        let alertvc  = UIAlertController(title: "choose photo", message: "", preferredStyle: .alert)
        
        let choosePhoto = UIAlertAction(title: "Choose photo", style: .default) { _ in
            self.getImage()
        }
        
        let take = UIAlertAction(title: "Take photo", style: .default) { _ in
            self.getImage()
        }
        alertvc.addAction(choosePhoto)
        alertvc.addAction(take)
        present(alertvc, animated: true, completion: nil)
        
    }
    
    
    
}

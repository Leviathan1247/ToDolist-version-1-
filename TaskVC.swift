//
//  TaskVC.swift
//  ToDoList
//
//  Created by Левиафан on 2024-05-28.
//

import UIKit

class TaskVC: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var userTaskField: UITextField!
    
    weak var saveTaskDelegate: SaveUserTaskDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTaskField.delegate = self
       
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
           if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
               let keyboardHeight = keyboardFrame.cgRectValue.height
               view.frame.origin.y = -keyboardHeight / 2
           }
       }

       @objc func keyboardWillHide(notification: NSNotification) {
          if view.frame.origin.y != 0 {
               view.frame.origin.y = 0
           }
       }
       
       @objc func dismissKeyboard() {
           view.endEditing(true)
       }
    
    func textFieldDidBeginEditing(_ userTaskField: UITextField) {
        userTaskField.text = ""
        
    }
    
    
    @IBAction func saveTaskBtnPressed(_ sender: Any) {
        if let task = userTaskField.text{
            if !task.isEmpty {
                let task = TaskModel(taskName: task, taskCellColor: .white)
                saveTaskDelegate?.saveTask(task: task)
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
}

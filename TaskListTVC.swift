//
//  TaskListTVC.swift
//  ToDoList
//
//  Created by Левиафан on 2024-05-28.
//

import UIKit

class TaskListTVC: UITableViewController {
    var vc = TaskVC()
    var arrayUserTasks = [TaskModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayUserTasks.count
    }
    
    
    @IBAction func showTaskVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "TaskVC") as! TaskVC
        vc.saveTaskDelegate = self
        present(vc, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as? TaskCell else {
            return UITableViewCell()}
        arrayUserTasks[indexPath.row].currentIndex = indexPath
        let task = arrayUserTasks[indexPath.row]
        cell.cellData(task: task)
        cell.removeTaskDelegate = self
        cell.taskCompleteDelegate = self
        return cell
        
    }
    
}




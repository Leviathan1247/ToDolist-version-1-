//
//  TaskCell.swift
//  ToDoList
//
//  Created by Левиафан on 2024-05-28.
//

import UIKit

class TaskCell: UITableViewCell {
    
    
    @IBOutlet weak var someTask: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    weak var removeTaskDelegate: RemoveTaskDelegate?
    weak var taskCompleteDelegate: TaskCompleteDelegate?
    
    var task: TaskModel?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    func cellData(task: TaskModel) {
        someTask.text = task.taskName
        viewCell.backgroundColor = task.taskCellColor
        self.task = task
    }
    
    
    @IBAction func removeTaskBtnPressed(_ sender: Any) {
        guard let task = task else { return }
        removeTaskDelegate?.removeTask(task: task)
    }
    
    @IBAction func executeTaskBtnPressed(_ sender: Any) {
        guard let task = task else { return }
        taskCompleteDelegate?.taskComplet(task: task)
    }
    
    
}

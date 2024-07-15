//
//  Delegates.swift
//  ToDoList
//
//  Created by Левиафан on 2024-05-28.
//

import Foundation
import UIKit

protocol SaveUserTaskDelegate: AnyObject {
    func saveTask(task: TaskModel)
}

protocol RemoveTaskDelegate: AnyObject {
    func removeTask(task: TaskModel)
}

protocol TaskCompleteDelegate: AnyObject {
    func taskComplet(task: TaskModel)
}


extension TaskListTVC: SaveUserTaskDelegate {
    func saveTask(task: TaskModel){
        arrayUserTasks.append(task)
        tableView.reloadData()
    }
}

extension TaskListTVC: RemoveTaskDelegate {
    func removeTask(task: TaskModel) {
        guard let taskByIndex = task.currentIndex?.item else { return }
        arrayUserTasks.remove(at: taskByIndex)
        tableView.reloadData()
    }
}

extension TaskListTVC: TaskCompleteDelegate {
    func taskComplet(task: TaskModel) {
        guard let taskByIndex = task.currentIndex?.item else { return }
        arrayUserTasks[taskByIndex].taskCellColor = .gray
        tableView.reloadData()
    }
}

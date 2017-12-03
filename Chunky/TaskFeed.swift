//
//  TaskFeed.swift
//  Chunky
//
//  Created by Yichen Sun on 12/2/17.
//  Copyright © 2017 Yichen Sun. All rights reserved.
//

import Foundation

var allTasks: [Task] = []

//inserts each new task, guarantees sorted order by dueDates
func addTask(task: Task) {
    if (allTasks.count == 0) {
        allTasks.append(task)
    }
    else {
        var i = 0
        while (i < allTasks.count) {
            if task.dueDate < allTasks[i].dueDate {
                allTasks.insert(task, at: i)
                break
            } else {
                i += 1
            }
        }
    }
}

//
//  Task.swift
//  Chunky
//
//  Created by Yichen Sun on 12/2/17.
//  Copyright © 2017 Yichen Sun. All rights reserved.
//

import Foundation
class Task {
    let name: String
    let dueDate: Date
    var chunks: [String] = ["20%", "20%", "20%", "20%", "20%"]
    
    init(name: String, dueDate: Date, chunks: [String]) {
        self.name = name
        self.dueDate = dueDate
        self.chunks = chunks
    }
}

//
//  TaskCollectionViewCell.swift
//  Chunky
//
//  Created by Yichen Sun on 12/2/17.
//  Copyright © 2017 Yichen Sun. All rights reserved.
//

import UIKit

class TaskCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    @IBOutlet weak var chunk1: ChunkUIView!
    @IBOutlet weak var chunk2: ChunkUIView!
    @IBOutlet weak var chunk3: ChunkUIView!
    @IBOutlet weak var chunk4: ChunkUIView!
    @IBOutlet weak var chunk5: ChunkUIView!

    func getChunks(cell: TaskCollectionViewCell) -> [ChunkUIView] {
        return [cell.chunk1, cell.chunk2, cell.chunk3, cell.chunk4, cell.chunk5]
    }
}

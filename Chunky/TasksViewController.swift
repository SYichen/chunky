//
//  TasksViewController.swift
//  Chunky
//
//  Created by Yichen Sun on 12/4/17.
//  Copyright © 2017 Yichen Sun. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let appDel = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var collection: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allTasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TaskCollectionViewCell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TaskCollectionViewCell
        let task = allTasks[indexPath.item]
        let chunk = task.chunks as! [String]
        cell.name.text = task.name
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let date = dateFormatter.string(from: task.dueDate!)
        cell.dueDate.text = date
        cell.chunk1.label.text = chunk[0]
        cell.chunk1.task = task
        cell.chunk2.label.text = chunk[1]
        cell.chunk2.task = task
        cell.chunk3.label.text = chunk[2]
        cell.chunk3.task = task
        cell.chunk4.label.text = chunk[3]
        cell.chunk4.task = task
        cell.chunk5.label.text = chunk[4]
        cell.chunk5.task = task
        for chunk in cell.getChunks(cell: cell) {
            var completedChunks = task.completedChunks as! [Bool]
            if completedChunks[chunk.tag] {
                chunk.backgroundColor = UIColor.lightGray
            }
        }
        return cell
    }
    
    @IBAction func completeChunk(_ sender: UILongPressGestureRecognizer) {
        let view = sender.view as! ChunkUIView
        let tag = view.tag
        let task = view.task
        var completedChunks = (task?.completedChunks as! [Bool])
        completedChunks[tag] = true
        task?.completedChunks = completedChunks as NSObject
        view.backgroundColor = UIColor.lightGray
        if !((task?.completedChunks as! [Bool]).contains(false)) {
            let alertController = UIAlertController(title: "Task Completed!", message: "Would you like to delete this task?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
                let index = allTasks.index(where: { (item) -> Bool in
                    item.name == task!.name && item.dueDate == task!.dueDate
                })
                allTasks.remove(at: index!)
                self.context.delete(task!)
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                self.fetchTasksFromCoreData()
                self.collection.reloadData()
                })
            let noAction = UIAlertAction(title: "No, keep this task", style: .cancel, handler: nil)
            alertController.addAction(yesAction)
            alertController.addAction(noAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }


    override func viewDidLoad() {
        collection.delegate = self
        collection.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        fetchTasksFromCoreData()
        self.collection.reloadData()
    }
    
    func fetchTasksFromCoreData() {
        do {
            let tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            for task in tasks {
                addTask(task: task)
            }
        }
        catch {
            print("Fetch failed :'(")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

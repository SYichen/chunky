//
//  TaskCreationViewController.swift
//  Chunky
//
//  Created by Yichen Sun on 12/3/17.
//  Copyright © 2017 Yichen Sun. All rights reserved.
//

import UIKit

class TaskCreationViewController: UIViewController, UITextFieldDelegate {
    
    @IBAction func unwindToTaskCreation(sender: UIStoryboardSegue) {
        if sender.source is CustomChunkCreationViewController {
            if let senderVC = sender.source as? CustomChunkCreationViewController {
                self.chunks = senderVC.chunks
            }
        }
    }
    var taskName = ""
    var chunks = ["20%", "20%", "20%", "20%", "20%"]
    var completedChunks = [false, false, false, false, false]
    
    @IBOutlet weak var taskNameText: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var chunkStylePicker: UISegmentedControl!
    
    @IBAction func createTask(_ sender: UIButton) {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        let date = datePicker.date
        let task = Task(context: context)
        task.name = taskName
        task.dueDate = date
        task.chunks = chunks as NSObject
        task.completedChunks = completedChunks as NSObject
        appDel.saveContext()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskNameText.delegate = self
        // Do any additional setup after loading the view.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chunkStyleChanged(_ sender: UISegmentedControl) {
        if chunkStylePicker.selectedSegmentIndex == 1 {
            performSegue(withIdentifier: "createCustomChunks", sender: nil)
        } else {
            chunks = ["20%", "20%", "20%", "20%", "20%"]
        }
    }
    @IBAction func userTappedBackground(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != nil {
            taskName = textField.text!
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

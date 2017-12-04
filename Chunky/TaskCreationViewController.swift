//
//  TaskCreationViewController.swift
//  Chunky
//
//  Created by Yichen Sun on 12/3/17.
//  Copyright © 2017 Yichen Sun. All rights reserved.
//

import UIKit

class TaskCreationViewController: UIViewController, UITextFieldDelegate {
    
    var taskName = ""
    var chunks = ["20%", "20%", "20%", "20%", "20%"]
    
    @IBOutlet weak var taskNameText: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var chunkStylePicker: UISegmentedControl!
    
    @IBAction func createTask(_ sender: UIButton) {
        let date = datePicker.date
        let task = Task(name: taskName, dueDate: date, chunks: chunks)
        addTask(task: task)
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
        if chunkStylePicker.selectedSegmentIndex == 0 {
            performSegue(withIdentifier: "createCustomChunks", sender: nil)
        } else {
            chunks = ["20%", "20%", "20%", "20%", "20%"]
        }
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

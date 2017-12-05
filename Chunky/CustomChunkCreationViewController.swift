//
//  CustomChunkCreationViewController.swift
//  Chunky
//
//  Created by Yichen Sun on 12/3/17.
//  Copyright © 2017 Yichen Sun. All rights reserved.
//

import UIKit

class CustomChunkCreationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var chunk1Text: UITextField!
    @IBOutlet weak var chunk2Text: UITextField!
    @IBOutlet weak var chunk3Text: UITextField!
    @IBOutlet weak var chunk4Text: UITextField!
    @IBOutlet weak var chunk5Text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.chunk1Text.delegate = self
        self.chunk2Text.delegate = self
        self.chunk3Text.delegate = self
        self.chunk4Text.delegate = self
        self.chunk5Text.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    var chunks = ["", "", "", "", ""]
    
    @IBAction func userTappedBackground(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.chunk1Text {
            if textField.text != nil {
                self.chunks[0] = textField.text!
            }
        } else if textField == self.chunk2Text {
            if textField.text != nil {
                self.chunks[1] = textField.text!
            }
        } else if textField == self.chunk3Text {
            if textField.text != nil {
                self.chunks[2] = textField.text!
            }
        } else if textField == self.chunk4Text {
            if textField.text != nil {
                self.chunks[3] = textField.text!
            }
        }
        else {
            if textField.text != nil {
                self.chunks[4] = textField.text!
            }
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

//
//  ViewController.swift
//  Chunky
//
//  Created by Yichen Sun on 11/24/17.
//  Copyright © 2017 Yichen Sun. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    var userEmail = ""
    var userPassword = ""
    
    @IBAction func logInButton(_ sender: UIButton) {
        guard let email = emailText.text else {return}
        guard let password = passwordText.text else {return}
        
        if email == "" || password == "" {
            let alertController = UIAlertController(title: "Log In Error", message: "Please enter an email and password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            Auth.auth().signIn(withEmail: email, password: password, completion:  { (user, error) in
                if (error == nil) {
                    self.performSegue(withIdentifier: "logInToMainPage", sender: self)
                }
                else {
                    let alertController = UIAlertController(title: "Log In Error", message:
                        error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            )}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailText.delegate = self
        self.passwordText.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        Auth.auth().addStateDidChangeListener{ (auth, user) in
            if user != nil {
                self.performSegue(withIdentifier: "logInToMainPage", sender: self)
            }
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.emailText {
            if textField.text != nil {
                self.userEmail = textField.text!
            }
        } else {
            if textField.text != nil {
                self.userPassword = textField.text!
            }
        }
    }


}


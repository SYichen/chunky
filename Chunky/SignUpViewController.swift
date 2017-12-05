//
//  SignUpViewController.swift
//  Chunky
//
//  Created by Yichen Sun on 12/2/17.
//  Copyright © 2017 Yichen Sun. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var verifyPasswordText: UITextField!
    
    var userEmail = ""
    var userName = ""
    var userPassword = ""
    var userVerifiedPassWord = ""
    
    @IBAction func signUpButton(_ sender: UIButton) {
        guard let email = emailText.text else { return }
        guard let password = passwordText.text else { return }
        guard let name = nameText.text else { return }
        guard let verifiedPassword = verifyPasswordText.text else { return }
        if email == "" || password == "" || name == "" || verifiedPassword == "" {
            let alertController = UIAlertController(title: "Form Error.", message: "Please fill in form completely.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    let signup = user!.createProfileChangeRequest()
                    signup.displayName = name
                    signup.commitChanges(completion: { (error) in
                        if (error == nil) {
                            let alert = UIAlertController(title: "Success", message: "Account has been sucessfully created!", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                                self.performSegue(withIdentifier: "signUpToMainPage", sender: self)
                            }))
                            self.present(alert, animated: true, completion: nil)
                        }
                    })
                    // TO DO:
                    // The user account has been successfully created. Now, update the user's name in
                    // firebase and then perform a segue to the main page. Note, again, that this segue
                    // already exists somewhere, just do some simple debugging to find the identifier.
                    // Also, notify the user that the account has been successfully created before
                    // performing the segue.
                    
                } else if password != verifiedPassword {
                    let alertController = UIAlertController(title: "Verification Error.", message: "The two passwords do not match.", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.verifyPasswordText.textColor = UIColor.red
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "Sign Up Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameText.delegate = self
        self.emailText.delegate = self
        self.passwordText.delegate = self
        self.verifyPasswordText.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func userTappedBackground(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.emailText {
            if textField.text != nil {
                self.userEmail = textField.text!
            }
        } else if textField == self.passwordText {
            if textField.text != nil {
                self.userPassword = textField.text!
            }
        } else if textField == self.nameText {
            if textField.text != nil {
                self.userName = textField.text!
            }
        } else if textField == self.verifyPasswordText {
            if textField.text != nil {
                self.userVerifiedPassWord = textField.text!
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

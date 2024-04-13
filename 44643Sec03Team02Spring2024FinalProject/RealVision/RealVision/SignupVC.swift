//
//  SignupVC.swift
//  RealVision
//
//  Created by AKHIL REDDY on 06/03/24.
//

import UIKit
import FirebaseAuth

class SignupVC: UIViewController {
    
    
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPwdTF: UITextField!
    @IBOutlet weak var createAccountBTN: UIButton!
    @IBOutlet weak var loginBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()

    }
    
    @IBAction func login(_ sender: UIButton) {
        self.performSegue(withIdentifier: "LoginView", sender: sender)
    }
    
    @IBAction func createAccount(_ sender: UIButton) {
        guard let email = emailTF.text, !email.isEmpty else {
            openAlert(title: "Alert", message: "Please enter email!", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            return
        }
        
        guard let password = passwordTF.text, !password.isEmpty else {
            openAlert(title: "Alert", message: "Please enter password!", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            return
        }
        
        guard let username = usernameTF.text, !username.isEmpty else{
            openAlert(title: "Alert", message: "Please enter username!", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            return
        }
        
        guard let conPassword = confirmPwdTF.text, !conPassword.isEmpty else {
            openAlert(title: "Alert", message: "Please enter password in both fields!", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            return
        }
        
        guard password == conPassword else {
            openAlert(title: "Alert", message: "Passwords do not match!", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            if let error = error {
                let errorMessage = "Error creating user: \(error.localizedDescription)"
                openAlert(title: "Alert", message: "\(errorMessage)", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            } else {
                let successMessage = "User created successfully"
                openAlert(title: "Alert", message: "\(successMessage)", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                self.performSegue(withIdentifier: "LoginView", sender: self)
            }
        }
    }
    
    
}

//
//  SignupVC.swift
//  RealVision
//
//  Created by AKHIL REDDY on 06/03/24.
//

import UIKit

class SignupVC: UIViewController {
    
    
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPwdTF: UITextField!
    @IBOutlet weak var createAccountBTN: UIButton!
    @IBOutlet weak var loginBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: UIButton) {
        self.performSegue(withIdentifier: "LoginView", sender: sender)
    }
    
    @IBAction func createAccount(_ sender: UIButton) {
        if let email = emailTF.text, let password = passwordTF.text, let username = usernameTF.text, let conPassword = confirmPwdTF.text{
                                if username == ""{
                                    print("Please enter username")
                                }else if !email.validateEmailId(){
                                    openAlert(title: "Alert", message: "Please enter valid email", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                                    print("email is not valid")
                                }else if !password.validatePassword(){
                                    openAlert(title: "Alert", message: "Please enter valid Password", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                                    print("Password is not valid")
                                } else{
                                    if conPassword == ""{
                                        openAlert(title: "Alert", message: "Please enter valid Password", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                                        print("Please confirm password")
                                    }else{
                                        if password == conPassword{
                                            openAlert(title: "Alert", message: "Account created", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                                            usernameTF.text = ""
                                            emailTF.text = ""
                                            passwordTF.text = ""
                                            confirmPwdTF.text = ""
                                        }else{
                                            openAlert(title: "Alert", message: "password doesn't match", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                                            print("password does not match")
                                        }
                                    }
                                }
                            }else{
                                openAlert(title: "Alert", message: "please validate your details", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                                print("Please check your details")
                            }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

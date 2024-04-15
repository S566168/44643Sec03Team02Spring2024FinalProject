//
//  RealVisionVC.swift
//  RealVision
//
//  Created by S567161 on 2/20/24.
//

import UIKit
import Lottie
import FirebaseAuth
import AnimatedGradientView


class RealVisionVC: UIViewController {
    
    @IBOutlet weak var userNameLBL: UILabel!
    @IBOutlet weak var passwordLBL: UILabel!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!

    
    @IBOutlet weak var loginBTN: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        applyGradientBackground()
        
        // Do any additional setup after loading the view.
    }
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        self.userNameTF.text = ""
        self.passwordTF.text = ""
        self.passwordTF.isEnabled = false
        //self.loginBTN.isEnabled = false
    }
    
    //First Screen Actions
    private func applyGradientBackground(){
        let _: CAGradientLayerType = .axial
        let _: AnimatedGradientViewDirection = .up
        let animatedGradient = AnimatedGradientView(frame: self.view.bounds)
        animatedGradient.animationValues = [(colors: ["#2BC0E4", "#EAECC6"], .up, .axial),
                                            (colors: ["#833ab4", "#fd1d1d", "#fcb045"], .right, .axial),
                                            (colors: ["#003973", "#E5E5BE"], .down, .axial),
                                            (colors: ["#1E9600", "#FFF200", "#FF0000"], .left, .axial)]
        view.addSubview(animatedGradient)
        view.sendSubviewToBack(animatedGradient)
    }
    
    @IBAction func checkUsername(_ sender: UITextField) {
        guard let username = self.userNameTF.text, !username.isEmpty else{return}
        self.passwordTF.isEnabled = true
    }
    
    
    @IBAction func checkPassword(_ sender: UITextField) {
        guard let password = self.passwordTF.text, !password.isEmpty else{return}
        self.passwordTF.isEnabled = true
        
    }
    
    @IBAction func loginBTN(_ sender: UIButton) {
        guard let email = userNameTF.text, !email.isEmpty else {
                    openAlert(title: "Alert", message: "Email address not found", alertStyle: .alert, actionTitles: ["okay"], actionStyles: [.default], actions: [{ _ in}])
                    return
                }
                
                guard let password = passwordTF.text, !password.isEmpty else {
                        openAlert(title: "Alert", message: "please enter valid password", alertStyle: .alert, actionTitles: ["okay"], actionStyles: [.default], actions: [{ _ in}])
                    return
                }
                
                Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                    guard let self = self else { return }
                    if let error = error {
                        openAlert(title: "Alert", message: "Invalid Login Credentials! Please try again.", alertStyle: .alert, actionTitles: ["okay"], actionStyles: [.default], actions: [{ _ in}])
                    } else {
                        self.performSegue(withIdentifier: "HomescreenView", sender: sender)
                    }
                    
                }

    }
    
    
    @IBAction func forgotPwdBTN(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ResetpasswordView", sender: sender)
    }
    
    @IBAction func signUpBTN(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SignupView", sender: sender)
    }
    
    
    
    
    @IBAction func facebook(_ sender: UIButton) {
    }
    
    @IBAction func google(_ sender: UIButton) {
    }
    
    
}


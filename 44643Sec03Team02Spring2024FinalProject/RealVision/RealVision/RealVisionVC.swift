//
//  RealVisionVC.swift
//  RealVision
//
//  Created by S567161 on 2/20/24.
//

import UIKit
import Lottie

class RealVisionVC: UIViewController {
    
    @IBOutlet weak var userNameLBL: UILabel!
    @IBOutlet weak var passwordLBL: UILabel!
    //Second Screen Outlets
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var resetBTN: UIButton!
    @IBOutlet weak var cancelBTN: UIButton!
    @IBOutlet weak var emailLBL: UILabel!
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var LaunchLAV: LottieAnimationView!{
    didSet {
        LaunchLAV.animation = LottieAnimation.named("Detection")
        LaunchLAV.loopMode = .playOnce
        LaunchLAV.alpha = 1
        LaunchLAV.play { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.LaunchLAV.alpha = 0
            }
        }
    }
}
    
    //Third Screen Outlets
    
    @IBOutlet weak var fullNameLBL: UILabel!
    @IBOutlet weak var fullNameTF: UITextField!
    @IBOutlet weak var phoneNumberLBL: UILabel!
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var emailAddressLBL: UILabel!
    @IBOutlet weak var EmailAddressTF: UITextField!
    @IBOutlet weak var PwdLBL: UILabel!
    @IBOutlet weak var PwdTF: UITextField!
    @IBOutlet weak var confirmPwdLBL: UILabel!
    @IBOutlet weak var confirmPwdTF: UITextField!
    @IBOutlet weak var createAccBTN: UIButton!
    @IBOutlet weak var accountLBL: UILabel!
    @IBOutlet weak var loginBTN: UIButton!
    @IBOutlet weak var ResetPasswordLBL: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //First Screen Actions
    @IBAction func userTF(_ sender: UITextField) {
    }
    
    @IBAction func passwordTF(_ sender: UITextField) {
    }
    
    @IBAction func loginBTN(_ sender: UIButton) {
        if let email = userNameTF.text , let password = passwordTF.text {
            if !email.validateEmailId(){
                openAlert(title: "Alert", message: "Email address not found", alertStyle: .alert, actionTitles: ["okay"], actionStyles: [.default], actions: [{ _ in
                    print("Clicked")
                    
                }])
                
            }else if !password.validatePassword(){
                openAlert(title: "Alert", message: "please enter valid password", alertStyle: .alert, actionTitles: ["okay"], actionStyles: [.default], actions: [{ _ in
                    print("Clicked")
                    
                }])
            }else{
                
            }
        }else {
                openAlert(title: "Alert", message: "please add detail ", alertStyle: .alert, actionTitles: ["okay"], actionStyles: [.default], actions: [{ _ in
                    print("Clicked")
                    
                }])
            }
        }
    
    @IBAction func forgotPwdBTN(_ sender: UIButton) {
    }
    
    @IBAction func signUpBTN(_ sender: UIButton) {
    }
    
    //Second Screen Actions
    @IBAction func reset(_ sender: UIButton) {
    }
    
    
    @IBAction func cancel(_ sender: UIButton) {
    }
    
    
    @IBAction func email(_ sender: UITextField) {
    }

    
    @IBAction func fullname(_ sender: UITextField) {
    }
    
    @IBAction func phoneNumber(_ sender: UITextField) {
    }
    
    @IBAction func emailAddress(_ sender: UITextField) {
    }
    
    @IBAction func password(_ sender: UITextField) {
    }
    
    @IBAction func confirmPassword(_ sender: UITextField) {
    }
    
    
    @IBAction func login(_ sender: UIButton) {
    }
    
    @IBAction func createBTN(_ sender: UIButton) {
    }
    
    
    
}

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
        
        self.performSegue(withIdentifier: "HomescreenView", sender: sender)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        switch(segue.identifier){
//        case "HomescreenView":
//            guard let destvc = segue.destination as?
//            
//        default:
//            assert(false,"Invalid segue")
//        }
//    }
    
    @IBAction func forgotPwdBTN(_ sender: UIButton) {
    }
    
    @IBAction func signUpBTN(_ sender: UIButton) {
    }
    
}


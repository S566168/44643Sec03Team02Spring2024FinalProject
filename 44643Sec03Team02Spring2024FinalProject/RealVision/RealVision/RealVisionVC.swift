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
    
    
    @IBAction func userTF(_ sender: UITextField) {
    }
    
    @IBAction func passwordTF(_ sender: UITextField) {
    }
    
    @IBAction func loginBTN(_ sender: UIButton) {
    }
    
    @IBAction func forgotPwdBTN(_ sender: UIButton) {
    }
    
    @IBAction func signUpBTN(_ sender: UIButton) {
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

//
//  UserVC.swift
//  RealVision
//
//  Created by AKHIL REDDY on 17/04/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import AnimatedGradientView

class UserVC: UIViewController {
    
    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var emailLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyGradientBackground()
        nameLBL.text = Auth.auth().currentUser?.uid ?? ""
        emailLBL.text = Auth.auth().currentUser?.email ?? ""
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.subviews.first?.frame = self.view.bounds
        nameLBL.layer.cornerRadius = 5
        nameLBL.layer.borderWidth = 1
        emailLBL.layer.cornerRadius = 5
        emailLBL.layer.borderWidth = 1
        
    }
    
    private func applyGradientBackground(){
        let _: CAGradientLayerType = .axial
        let _: AnimatedGradientViewDirection = .up
        let animatedGradient = AnimatedGradientView(frame: self.view.bounds)
        animatedGradient.animationValues = [(colors: ["#E6E6FA", "#D8BFD8", "#DDA0DD", "#E6E6FA"], .up, .axial),
                                            (colors: ["#FFB6C1", "#FFA07A", "#FFDAB9", "#FFB6C1"], .right, .axial),
                                            (colors: ["#AFEEEE", "#F5FFFA", "#B0E0E6", "#AFEEEE"], .down, .axial),
                                            (colors: ["#FDD017", "#FFD700", "#FFEC8B", "#FDD017"], .left, .axial)]
        view.addSubview(animatedGradient)
        view.sendSubviewToBack(animatedGradient)
    }
    
    @IBAction func logout(_ sender: UIButton) {
        do {
            
            try Auth.auth().signOut()
        } catch {}
        
        self.performSegue(withIdentifier: "Backtologin", sender: self)
    }
    
    @IBAction func Delete(_ sender: UIButton) {
        
        let user = Auth.auth().currentUser
        
        user?.delete { error in
            if let error = error {
                self.openAlert(title: "Alert", message: "Error deleting user: \(error.localizedDescription)", alertStyle: .alert, actionTitles: ["okay"], actionStyles: [.default], actions: [{ _ in}])
            } else {
                self.openAlert(title: "Alert", message: "User deleted successfully", alertStyle: .alert, actionTitles: ["okay"], actionStyles: [.default], actions: [{ _ in}])
            }
        }
        self.performSegue(withIdentifier: "Backtologin", sender: self)
    }
}


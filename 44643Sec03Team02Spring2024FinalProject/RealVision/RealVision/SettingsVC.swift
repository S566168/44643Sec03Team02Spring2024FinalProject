//
//  settingsVC.swift
//  RealVision
//
//  Created by S567161 on 3/7/24.
//

import UIKit
import AnimatedGradientView

class SettingsVC: UIViewController {
    
    
    @IBOutlet weak var shareBTN: UIButton!
    @IBOutlet weak var helpBTN: UIButton!
    @IBOutlet weak var privacyBTN: UIButton!
    @IBOutlet weak var termsBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyGradientBackground()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.subviews.first?.frame = self.view.bounds
        
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
    
    @IBAction func share(_ sender: UIButton) {
        let activity = UIActivityViewController(activityItems: ["/Users/akhilreddy/Documents/44643Sec03Team02Spring2024FinalProject/44643Sec03Team02Spring2024FinalProject/44643Sec03Team02Spring2024FinalProject/RealVision"], applicationActivities: nil)
        activity.popoverPresentationController?.sourceView = self.view
        
        self.present(activity, animated: true, completion: nil)
        
    }
    
    @IBAction func help(_ sender: UIButton) {
        self.performSegue(withIdentifier: "HelpView", sender: sender)
    }
    
    
    @IBAction func privacy(_ sender: UIButton) {
        self.performSegue(withIdentifier: "PrivacyView", sender: sender)
    }
    
    @IBAction func terms(_ sender: UIButton) {
        self.performSegue(withIdentifier: "TermsView", sender: sender)
    }
    
    @IBAction func CancelBTN(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Cancel", sender: sender)
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

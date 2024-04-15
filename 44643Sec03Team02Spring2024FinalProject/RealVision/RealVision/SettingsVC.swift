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

        // Do any additional setup after loading the view.
    }
    
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

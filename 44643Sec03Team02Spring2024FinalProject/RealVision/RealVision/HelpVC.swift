//
//  HelpVC.swift
//  RealVision
//
//  Created by AKHIL REDDY on 29/03/24.
//

import UIKit
import AnimatedGradientView

class HelpVC: UIViewController {
    
    @IBOutlet weak var Message: UITextField!
    
    @IBOutlet weak var sendBTN: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
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
    
    @IBAction func Send(_ sender: Any) {
        
        if let message = Message.text{
            if message == ""{
                openAlert(title: "Alert", message: "Please enter a valid message", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            }else{
                openAlert(title: "Alert", message: "Thanks for your message!! you will receive reply from us back in 3 business days", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                Message.text = ""
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
}

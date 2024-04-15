//
//  TermsVC.swift
//  RealVision
//
//  Created by S567161 on 4/12/24.
//

import UIKit
import AnimatedGradientView

class TermsVC: UIViewController {

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

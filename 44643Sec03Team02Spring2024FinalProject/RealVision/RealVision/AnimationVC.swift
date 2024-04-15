//
//  AnimationVC.swift
//  RealVision
//
//  Created by AKHIL REDDY on 11/04/24.
//

import UIKit
import Lottie
import AnimatedGradientView

class AnimationVC: UIViewController {

    @IBOutlet weak var LaunchLAV: LottieAnimationView!{
        didSet{
            LaunchLAV.animation = LottieAnimation.named("Detection")
            LaunchLAV.loopMode = .playOnce
            LaunchLAV.alpha = 1
            LaunchLAV.play { [weak self] _ in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.LaunchLAV.alpha = 0
                    self.performSegue(withIdentifier: "LoginscreenView", sender: Any?.self)
                }
            }
        }
    }
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

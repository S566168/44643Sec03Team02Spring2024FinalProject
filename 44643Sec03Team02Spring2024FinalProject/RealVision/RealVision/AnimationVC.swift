//
//  AnimationVC.swift
//  RealVision
//
//  Created by AKHIL REDDY on 11/04/24.
//

import UIKit
import Lottie

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

        // Do any additional setup after loading the view.
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

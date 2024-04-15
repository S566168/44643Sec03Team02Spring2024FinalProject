//
//  HomescreenVC.swift
//  RealVision
//
//  Created by AKHIL REDDY on 06/03/24.
//

import UIKit
import AnimatedGradientView

class HomescreenVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var logoBTN: UIButton!
    @IBOutlet weak var settingsBTN: UIButton!
    @IBOutlet weak var photosBTN: UIButton!
    @IBOutlet weak var liveBTN: UIButton!

    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        applyGradientBackground()

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
    
    
    @IBAction func SettingsBTN(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SettingsView", sender: sender)
    }
    
    @IBAction func photos(_ sender: UIButton) {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                imageView.image = pickedImage // Use the imageView outlet
            }
            dismiss(animated: true, completion: nil)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
    
    @IBAction func live(_ sender: UIButton) {
    }
    

    
    @IBAction func LogoBTN(_ sender: UIButton) {
        self.performSegue(withIdentifier: "LoginView", sender: sender)
        
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

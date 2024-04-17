//
//  HomescreenVC.swift
//  RealVision
//
//  Created by AKHIL REDDY on 06/03/24.
//

import UIKit
import AnimatedGradientView
import CoreML

enum Model: String {
    case Resnet50
    case MobileNetV2
    case SqueezeNet
    case Person
}

let models: [Model] = [.Resnet50, .MobileNetV2, .SqueezeNet, .Person]

class HomescreenVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var selectedModel:Model = .Resnet50
    
    @IBOutlet weak var logoBTN: UIButton!
    @IBOutlet weak var settingsBTN: UIButton!
    @IBOutlet weak var photosBTN: UIButton!
    @IBOutlet weak var liveBTN: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    let globalPicker = GlobalPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        applyGradientBackground()

    }
    
    @IBAction func pickerBTN(_ sender: UIButton) {
    
    self.globalPicker.stringArray =  models.map { $0.rawValue }
    
    self.globalPicker.modalPresentationStyle = .overCurrentContext
    self.globalPicker.onDone = { [weak self] index in
            guard let self = self else { return }
            if let selectedModel = Model(rawValue: models[index].rawValue) {
                self.selectedModel = selectedModel
            }
       }
    
    self.present(self.globalPicker, animated: true, completion: nil)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "liveVC" {
            if let destinationVC = segue.destination as? LiveVC {
                switch selectedModel {
                case .Resnet50:
                    destinationVC.selectedModel =  try! Resnet50(configuration: MLModelConfiguration()).model
                case .MobileNetV2:
                    destinationVC.selectedModel =  try! MobileNetV2(configuration: MLModelConfiguration()).model
                case .SqueezeNet:
                    destinationVC.selectedModel =  try! SqueezeNet(configuration: MLModelConfiguration()).model
                case .Person:
                    destinationVC.selectedModel = try! Person(configuration: MLModelConfiguration()).model
                }
            }
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

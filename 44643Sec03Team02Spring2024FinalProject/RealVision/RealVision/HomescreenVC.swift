//
//  HomescreenVC.swift
//  RealVision
//
//  Created by AKHIL REDDY on 06/03/24.
//

import UIKit
import AnimatedGradientView
import CoreML
import Vision
import AudioToolbox

enum Model: String {
    case Resnet50
    case MobileNetV2
    case SqueezeNet
    case Person
}

let models: [Model] = [.Resnet50, .MobileNetV2, .SqueezeNet, .Person]

class HomescreenVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var selectedModel:Model = .Resnet50
    var visionModel: VNCoreMLModel!
    
    @IBOutlet weak var settingsBTN: UIButton!
    @IBOutlet weak var photosBTN: UIButton!
    @IBOutlet weak var liveBTN: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var messageLBL: UILabel!
    
    
    
    let imagePicker = UIImagePickerController()
    let globalPicker = GlobalPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        applyGradientBackground()

        if let model = try? VNCoreMLModel(for: MobileNetV2().model) {
                   visionModel = model
               } else {
                   print("Failed to load Core ML model.")
               }
               
               configureGestures()
               messageLBL.text = "upload an image"
    }
    func configureGestures() {
                let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
                doubleTapGesture.numberOfTapsRequired = 2
                imageView.addGestureRecognizer(doubleTapGesture)
                
                imageView.isUserInteractionEnabled = true
            }
            
        @objc func handleDoubleTap() {
            guard imageView.image != nil else {
                return // No need to prompt if there's no image
            }
            AudioServicesPlaySystemSound(1104)
            let alertController = UIAlertController(title: "Reset Image", message: "Do you want to reset the image?", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
                self.imageView.image = nil
                self.messageLBL.text = "Image reset."
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true, completion: nil)
        }
            
            func classifyImage(_ image: UIImage) {
                guard let ciImage = CIImage(image: image) else { return }
                
                let request = VNCoreMLRequest(model: visionModel) { request, error in
                    guard let results = request.results as? [VNClassificationObservation],
                          let topResult = results.first else {
                        print("Failed to classify image:", error ?? "Unknown error")
                        return
                    }
                    
                    DispatchQueue.main.async {
                        // Update UI with classification result
                        self.messageLBL.text = "This image is  \(topResult.identifier.description)."
                    }
                }
                
                let handler = VNImageRequestHandler(ciImage: ciImage)
                do {
                    try handler.perform([request])
                } catch {
                    print("Failed to perform classification:", error)
                }
            }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            self.view.subviews.first?.frame = self.view.bounds
            
        }
    
    @IBAction func onHand(_ sender: Any) {
    
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
            picker.dismiss(animated: true)
            guard let pickedImage = info[.originalImage] as? UIImage else { return }
            imageView.image = pickedImage
            messageLBL.text = "Classifying image..."
            
            // Classify the image immediately after it's picked
            classifyImage(pickedImage)
            
            // Play a sound or perform any other actions if needed
            AudioServicesPlaySystemSound(1109)
        }

            
            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                dismiss(animated: true, completion: nil)
            }
    
    @IBAction func live(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "liveVC", sender: sender)
    }
    
    @IBAction func Profile(_ sender: UIButton) {
        performSegue(withIdentifier: "ProfileView", sender: self)
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

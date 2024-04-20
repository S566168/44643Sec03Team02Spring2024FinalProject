//
//  LiveVCViewController.swift
//  RealVision
//
//  Created by Sushma Mundlamuri on 4/12/24.
//

import UIKit
import AVKit
import Vision
import AudioToolbox

class LiveVC: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    var selectedModel = Resnet50().model
    
    override var prefersStatusBarHidden:Bool{
        return true
    }
    
    @IBOutlet weak var Live: UIView!
    
    @IBOutlet weak var Objectdescription: UILabel!
    @IBOutlet weak var Accuracy: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let captureSession = AVCaptureSession()
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        view.addSubview(Live)
        
        Live.clipsToBounds = true
        Live.layer.cornerRadius = 15.0
        Live.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        let  dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        guard let model = try? VNCoreMLModel(for: selectedModel) else { return }
        let request = VNCoreMLRequest(model: model) { (finishedReq, err) in
            guard let results = finishedReq.results as? [VNClassificationObservation] else {return}
            guard let firstObservation = results.first else {return}
            let name: String = firstObservation.identifier
            let acc: Int = Int(firstObservation.confidence * 100)
            DispatchQueue.main.async {
                self.Objectdescription.text = name
                self.Accuracy.text = "Accuracy: \(acc)%"
            }
            
        }
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
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

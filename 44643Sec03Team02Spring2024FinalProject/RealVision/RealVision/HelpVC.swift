//
//  HelpVC.swift
//  RealVision
//
//  Created by AKHIL REDDY on 29/03/24.
//

import UIKit

class HelpVC: UIViewController {
    
    @IBOutlet weak var Message: UITextField!
    
    @IBOutlet weak var sendBTN: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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

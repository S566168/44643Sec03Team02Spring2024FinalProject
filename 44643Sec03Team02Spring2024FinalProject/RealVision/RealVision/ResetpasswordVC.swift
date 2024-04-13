//
//  ReserpasswordVC.swift
//  RealVision
//
//  Created by AKHIL REDDY on 06/03/24.
//

import UIKit
import FirebaseAuth

class ResetpasswordVC: UIViewController {
    
    @IBOutlet weak var resetPasswordLBL: UILabel!
    @IBOutlet weak var emailLBL: UILabel!
    @IBOutlet weak var emailIdTF: UITextField!
    @IBOutlet weak var resetBTN: UIButton!
    @IBOutlet weak var cancelBTN: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        

        // Do any additional setup after loading the view.
        

    }
    
    
    
    
    @IBAction func reset(_ sender: UIButton) {
        guard let email = emailIdTF.text, !email.isEmpty else {
                    openAlert(title: "Alert", message: "Please enter email!", alertStyle: .alert, actionTitles: ["okay"], actionStyles: [.default], actions: [{_ in }])
                    return
                }
                Auth.auth().sendPasswordReset(withEmail: email) { [weak self] error in
                    guard let self = self else { return }
                    if let error = error {
                        openAlert(title: "Alert", message: "Error sending reset email:", alertStyle: .alert, actionTitles: ["okay"], actionStyles: [.default], actions: [{_ in }])
                    } else {
                        openAlert(title: "Alert", message: "Reset email sent successfully", alertStyle: .alert, actionTitles: ["okay"], actionStyles: [.default], actions: [{_ in }])
                        emailIdTF.text = ""
                    }
                }

    }
    @IBAction func Cancel(_ sender: UIButton) {
        self.performSegue(withIdentifier: "LoginView", sender: sender)
    }
    
    
    func showAlert(message: String, completion: @escaping () -> Void) {
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                
                completion()
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
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

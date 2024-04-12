//
//  ReserpasswordVC.swift
//  RealVision
//
//  Created by AKHIL REDDY on 06/03/24.
//

import UIKit

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
        resetBTN.isEnabled = false
        emailIdTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
            if let email = emailIdTF.text, isValidEmail(email: email) {
                resetBTN.isEnabled = true
            } else {
                resetBTN.isEnabled = false
            }
        }
    func isValidEmail(email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }

    
    @IBAction func email(_ sender: UITextField) {
    }
    
    @IBAction func reset(_ sender: UIButton) {
        guard let email = emailIdTF.text else {
                    return
                }
                
        showAlert(message: "Password reset link sent to \(email)"){
            self.performSegue(withIdentifier: "LoginView", sender: sender)
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

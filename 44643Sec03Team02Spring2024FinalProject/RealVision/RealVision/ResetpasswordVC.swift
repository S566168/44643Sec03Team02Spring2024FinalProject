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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func email(_ sender: UITextField) {
    }
    
    @IBAction func reset(_ sender: UIButton) {
    }
    @IBAction func Cancel(_ sender: UIButton) {
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

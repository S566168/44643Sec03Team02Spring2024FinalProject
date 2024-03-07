//
//  HomescreenVC.swift
//  RealVision
//
//  Created by AKHIL REDDY on 06/03/24.
//

import UIKit

class HomescreenVC: UIViewController {
    
    @IBOutlet weak var logoBTN: UIButton!
    @IBOutlet weak var settingsBTN: UIButton!
    @IBOutlet weak var photosBTN: UIButton!
    @IBOutlet weak var liveBTN: UIButton!
    @IBOutlet weak var scannerBTN: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    @IBAction func settings(_ sender: UIButton) {
    }
    
    @IBAction func photos(_ sender: UIButton) {
    }
    
    @IBAction func live(_ sender: UIButton) {
    }
    
    @IBAction func scanner(_ sender: UIButton) {
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

//
//  settingsVC.swift
//  RealVision
//
//  Created by S567161 on 3/7/24.
//

import UIKit

class SettingsVC: UIViewController {
    
    
    @IBOutlet weak var shareBTN: UIButton!
    @IBOutlet weak var helpBTN: UIButton!
    @IBOutlet weak var privacyBTN: UIButton!
    @IBOutlet weak var termsBTN: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func share(_ sender: UIButton) {
        let activity = UIActivityViewController(activityItems: ["/Users/akhilreddy/Documents/44643Sec03Team02Spring2024FinalProject/44643Sec03Team02Spring2024FinalProject/44643Sec03Team02Spring2024FinalProject/RealVision"], applicationActivities: nil)
                activity.popoverPresentationController?.sourceView = self.view
                
                self.present(activity, animated: true, completion: nil)
        
    }
    
    @IBAction func help(_ sender: UIButton) {
        self.performSegue(withIdentifier: "HelpView", sender: sender)
    }
    
    
    @IBAction func privacy(_ sender: UIButton) {
    }
    
    @IBAction func terms(_ sender: UIButton) {
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

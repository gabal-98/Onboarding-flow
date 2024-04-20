//
//  ViewController.swift
//  project 7 ( Onboarding )
//
//  Created by robusta on 20/04/2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if Core.shared.isNewUser() {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "welcome") as? WelcomeViewController {
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true)
            }
        }
    }


}

struct Core {
    
    static let shared = Core()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}


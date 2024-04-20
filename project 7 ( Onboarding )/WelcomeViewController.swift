//
//  WelcomeViewController.swift
//  project 7 ( Onboarding )
//
//  Created by robusta on 20/04/2024.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var onboardingView: UIView!
    
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }

    func configure(){
        scrollView.frame = onboardingView.bounds
        onboardingView.addSubview(scrollView)
        
        let titles = ["welcome" , "location" , "all set"]
        for x in 0..<3 {
            
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * onboardingView.frame.size.width, y: 0, width: onboardingView.frame.size.width, height: onboardingView.frame.size.height))
            scrollView.addSubview(pageView)
            
            let label = UILabel(frame: CGRect(x: 10, y: 10, width: pageView.frame.size.width - 20, height: 120))
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10+120+10, width: pageView.frame.size.width - 20, height: pageView.frame.size.height - 60 - 130 - 15))
            let button = UIButton(frame: CGRect(x: 10, y: pageView.frame.size.height - 60, width: pageView.frame.size.width - 20, height: 50))
            
            label.textAlignment = .center
            label.font = UIFont(name: "Helvetica-Bold", size: 32)
            label.text = titles[x]
            pageView.addSubview(label)
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "welcome_\(x+1)")
            pageView.addSubview(imageView)
            
            button.backgroundColor = .black
            button.setTitleColor(.white, for: .normal)
            button.setTitle("welcome", for: .normal)
            if x == 2 {
                button.setTitle("Get Started", for: .normal)
            }
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            button.tag = x+1
            pageView.addSubview(button)
        }
        
        scrollView.contentSize = CGSize(width: onboardingView.frame.size.width*3, height: 0)
        scrollView.isPagingEnabled = true

    }
    
    @objc func didTapButton(_ button: UIButton){
        guard button.tag < 3 else {
            Core.shared.setIsNotNewUser()
            dismiss(animated: true)
            return
        }
        scrollView.setContentOffset(CGPoint(x: onboardingView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
    }
}

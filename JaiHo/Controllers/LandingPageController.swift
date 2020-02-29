//
//  ViewController.swift
//  JaiHo
//
//  Created by Barchhiha, Vaibhav on 06/02/20.
//  Copyright © 2020 Barchhiha, Vaibhav. All rights reserved.
//

import UIKit

class LandingPageController: UIViewController, UserTypeSelector {    
    var isUser: Bool = false
    
    @IBOutlet weak var slidingImageView: UIImageView!
    @IBOutlet weak var slidingImagePageView: UIPageControl!
    @IBOutlet weak var priestSelectorButton: CustomSelectButton!
    @IBOutlet weak var userSelectorButton: CustomSelectButton!
    
    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var priestButtonsContainerView: UIView!
    @IBOutlet weak var userButtonsContainerView: UIView!
    
    @IBOutlet weak var priestCreateButtonReference: UIButton!
    @IBOutlet weak var userCreateButtonReference: UIButton!
    
    private var datasourceSlidingImageView = [UIImage]()
    private var selectedImageNumber = 0
    private var isPriestSelected: Bool?
    private var timer: Timer!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        datasourceSlidingImageView = [UIImage.init(named: "Image1.jpg")!, UIImage.init(named: "Image2.jpeg")!, UIImage.init(named: "Image3.jpg")!, UIImage.init(named: "Image4.jpg")!]
        
        mainContainerView.makeRoundedView(width: 2.0)
        
        priestCreateButtonReference.tag = 0
        userCreateButtonReference.tag = 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
         timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (timer) in
            if self.selectedImageNumber > self.datasourceSlidingImageView.count - 1 {
                self.selectedImageNumber = 0
            }
            self.slidingImageView.image = self.datasourceSlidingImageView[self.selectedImageNumber]
            self.slidingImagePageView.currentPage = self.selectedImageNumber
            self.selectedImageNumber += 1
        }
        timer.fire()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    @IBAction func priestSelectorButtonTapped(_ sender: Any) {
        if let value = isPriestSelected, value == false {
            userSelectorButton.isSelected = false
        }
        priestSelectorButton.isSelected = true
        if isPriestSelected == nil || isPriestSelected == false {
            userButtonsContainerView.isHidden = true
            priestButtonsContainerView.frame.origin.x = UIScreen.main.bounds.width
            priestButtonsContainerView.isHidden = false
            UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: {
               self.priestButtonsContainerView.frame.origin.x = 10
            }, completion: nil)
        }
        isPriestSelected = true
    }
    
    @IBAction func userSelectorButtonTapped(_ sender: Any) {
        if let value = isPriestSelected, value == true {
            priestSelectorButton.isSelected = false
        }
        if isPriestSelected == nil || isPriestSelected == true {
            priestButtonsContainerView.isHidden = true
            userButtonsContainerView.frame.origin.x = UIScreen.main.bounds.width
            userButtonsContainerView.isHidden = false
            UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: {
                self.userButtonsContainerView.frame.origin.x = 10
            }, completion: nil)
        }
        userSelectorButton.isSelected = true
        isPriestSelected = false
    }
    
    @IBAction func oldUserAccountPressed(_ sender: Any) {
        
    }
    
    @IBAction func createPriestAccountPressed(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "CreatePriestAccountVC") as! CreatePriestAccountVC
//        let navVC = storyboard.instantiateViewController(withIdentifier: "CreateAccount") as! UINavigationController
//        navVC.pushViewController(vc, animated: true)
//        self.present(navVC, animated: true, completion: nil)
        
    }
    
    @IBAction func testPriestAccountPressed(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let buttonName = sender as? UIButton {
            if let destination = segue.destination as? CreateAccountVC {
                destination.userTypeDelegate = self
                if (buttonName.tag == 1) {
                    isUser = true
                } else {
                    isUser = false
                }
            }
        }
    }
}


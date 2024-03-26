//
//  ViewController.swift
//  1st_hw_KimMinjun
//
//  Created by 김민준 on 3/21/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var eight_bt: UIButton!
    @IBOutlet var seven_bt: UIButton!
    @IBOutlet var divide_bt: UIButton!
    @IBOutlet var mard_bt: UIButton!
    @IBOutlet var pm_bt: UIButton!
    @IBOutlet var ac_bt: UIButton!
    @IBOutlet var four_bt: UIButton!
    
    @IBOutlet var equal_bt: UIButton!
    @IBOutlet var dot_bt: UIButton!
    @IBOutlet var zero_bt: UIButton!
    @IBOutlet var plus_bt: UIButton!
    @IBOutlet var three_bt: UIButton!
    @IBOutlet var two_bt: UIButton!
    @IBOutlet var one_bt: UIButton!
    @IBOutlet var subtract_bt: UIButton!
    @IBOutlet var six_bt: UIButton!
    @IBOutlet var five_bt: UIButton!
    @IBOutlet var multiply_bt: UIButton!
    @IBOutlet var nine_bt: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.ac_bt.layer.masksToBounds = true
        self.ac_bt.layer.cornerRadius = 44
        
        self.pm_bt.layer.masksToBounds = true
        self.pm_bt.layer.cornerRadius = 44
        
        self.mard_bt.layer.masksToBounds = true
        self.mard_bt.layer.cornerRadius = 44
        
        self.divide_bt.layer.masksToBounds = true
        self.divide_bt.layer.cornerRadius = 44

        self.seven_bt.layer.masksToBounds = true
        self.seven_bt.layer.cornerRadius = 44
        
        self.eight_bt.layer.masksToBounds = true
        self.eight_bt.layer.cornerRadius = 44
        
        self.nine_bt.layer.masksToBounds = true
        self.nine_bt.layer.cornerRadius = 44
        
        self.multiply_bt.layer.masksToBounds = true
        self.multiply_bt.layer.cornerRadius = 44
        
        self.four_bt.layer.masksToBounds = true
        self.four_bt.layer.cornerRadius = 44
        
        self.five_bt.layer.masksToBounds = true
        self.five_bt.layer.cornerRadius = 44
        
        self.six_bt.layer.masksToBounds = true
        self.six_bt.layer.cornerRadius = 44
        
        self.subtract_bt.layer.masksToBounds = true
        self.subtract_bt.layer.cornerRadius = 44
        
        self.one_bt.layer.masksToBounds = true
        self.one_bt.layer.cornerRadius = 44
        
        self.two_bt.layer.masksToBounds = true
        self.two_bt.layer.cornerRadius = 44
        
        self.three_bt.layer.masksToBounds = true
        self.three_bt.layer.cornerRadius = 44
        
        self.plus_bt.layer.masksToBounds = true
        self.plus_bt.layer.cornerRadius = 44
        
        self.zero_bt.layer.masksToBounds = true
        self.zero_bt.layer.cornerRadius = 44
        
        self.dot_bt.layer.masksToBounds = true
        self.dot_bt.layer.cornerRadius = 44
        
        self.equal_bt.layer.masksToBounds = true
        self.equal_bt.layer.cornerRadius = 44
    }


}


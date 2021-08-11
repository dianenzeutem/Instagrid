//
//  ViewController.swift
//  Instagrid
//
//  Created by Dee Dee on 11/08/2021.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var frameview: FrameView!
   
    
    @IBAction func setLayout1(_ sender: UIButton) {
        frameview.style = .layout1
    }
    
    @IBAction func setLayout2(_ sender: UIButton) {
        frameview.style = .layout2
    }
    
    
    @IBAction func setLayout3(_ sender: UIButton) {
        frameview.style = .layout3
    }
    

}


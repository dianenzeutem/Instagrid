//
//  ViewController.swift
//  Instagrid
//
//  Created by Dee Dee on 11/08/2021.
//

import UIKit

class ViewController: UIViewController {
    private var bntImage : UIButton!
    
    @IBOutlet weak var frameview: FrameView!
    @IBOutlet weak var btnLayout1: UIButton!
    @IBOutlet weak var btnLayout2: UIButton!
    @IBOutlet weak var btnLayout3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setLayout1(_ sender: UIButton) {
        frameview.style = .layout1
        resetSelection(sender)
    }
    
    @IBAction func setLayout2(_ sender: UIButton) {
        frameview.style = .layout2
        resetSelection(sender)
    }
    
    @IBAction func setLayout3(_ sender: UIButton) {
        frameview.style = .layout3
        resetSelection(sender)
    }
    
    @IBAction func changeImage(_ sender: UIButton) {
        bntImage = sender
        openImagePicker()
    }
    
    private func resetSelection(_ sender : UIButton){
        btnLayout1.isSelected = false
        btnLayout2.isSelected = false
        btnLayout3.isSelected = false
        
        sender.isSelected = true
    }
    
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController (_ _picker : UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any ]) {
        if let picture = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            bntImage.setImage(picture, for: .normal)
            bntImage.subviews.first?.contentMode = .scaleAspectFill
            self.dismiss(animated: true, completion: nil)
        }
    }

    private func openImagePicker(){
        let controler = UIImagePickerController()
        controler.sourceType = .photoLibrary
        controler.delegate = self
        controler.allowsEditing = true
        self.present(controler, animated: true)
    }
    
}

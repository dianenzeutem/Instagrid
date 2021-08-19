//
//  ViewController.swift
//  Instagrid
//
//  Created by Dee Dee on 11/08/2021.
//
import UIKit

class ViewController: UIViewController {
    private var bntImage : UIButton!
    // Swipe gesture
    private var gesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(gesture:)))
    private var isLandscape = false
    // Frame contening the images
    @IBOutlet weak var frameView: FrameView!
    // 3 buttons for layout selection
    
    
    @IBOutlet weak var btnLayout1: UIButton!
    
    @IBOutlet weak var btnLayout2: UIButton!
    
    @IBOutlet weak var btnLayout3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        determineMyDeviceOrientation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(gesture:)))
        self.view.addGestureRecognizer(gesture)
        determineMyDeviceOrientation()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        determineMyDeviceOrientation()
    }
    
    func determineMyDeviceOrientation()
    {
        if UIDevice.current.orientation.isLandscape {
            gesture.direction = .left
            isLandscape = true
            
        } else {
            gesture.direction = .up
            isLandscape = false
        }
    }
    
    // change frameView layout
    @IBAction func setLayout1(_ sender: UIButton) {
        frameView.style = .layout1
        resetSelection(sender)
    }
    
    @IBAction func setLayout2(_ sender: UIButton) {
        frameView.style = .layout2
        resetSelection(sender)
    }
    
    @IBAction func setLayout3(_ sender: UIButton) {
        frameView.style = .layout3
        resetSelection(sender)
    }
    // change image of UIButton
    @IBAction func changeImage(_ sender: UIButton) {
        bntImage = sender
        openImagePicker()
    }
    
    // deselect every button except sender
    private func resetSelection(_ sender : UIButton){
        btnLayout1.isSelected = false
        btnLayout2.isSelected = false
        btnLayout3.isSelected = false
        
        sender.isSelected = true
    }
    private func animView() {
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        var translationTransform: CGAffineTransform
        if isLandscape {
            translationTransform = CGAffineTransform(translationX: -screenWidth, y: 0)
        } else {
            translationTransform = CGAffineTransform(translationX: 0, y: -screenHeight)
        }
        UIView.animate(withDuration: 0.4) { self.frameView.transform = translationTransform }
    }
    
    private func shareImage(){
        let renderer = UIGraphicsImageRenderer(size: frameView.bounds.size)
        let screenshot = renderer.image { _ in
            frameView.drawHierarchy(in: frameView.bounds, afterScreenUpdates: true)
        }
        let activityController = UIActivityViewController(activityItems: [screenshot], applicationActivities: nil)
        present(activityController, animated: true)
        activityController.completionWithItemsHandler = { (_, _, _, _) in
            UIView.animate(withDuration: 0.2) { self.frameView.transform = .identity }
        }
    }
    // Openning share view on swipe
    @objc func swipeFunc(gesture: UISwipeGestureRecognizer){
        animView()
        shareImage()
        
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

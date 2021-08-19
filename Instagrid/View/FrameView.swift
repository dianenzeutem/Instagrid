//
//  FrameView.swift
//  Instagrid
//
//  Created by Dee Dee on 19/08/2021.
//

import UIKit

class FrameView: UIView {

    // Outlet for the buttons
        @IBOutlet private var button1 : UIButton!
        @IBOutlet private var button2 : UIButton!
        @IBOutlet private var button3 : UIButton!
        @IBOutlet private var button4 : UIButton!
        // Enumeration of the different styles
        enum Style {
            case layout1, layout2, layout3
            
        }
    enum ButtonStyle {
        case landscapeLayout, portraitLayout
    }
    
    var buttonStyle : ButtonStyle = .portraitLayout{
        didSet {
            setButtonStyle(buttonStyle)
        }
    }
        
        var style : Style = .layout2 {
            didSet {
                setStyle(style)
            }
        }
    private func setButtonStyle(_ buttonStyle : ButtonStyle){
        switch buttonStyle {
        case .landscapeLayout:
                button1.setImage(#imageLiteral(resourceName: "Sans titre (3)"), for: .normal)
            button2.setImage(#imageLiteral(resourceName: "Sans titre (3)"), for: .normal)
            button3.setImage(#imageLiteral(resourceName: "Sans titre (3)"), for: .normal)
            button4.setImage(#imageLiteral(resourceName: "Sans titre (3)"), for: .normal)
        case .portraitLayout:
            button1.setImage(#imageLiteral(resourceName: "Plus"), for: .normal)
            button2.setImage(#imageLiteral(resourceName: "Plus"), for: .normal)
            button3.setImage(#imageLiteral(resourceName: "Plus"), for: .normal)
            button4.setImage(#imageLiteral(resourceName: "Plus"), for: .normal)
    }
    }
        // Changing frameView layout
        private func setStyle (_ style : Style){
            switch style {
            case .layout1:
                button2.isHidden = true
                button4.isHidden = false
            case .layout2:
                button4.isHidden = true
                button2.isHidden = false
            case .layout3 :
                button4.isHidden = false
                button2.isHidden = false
            }
        }
}

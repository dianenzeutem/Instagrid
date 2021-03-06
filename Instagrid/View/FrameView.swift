//
//  FrameView.swift
//  Instagrid
//
//  Created by Dee Dee on 19/08/2021.
//

import UIKit

final class FrameView: UIView {
    
    // Enumeration of the different styles
    enum Style {
        case layout1, layout2, layout3
    }
    
    // Outlet for the buttons
    @IBOutlet private var button2 : UIButton!
    @IBOutlet private var button4 : UIButton!
    
    var style : Style = .layout2 {
        didSet {
            setStyle(style)
        }
    }
    
    // Changing frameView layout
    private func setStyle (_ style : Style) {
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

//
//  ViImageView.swift
//  ViSearchWidgets
//
//  Created by Hung on 10/11/16.
//  Copyright © 2016 Visenze. All rights reserved.
//

import UIKit

/// image view with a custom action button at the top right corner
open class ViImageView: UIView {

    public var imageView: UIImageView?
    public var actionBtn: UIButton?
    public var actionBtnSize: CGSize = .zero
    
    /// position the action button with respect to the top right corner
    public var actionMargin: UIEdgeInsets = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 4)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        imageView = UIImageView(frame: self.bounds)
        imageView?.contentMode = .scaleAspectFill // default
        imageView?.clipsToBounds = true
        imageView?.autoresizingMask = [.flexibleWidth , .flexibleHeight ]
        self.addSubview(imageView!)
        
        // add action btn if necessary
        actionBtn = UIButton(type: .custom)
        self.addSubview(actionBtn!)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame = self.bounds
        
        if let btn = actionBtn {
            btn.frame = btn.isHidden ? .zero :
                CGRect(x: self.bounds.size.width - actionMargin.right - actionBtnSize.width, y: actionMargin.top, width: actionBtnSize.width, height: actionBtnSize.height)
            
            bringSubview(toFront: btn)
        }
    }
    

}

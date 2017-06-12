//
//  CustomBottomView.swift
//  GraphView
//
//  Created by Roman Chopovenko on 6/9/17.
//
//

import UIKit

class CustomBottomView: UIView {
    
    public var upperTextLabel = UILabel()
    public var bottomTextLabel = UILabel()
    fileprivate var dataPointSpacing: CGFloat = 80
    
    
    public var containerHeight: CGFloat = 50
    let paddingHeight: CGFloat = 6
    
    lazy var labelHeight: CGFloat = { [unowned self] in
        return (self.containerHeight - self.paddingHeight) / 2
    }()
    
    lazy var containerWidth: CGFloat = { [unowned self] in
        return self.dataPointSpacing - 10
    }()
    
    
    convenience init(dataPointSpacing: CGFloat) {
        
        self.init(frame: .zero)
        self.dataPointSpacing = dataPointSpacing
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let size = CGSize(width: self.containerWidth, height: self.containerHeight)
        let newFrame = CGRect(origin: .zero, size: size)
        
        self.frame = newFrame
        
        self.upperTextLabel = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: containerWidth,
                                                                           height: labelHeight)))
        self.upperTextLabel.layer.backgroundColor = UIColor.white.cgColor
        self.upperTextLabel.layer.borderColor = UIColor(colorLiteralRed: 255/255, green: 200/255, blue: 53/255, alpha: 1).cgColor
        self.upperTextLabel.layer.borderWidth = 2
        self.upperTextLabel.layer.cornerRadius = labelHeight/2
        self.upperTextLabel.textAlignment = .center
        
        self.addSubview(self.upperTextLabel)
        
        self.bottomTextLabel = UILabel(frame: CGRect(x: 0,
                                               y: self.labelHeight + self.paddingHeight,
                                               width: self.containerWidth,
                                               height: self.labelHeight))
        self.bottomTextLabel.textAlignment = .center
        self.addSubview(self.bottomTextLabel)
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}

//
//  SurahNameCell.swift
//  Nour
//
//  Created by Alisher Manatbek on 15.06.2023.
//

import UIKit
import SnapKit

class SurahNameCell: UITableViewCell {
    
    private let fontSize = 22.0
    private let fontName = "ProximaVara-Roman_Bold"
    
    lazy var surahNameLabel: UILabel = {
        var label = UILabel()
        
        
        label.font = UIFont(name: fontName, size: fontSize)
        
        return label
    }()
    
    lazy var surahNumberLabel: UILabel = {
        var label = UILabel()
        
        label.font = UIFont(name: fontName, size: fontSize)
        
        label.rotate(angle: 315.0)
        
        return label
    }()
    
    lazy var ayahCountLabel: UILabel = {
        var label = UILabel()
        
        let newFontSize = 15.0
        label.font = UIFont(name: fontName, size: newFontSize)
        
        return label
    }()
    
    private lazy var rombView: UIView = {
        var view = UIView()
        
        view.rotate(angle: 45.0)
        
        let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                let red: CGFloat = 0x34 / 255.0
                let green: CGFloat = 0x3A / 255.0
                let blue: CGFloat = 0x3F / 255.0

                return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            } else {
                let red: CGFloat = 0xF4 / 255.0
                let green: CGFloat = 0xF5 / 255.0
                let blue: CGFloat = 0xF6 / 255.0

                return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            }
        }
        
        view.layer.cornerRadius = 5.0
        
        view.backgroundColor = dynamicColor
        
        return view
    }()
    
    private lazy var centerView: UIView = {
        var view = UIView()
        
        
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        addSubview(rombView)
        
        rombView.addSubview(surahNumberLabel)
        
        configureCell()
    }
    
    func configureCell() {
        rombView.snp.makeConstraints {
            $0.left.equalTo(40.0)
            $0.width.height.equalTo(50.0)
            $0.centerY.equalToSuperview()
        }
        
        surahNumberLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - rotate (UIView)

extension UIView {

    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = CGAffineTransformRotate(self.transform, radians);
        self.transform = rotation
    }

}

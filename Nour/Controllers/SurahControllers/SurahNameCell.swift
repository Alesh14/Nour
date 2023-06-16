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
    
    lazy var translationLabel: UILabel = {
        var label = UILabel()
        
        let newFontSize = 15.0
        label.font = UIFont(name: fontName, size: newFontSize)
        
        return label
    }()
    
    private lazy var rombView: UIView = {
        var view = UIView()
        
        view.rotate(angle: 45.0)
        
        let dynamicColor = UIColor(named: "Dynamic-Color")
        
        view.layer.cornerRadius = 5.0
        
        view.backgroundColor = dynamicColor
        
        return view
    }()
    
    private lazy var centerView: UIView = {
        var view = UIView()
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.layer.borderWidth = 1.0
        
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.gray.cgColor
    
        contentView.layer.cornerRadius = 5.0
        
        let paddingView = UIView(frame: CGRect(x: 10, y: 10, width: contentView.frame.width - 20,
                                                             height: contentView.frame.height - 20))
        
        paddingView.backgroundColor = .clear
        contentView.addSubview(paddingView)
        
        selectionStyle = .none
        
        addSubview(rombView)
        rombView.addSubview(surahNumberLabel)
        
        addSubview(centerView)
        centerView.addSubview(surahNameLabel)
        centerView.addSubview(translationLabel)
        
        configureCell()
    }
    
    func configureCell() {
        rombView.snp.makeConstraints {
            $0.left.equalTo(30.0)
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

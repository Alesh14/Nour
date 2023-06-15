//
//  SurahNameCell.swift
//  Nour
//
//  Created by Alisher Manatbek on 15.06.2023.
//

import UIKit
import SnapKit

class SurahNameCell: UITableViewCell {
    
    let fontSize = 22.0
    
    lazy var surahNameLabel: UILabel = {
        var label = UILabel()
        
        label.font = label.font.withSize(fontSize)
        
        return label
    }()
    
    lazy var surahNumberLabel: UILabel = {
        var label = UILabel()
        
        label.font = label.font.withSize(fontSize)
        
        return label
    }()
    
    lazy var ayahCountLabel: UILabel = {
        var label = UILabel()
        
        label.font = label.font.withSize(fontSize)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        addSubview(ayahCountLabel)
        addSubview(surahNameLabel)
        addSubview(surahNumberLabel)
        
        configureCell()
    }
    
    func configureCell() {
        surahNumberLabel.snp.makeConstraints {
            $0.left.equalTo(20.0)
            $0.centerY.equalToSuperview()
        }
        
        surahNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(70.0)
        }
        
        ayahCountLabel.snp.makeConstraints {
            $0.right.equalTo(-20.0)
            $0.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

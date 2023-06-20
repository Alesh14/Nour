//
//  DhikrCell.swift
//  Nour
//
//  Created by Alisher Manatbek on 20.06.2023.
//

import UIKit

class DhikrCell: UITableViewCell {
    
    private let arabicFont = UIFont(name: "KFGQPCUthmanTahaNaskh", size: 30.0)
    
    lazy var dhikrLabel: UILabel = {
        let label = UILabel()
        
        label.font = arabicFont
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        addSubview(dhikrLabel)
        configureLabel()
    }
    
    func configureLabel() {
        dhikrLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10.0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


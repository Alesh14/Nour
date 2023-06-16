//
//  AyahCell.swift
//  Nour
//
//  Created by Alisher Manatbek on 17.06.2023.
//

import UIKit

class AyahCell: UITableViewCell {

    let ayahLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.font = UIFont(name: "KFGQPCUthmanTahaNaskh", size: 40.0)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(ayahLabel)
        
        ayahLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

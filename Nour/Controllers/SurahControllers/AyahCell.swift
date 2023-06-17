//
//  AyahCell.swift
//  Nour
//
//  Created by Alisher Manatbek on 17.06.2023.
//

import UIKit

class AyahCell: UITableViewCell {
    
    private let colorName = "Dynamic-Color"
    
    lazy var numLabel: UILabel = {
        let label = UILabel()
    
        label.textColor = UIColor.label
        label.font = UIFont(name: "ProximaVara-Roman_Bold", size: 17.0)
        
        return label
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton()
        
        button.tintColor = UIColor.label
        button.setImage(UIImage(systemName: "play"), for: .normal)
        button.addTarget(self, action: #selector(playMusic), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [numLabel, playButton])
        
        view.axis = .horizontal
        view.spacing = 5.0
        
        return view
    }()

    let ayahLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.font = UIFont(name: "KFGQPCUthmanTahaNaskh", size: 40.0)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(stackView)

        stackView.addArrangedSubview(playButton)

        stackView.snp.makeConstraints {
            $0.left.equalTo(20.0)
            $0.top.equalTo(10.0)
        }
        
        contentView.addSubview(ayahLabel)
        
        selectionStyle = .none
        ayahLabel.textAlignment = .center
        
        ayahLabel.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom)
            $0.left.right.bottom.equalToSuperview().inset(10.0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func playMusic() {
        print("playing music")
    }
    
}

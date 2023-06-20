//
//  AyahCell.swift
//  Nour
//
//  Created by Alisher Manatbek on 17.06.2023.
//

import UIKit
import AVFoundation

protocol AyahDelegate {
    func playButtonPressed()
}

class AyahCell: UITableViewCell, AVAudioPlayerDelegate  {
    
    var delegate: SurahPageScreen?
    
    private var audioUrl: String?
    private let colorName = "Dynamic-Color"
    private let playImage = UIImage(systemName: "play")
    private let pauseImage = UIImage(systemName: "pause")
    
    lazy var numLabel: UILabel = {
        let label = UILabel()
    
        label.textColor = UIColor.label
        label.font = UIFont(name: "ProximaVara-Roman_Bold", size: 17.0)
        
        return label
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton()
        
        button.tintColor = UIColor.label
        button.setImage(playImage, for: .normal)
        button.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [numLabel])
        
        view.axis = .horizontal
        view.spacing = 10.0
        
        return view
    }()

    let ayahLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0

        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.left.equalTo(20.0)
            $0.top.equalTo(10.0)
        }
        
        contentView.addSubview(ayahLabel)
        
        selectionStyle = .none
        ayahLabel.textAlignment = .center
        
        ayahLabel.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(3.0)
            $0.left.right.bottom.equalToSuperview().inset(10.0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(audioUrl: String, delegate: SurahPageScreen) {
        self.delegate = delegate
        self.audioUrl = audioUrl
    }

    @objc func playButtonPressed() {
        
    }

}

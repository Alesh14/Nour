//
//  SurahPageScreen.swift
//  Nour
//
//  Created by Alisher Manatbek on 16.06.2023.
//

import UIKit

class SurahPageScreen: UIViewController {
    
    private let surah: Surah
    private let translatedSurah: QuranDataTranslate.Surah

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = surah.englishName
        label.textAlignment = .center
        label.font = UIFont(name: "ProximaVara-Roman_Bold", size: 20.0)
        
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.dataSource = self
        tableView.register(AyahCell.self, forCellReuseIdentifier: K.ayahIdentifier)
        
        return tableView
    }()
    
    private lazy var closeButton: ResizableImageButton = {
        let button = ResizableImageButton()
        
        button.tintColor = UIColor.label
        
        let closeButtonImage = UIImage(systemName: "xmark.circle")?.withRenderingMode(.alwaysTemplate)
        button.setImage(closeButtonImage, for: .normal)
        
        button.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    init(surah: Surah, translatedSurah: QuranDataTranslate.Surah) {
        self.surah = surah
        self.translatedSurah = translatedSurah
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = titleLabel
        
        view.addSubview(titleView)
        configureTitleView()
        
        view.addSubview(tableView)
        configureTableView()
        
        view.backgroundColor = .systemBackground
    }
    
    func configureTitleView() {
        titleView.snp.makeConstraints {
            $0.height.equalTo(50.0)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.right.equalToSuperview()
        }
        
        titleView.addSubview(closeButton)
        
        closeButton.snp.makeConstraints {
            $0.width.height.equalTo(30.0)
            $0.centerY.equalToSuperview()
            $0.right.equalTo(-20.0)
        }
    }
    
    @objc func closeButtonPressed() {
        dismiss(animated: true)
    }
    
    func configureTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}

// MARK: - UITableViewDataSource

extension SurahPageScreen: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        surah.ayahs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.ayahIdentifier) as! AyahCell
        
        let i = indexPath.row
        cell.audioUrl = surah.ayahs[i].audio
        cell.numLabel.text = "\(surah.number):\(i + 1)"
        cell.ayahLabel.text = "\(surah.ayahs[i].text)"
        
        return cell
    }

}

// MARK: - ResizableImageButton

class ResizableImageButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView?.contentMode = .scaleAspectFit
        imageView?.frame = bounds
    }
}

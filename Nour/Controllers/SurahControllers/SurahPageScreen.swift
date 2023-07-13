//
//  SurahPageScreen.swift
//  Nour
//
//  Created by Alisher Manatbek on 16.06.2023.
//

import UIKit
import AVFoundation

class SurahPageScreen: UIViewController {
    
    private let surah: Surah
    private let translatedSurah: QuranDataTranslate.Surah
    
    private let items = ["Reading", "Translation"]
    
    private var isTranslated = false
    
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
        
        if let closeButtonImage = UIImage(systemName: "xmark.circle") {
            closeButtonImage.withRenderingMode(.alwaysTemplate)
            button.setImage(closeButtonImage, for: .normal)
        }
        
        button.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: items)
        
        segmentedControl.addTarget(self, action: #selector(segmentAction), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = UIColor(named: "Dynamic-Color")
        
        return segmentedControl
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
    
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
       switch (segmentedControl.selectedSegmentIndex) {
       case 0:
           isTranslated = false
           tableView.reloadData()
           break
       case 1:
           isTranslated = true
           tableView.reloadData()
           break
       default:
           break
       }
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
            $0.right.equalTo(-15.0)
        }
        
        titleView.addSubview(segmentedControl)
        
        segmentedControl.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10.0)
            $0.right.equalTo(closeButton.snp.left).offset(-10.0)
            $0.height.equalToSuperview()
        }
    }
    
    @objc func closeButtonPressed() {
        dismiss(animated: true)
    }
    
    func configureTableView() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
}

// MARK: - UITableViewDataSource

extension SurahPageScreen: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        surah.ayahs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.ayahIdentifier) as? AyahCell
        
        guard let cell = cell else { return UITableViewCell() }
        
        let i = indexPath.row
        cell.numLabel.text = "\(surah.number):\(i + 1)"
        
        if isTranslated {
            cell.ayahLabel.font = UIFont(name: "Verdana", size: 23.0)
            cell.ayahLabel.text = "\(translatedSurah.ayahs[i].text)"
        } else {
            cell.ayahLabel.font = UIFont(name: "KFGQPCUthmanTahaNaskh", size: 40.0)
            cell.ayahLabel.text = "\(surah.ayahs[i].text)"
        }
        
        return cell
    }

}

// MARK: - ResizableImageButton

class ResizableImageButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let imageView = imageView else { return }
        imageView.contentMode = .scaleAspectFit
        imageView.frame = bounds
    }
    
}

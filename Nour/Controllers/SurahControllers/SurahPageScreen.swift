//
//  SurahPageScreen.swift
//  Nour
//
//  Created by Alisher Manatbek on 16.06.2023.
//

import UIKit

class SurahPageScreen: UIViewController {
    
    private let surah: Surah
    private let translatedSurah: Surah

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AyahCell.self, forCellReuseIdentifier: K.ayahIdentifier)
            
        return tableView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        
        button.tintColor = UIColor.label
        
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(named: "Dynamic-Color")
        
        return view
    }()
    
    init(surah: Surah, translatedSurah: Surah) {
        self.surah = surah
        self.translatedSurah = translatedSurah
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        configureTableView()
        
        view.backgroundColor = .systemBackground
    }
    
    @objc func closeButtonPressed() {
        dismiss(animated: true)
    }
    
    func configureTitleView() {
        titleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(50.0)
        }
    }
    
    func configureTableView() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}

// MARK: - UITablewViewDelegate

extension SurahPageScreen: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
        cell.ayahLabel.text = surah.ayahs[i].text
        
        return cell
    }

}

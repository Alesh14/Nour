//
//  SurahScreen.swift
//  Nour
//
//  Created by Alisher Manatbek on 12.06.2023.
//

import UIKit
import SnapKit

class SurahScreen: UIViewController {
    
    let network = NetworkManager()
    
    var surahs = [Surah]()
    var translatedSurahs = [QuranDataTranslate.Surah]()
    
    let cellSpacingHeight: CGFloat = 10.0

    private lazy var tableView: UITableView = {
        var tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 120.0
        tableView.separatorStyle = .none
            
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        fetchData()
    }
    
    func configureTableView() {
        tableView.register(SurahNameCell.self, forCellReuseIdentifier: K.surahIdentifier)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func fetchData() {
        network.getQuranArabic { data in
            guard let data = data else { return }
            
            data.data.surahs.forEach {
                self.surahs.append($0)
            }
            
            DispatchQueue.main.async {
                self.view.addSubview(self.tableView)
                self.configureTableView()
            }
        }
        
        network.getQuranEnglish { data in
            guard let data = data else { return }
            
            data.data.surahs.forEach {
                self.translatedSurahs.append($0)
            }
        }
    }
    
}

// MARK: - UITableViewDelegate

extension SurahScreen: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let i = indexPath.row
        let surahPageScreen = SurahPageScreen(surah: surahs[i], translatedSurah: translatedSurahs[i])
        let nav = UINavigationController(rootViewController: surahPageScreen)
        nav.modalPresentationStyle = .overFullScreen
        
        present(nav, animated: true)
    }
    
}

// MARK: - UITableViewDataSource

extension SurahScreen: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        surahs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.surahIdentifier) as? SurahNameCell
        
        guard let cell = cell else { return UITableViewCell() }
        
        let i = indexPath.row
        cell.surahNameLabel.text = surahs[i].englishName
        cell.ayahCountLabel.text = "\(surahs[i].ayahs.count) ayahs"
        cell.translationLabel.text = surahs[i].englishNameTranslation
        cell.surahNumberLabel.text = "\(i + 1)"
        let text = surahs[i].name.components(separatedBy: " ").last
        
        cell.arabicSurahNameLabel.text = text
        
        return cell
    }

}

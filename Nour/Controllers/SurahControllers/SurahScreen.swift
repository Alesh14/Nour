//
//  SurahScreen.swift
//  Nour
//
//  Created by Alisher Manatbek on 12.06.2023.
//

import UIKit
import SnapKit

class SurahScreen: UIViewController {
    
    var quranData: QuranData?
    var surahs = [Surah]()
    
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
        
        guard let quranData = quranData else { return }
        
        quranData.data.surahs.forEach {
            surahs.append($0)
        }
        
        view.addSubview(tableView)
        
        configureTableView()
    }
    
    func configureTableView() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tableView.register(SurahNameCell.self, forCellReuseIdentifier: K.surahIdentifier)
    }
    
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "QuranData", withExtension: "json") else { return }
        
        guard let data = try? Data(contentsOf: url) else { return }
        
        do {
            let decoder = JSONDecoder()
            quranData = try decoder.decode(QuranData.self, from: data)
        } catch {
            fatalError("Data is invalid")
        }
    }
    
}

// MARK: - UITableViewDelegate

extension SurahScreen: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

// MARK: - UITableViewDataSource

extension SurahScreen: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        surahs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.surahIdentifier) as! SurahNameCell
        
        let i = indexPath.row
        cell.surahNumberLabel.text = "\(i + 1)"
        cell.surahNameLabel.text = surahs[i].englishName
        cell.ayahCountLabel.text = "\(surahs[i].ayahs.count) ayahs"
        cell.translationLabel.text = surahs[i].englishNameTranslation
        
        return cell
    }

}

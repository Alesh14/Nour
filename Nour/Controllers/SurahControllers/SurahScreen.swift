//
//  SurahScreen.swift
//  Nour
//
//  Created by Alisher Manatbek on 12.06.2023.
//

import UIKit
import SnapKit
import SkeletonView

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
        tableView.isSkeletonable = true
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        view.addSubview(tableView)
        configureTableView()
        
        tableView.showSkeleton()
        
        fetchData { 
            DispatchQueue.main.async { [weak self] in
                guard let safeSelf = self else { return }
                safeSelf.tableView.hideSkeleton()
            }
        }
    }
    
    func configureTableView() {
        tableView.register(SurahNameCell.self, forCellReuseIdentifier: K.surahIdentifier)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func fetchData(completion: @escaping () -> Void) {
        network.getQuranArabic { data in
            guard let data = data else { return }
            
            data.data.surahs.forEach { [weak self] surah in
                guard let safeSelf = self else { return }
                safeSelf.surahs.append(surah)
            }
            
            completion()
        }
        
        network.getQuranEnglish { data in
            guard let data = data else { return }
            
            data.data.surahs.forEach { [weak self] surah in
                guard let safeSelf = self else { return }
                safeSelf.translatedSurahs.append(surah)
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

extension SurahScreen: SkeletonTableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        surahs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.surahIdentifier) as? SurahNameCell
        
        guard let cell = cell else { return UITableViewCell() }
        
        let i = indexPath.row
        
        cell.rombView.hideSkeleton()
        cell.surahNameLabel.text = surahs[i].englishName
        cell.ayahCountLabel.text = "\(surahs[i].ayahs.count) ayahs"
        
        cell.translationLabel.text = surahs[i].englishNameTranslation
        cell.surahNumberLabel.text = "\(i + 1)"
        
        let text = surahs[i].name.components(separatedBy: " ").last
    
        cell.arabicSurahNameLabel.text = text
        
        return cell
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, skeletonCellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.surahIdentifier) as? SurahNameCell
        
        guard let cell = cell else { return UITableViewCell() }
        
        cell.rombView.showAnimatedGradientSkeleton()
        
        return cell
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return K.surahIdentifier
    }
    
}

//
//  DhikrScreen.swift
//  Nour
//
//  Created by Alisher Manatbek on 12.06.2023.
//

import UIKit

class DhikrScreen: UIViewController {

    private let dataBase = UserDefaults.standard
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.register(DhikrCell.self, forCellReuseIdentifier: K.dhikrIdentifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        
        configureTableView()
    }
    
    func configureTableView() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}

// MARK: - UITableViewDelegate

extension DhikrScreen: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let i = indexPath.row
        
        lazy var counterScreen: CounterScreen = {
            let dhikr = K.dhikrArray[i]

            let count = dataBase.object(forKey: String(dhikr.id)) as? Int
                        
            let text = dhikr.dhikr
            let counterScreen = CounterScreen(delegate: self, count: count ?? 0, dhikrSound: dhikr.dhikrSound, id: dhikr.id)
            
            counterScreen.dhikrLabel.text = text
            
            return counterScreen
        }()
        
        navigationController?.pushViewController(counterScreen, animated: true)
    }
    
}

// MARK: - UITableViewDataSource

extension DhikrScreen: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        K.dhikrArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.dhikrIdentifier) as? DhikrCell
        
        guard let cell = cell else { return UITableViewCell() }
        
        let i = indexPath.row
        let dhikr = K.dhikrArray[i]
        
        let key = String(dhikr.id)
        if (dataBase.object(forKey: key) == nil) {
            dataBase.set(0, forKey: key)
        }
        
        let text = dhikr.dhikr
        
        cell.dhikrLabel.text = text
        
        return cell
    }
    
}

// MARK: - CounterDelegate

extension DhikrScreen: CounterDelegate {
    
    func updateDataBase(count: Int, key: String) {
        dataBase.set(count, forKey: key)
    }
    
}

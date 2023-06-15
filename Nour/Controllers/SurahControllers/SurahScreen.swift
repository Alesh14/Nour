//
//  SurahScreen.swift
//  Nour
//
//  Created by Alisher Manatbek on 12.06.2023.
//

import UIKit

class SurahScreen: UIViewController {
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}

// MARK: - UITableViewDelegate

extension SurahScreen: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let i = indexPath.row
        
    }
    
}

// MARK: - UITableViewDataSource

extension SurahScreen: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

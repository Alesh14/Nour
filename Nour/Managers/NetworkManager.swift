//
//  NetworkManager.swift
//  Nour
//
//  Created by Alisher Manatbek on 16.06.2023.
//

import Foundation

class NetworkManager {
    
    func getQuranArabic(completion: @escaping (QuranData?) -> Void) {
        guard let url = URL(string: K.restAPIQuranArabic) else { return }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            do {
                guard let data = data else { return }
                let decoder = JSONDecoder()
                let quranData = try decoder.decode(QuranData.self, from: data)
                completion(quranData)
            } catch {
                fatalError("Data is invalid")
            }
        }.resume()
    }
    
    func getQuranEnglish(completion: @escaping (QuranDataTranslate?) -> Void) {
        guard let url = URL(string: K.restAPIQuranEnglish) else { return }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            do {
                guard let data = data else { return }
                let decoder = JSONDecoder()
                let quranData = try decoder.decode(QuranDataTranslate.self, from: data)
                completion(quranData)
            } catch {
                fatalError("Data is invalid")
            }
        }.resume()
    }
    
}

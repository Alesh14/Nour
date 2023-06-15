//
//  QuranData.swift
//  Nour
//
//  Created by Alisher Manatbek on 15.06.2023.
//

import Foundation

struct QuranData: Codable {
 
    let surahs: [Surah]

    struct Surah: Codable {
        let number: Int
        let name: String
        let englishName: String
        let ayahs: [Ayah]
        
        struct Ayah: Codable {
            let numberInSurah: Int
            let text: String
            let page: Int
            let sajda: Bool
        }
    }
    
}

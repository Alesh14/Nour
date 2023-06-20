//
//  QuranData.swift
//  Nour
//
//  Created by Alisher Manatbek on 15.06.2023.
//

import Foundation

// MARK: - QuranData
struct QuranData: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let surahs: [Surah]
}

// MARK: - Surah
struct Surah: Codable {
    let number: Int
    let name, englishName, englishNameTranslation: String
    let ayahs: [Ayah]
}

// MARK: - Ayah
struct Ayah: Codable {
    let number: Int
    let text: String
}

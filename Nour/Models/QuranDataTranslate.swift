//
//  QuranDataTranslate.swift
//  Nour
//
//  Created by Alisher Manatbek on 16.06.2023.
//

import Foundation

struct QuranDataTranslate: Codable {
    let data: DataClass
    struct DataClass: Codable {
        let surahs: [Surah]
    }

    struct Surah: Codable {
        let ayahs: [Ayah]
    }

    struct Ayah: Codable {
        let text: String
    }
}

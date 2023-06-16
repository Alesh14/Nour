//
//  QuranData.swift
//  Nour
//
//  Created by Alisher Manatbek on 15.06.2023.
//

import Foundation

// MARK: - QuranData
struct QuranData: Codable {
    let code: Int
    let status: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let surahs: [Surah]
    let edition: Edition
}

// MARK: - Edition
struct Edition: Codable {
    let identifier, language, name, englishName: String
    let format, type: String
}

// MARK: - Surah
struct Surah: Codable {
    let number: Int
    let name, englishName, englishNameTranslation: String
    let revelationType: RevelationType
    let ayahs: [Ayah]
}

// MARK: - Ayah
struct Ayah: Codable {
    let number: Int
    let text: String
    let numberInSurah, juz, manzil, page: Int
    let ruku, hizbQuarter: Int
    let sajda: SajdaUnion
}

enum SajdaUnion: Codable {
    case bool(Bool)
    case sajdaClass(SajdaClass)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Bool.self) {
            self = .bool(x)
            return
        }
        if let x = try? container.decode(SajdaClass.self) {
            self = .sajdaClass(x)
            return
        }
        throw DecodingError.typeMismatch(SajdaUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for SajdaUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let x):
            try container.encode(x)
        case .sajdaClass(let x):
            try container.encode(x)
        }
    }
}

// MARK: - SajdaClass
struct SajdaClass: Codable {
    let id: Int
    let recommended, obligatory: Bool
}

enum RevelationType: String, Codable {
    case meccan = "Meccan"
    case medinan = "Medinan"
}


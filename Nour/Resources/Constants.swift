//
//  Constants.swift
//  Nour
//
//  Created by Alisher Manatbek on 15.06.2023.
//

import Foundation

struct K {
    static let surahIdentifier = "surah"
    static let restAPIQuranArabic = "https://api.alquran.cloud/v1/quran/ar.alafasy"
    static let restAPIQuranEnglish = "https://api.alquran.cloud/v1/quran/en.asad"
    static let ayahIdentifier = "ayah"
    static let dhikrIdentifier = "dhikr"
    static let dhikrArray = [
        Dhikr(id: 0, dhikr: "سُبْحَانَ ٱللَّٰهِ", dhikrSound: "SubhanAllah"),
        Dhikr(id: 1, dhikr: "الْحَمْدُ للّهِ", dhikrSound: "Alhamdulillah"),
        Dhikr(id: 2, dhikr: "اللّٰهُ أَكْبَر‎", dhikrSound: "AllahuAkbar"),
        Dhikr(id: 3, dhikr: "لَا إِلَٰهَ إِلَّا ٱللَّٰهُ مُحَمَّدٌ رَسُولُ ٱللَّٰهِ‎", dhikrSound: "lailahaillahm"),
        Dhikr(id: 4, dhikr: "لَا إِلَٰهَ إِلَّا ٱللَّٰهُ‎", dhikrSound: "Lailahaillah"),
        Dhikr(id: 5, dhikr: "لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ", dhikrSound: "Lahaula"),
        Dhikr(id: 6, dhikr: "أَسْتَغْفِرُ اللّٰهَ", dhikrSound: "Astahfirullah"),
        Dhikr(id: 7, dhikr: "أَسْتَغْفِرُ اللَّهَ الْعَظِيمَ", dhikrSound: "AstagfirullahalAziim"),
        Dhikr(id: 8, dhikr: "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ", dhikrSound: "Uabihamdih"),
        Dhikr(id: 9, dhikr: "حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ", dhikrSound: "Hasbunallah"),
        Dhikr(id: 10, dhikr: "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ", dhikrSound: "Salauat"),
        Dhikr(id: 11, dhikr: "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ، كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ، إِنَّكَ حَمِيدٌ مَجِيدٌ", dhikrSound: "KamaaSollaita"),
        Dhikr(id: 12, dhikr: "اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ كَمَا بَارَكْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ إِنَّكَ حَمِيدٌ مَجِيدٌ", dhikrSound: "KamaaBaarakta")
    ]
}

struct Dhikr {
    let id: Int
    let dhikr: String
    let dhikrSound: String
}

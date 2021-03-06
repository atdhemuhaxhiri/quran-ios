//
//  UserDefaults+Keys.swift
//  Quran
//
//  Created by Mohamed Afifi on 5/2/17.
//
//  Quran for iOS is a Quran reading application for iOS.
//  Copyright (C) 2017  Quran.com
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
extension PersistenceKeyBase {
    static let lastSelectedQariId = PersistenceKey<Int>(key: "LastSelectedQariId", defaultValue: 9)
    static let lastViewedPage = PersistenceKey<Int?>(key: "LastViewedPage", defaultValue: nil)
    static let showQuranTranslationView = PersistenceKey<Bool>(key: "showQuranTranslationView", defaultValue: false)
    static let selectedTranslations = PersistenceKey<[Int]>(key: "selectedTranslations", defaultValue: [])
    static let wordTranslationType = PersistenceKey<Int>(key: "wordTranslationType", defaultValue: AyahWord.TextType.translation.rawValue)
}

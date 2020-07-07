//
//  Settings.swift
//
//  Created on 19/02/2020.
//  Copyright © 2020 WildAid. All rights reserved.
//

import Foundation

class Settings: ObservableObject {

    static let shared = Settings()

    var menuData = MenuData()
    var intialZoomLevel = 1000 // Meters to show in map views
}

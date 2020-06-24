//
//  Pet.swift
//  VirtualPet
//
//  Created by Mike Liu on 6/24/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import Foundation
import UIKit

class Pet {
    var type: String
    var name: String
    var currentFoodLevel: Int
    var currentHappiness: Int
    var totalFeedTimes: Int
    var totalPlayTimes: Int
    var image: UIImage?
    var color: UIColor?
    
    public init(type: String, name: String) {
        self.type = type
        self.name = name
        self.currentFoodLevel = 0
        self.currentHappiness = 0
        self.totalFeedTimes = 0
        self.totalPlayTimes = 0
        self.color = getColor(type)
        self.image = getImage(type)
    }
    
    private func getColor(_ type: String) -> UIColor? {
        switch type {
            case "cat":
                return UIColor(red: 51.0/255, green: 153.0/255, blue: 204.0/255, alpha: 1.0)
            case "dog":
                return UIColor(red: 1.0, green: 0.0, blue: 51.0/255, alpha: 1.0)
            case "bird":
                return UIColor(red: 1.0, green: 204.0/255, blue: 0.0, alpha: 1.0)
            case "bunny":
                return UIColor(red: 51.0/255, green: 204.0/255, blue: 102.0/255, alpha: 1.0)
            case "fish":
                return UIColor(red: 204.0/255, green: 102.0/255, blue: 1.0, alpha: 1.0)
                
            default:
                return UIColor.clear
        }
    }
    
    private func getImage(_ type: String) -> UIImage? {
        return UIImage(named: type)
    }
    
    public func feed() {
        if(currentFoodLevel < 10) {
            currentFoodLevel = currentFoodLevel + 1
            totalFeedTimes = totalFeedTimes + 1
        }
    }
    public func play() {
        if(currentFoodLevel > 0) {
            currentHappiness = currentHappiness + 1
            totalPlayTimes = totalPlayTimes + 1
            currentFoodLevel = currentFoodLevel - 1
        }
    }
}

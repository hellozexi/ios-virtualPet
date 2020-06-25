//
//  ViewController.swift
//  VirtualPet
//
//  Created by Mike Liu on 6/19/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var cat = Pet(type: "cat");
    var dog = Pet(type: "dog");
    var fish = Pet(type: "fish");
    var bird = Pet(type: "bird");
    var bunny = Pet(type: "bunny");
    

    @IBOutlet weak var foodLevelBar: DisplayView!
    @IBOutlet weak var happinessBar: DisplayView!
    
    @IBOutlet weak var playedTimesLabel: UILabel!
    
    @IBOutlet weak var fedTimesLabel: UILabel!
    
    @IBAction func playTouched(_ sender: UIButton) {
        currentPet.play()
        updateData()
        
    }
    @IBAction func feedTouched(_ sender: UIButton) {
        currentPet.feed()
        updateData()
    }
    @IBAction func dogSwitch(_ sender: UIButton) {
        currentPet = dog
        updateData()
        updateImg()
        updateBackground()
    }
    @IBAction func catSwitch(_ sender: UIButton) {
        currentPet = cat
        updateData()
        updateImg()
        updateBackground()
    }
    @IBAction func birdSwitch(_ sender: UIButton) {
        currentPet = bird
        updateData()
        updateImg()
        updateBackground()
    }
    @IBAction func reset(_ sender: UIButton) {
        currentPet.currentFoodLevel = 0
        currentPet.currentHappiness = 0
        currentPet.totalFeedTimes = 0
        currentPet.totalPlayTimes = 0
        updateData()
        
    }
    @IBAction func fishSwitch(_ sender: UIButton) {
        currentPet = fish
        updateData()
        updateImg()
        updateBackground()
    }
    @IBAction func bunnySwitch(_ sender: UIButton) {
        currentPet = bunny
        updateData()
        updateImg()
        updateBackground()
    }
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petBackground: UIView!
    var currentPet: Pet!
    
    @IBOutlet weak var statusLabel: UILabel!
    public func updateBackground() {
        petBackground.backgroundColor = currentPet.color
        foodLevelBar.color = currentPet.color!
        happinessBar.color = currentPet.color!
    }
    
    public func updateImg() {
        petImage.image = currentPet.image
    }
    public func updateData() {
        playedTimesLabel.text = "Played: \(currentPet.totalPlayTimes)"
        fedTimesLabel.text = "Fed: \(currentPet.totalFeedTimes)"
        foodLevelBar.animateValue(to: CGFloat(Double(currentPet.currentFoodLevel) / 10))
        happinessBar.animateValue(to: CGFloat(Double(currentPet.currentHappiness) / 10))
        if(currentPet.currentHappiness > 7) {
            currentPet.setStatus("happy")
            
        } else if(currentPet.currentFoodLevel < 3) {
            currentPet.setStatus("hungry")
            
        }
        statusLabel.text = "Status: \(currentPet.status ?? "")"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentPet = cat
        updateImg()
        updateBackground()
        //updateStatus()
    }
    

}


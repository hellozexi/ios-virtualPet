//
//  ViewController.swift
//  VirtualPet
//
//  Created by Mike Liu on 6/19/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var cat = Pet(type: "cat", name: "");
    var dog = Pet(type: "dog", name: "");
    var fish = Pet(type: "fish", name: "");
    var bird = Pet(type: "bird", name: "");
    var bunny = Pet(type: "bunny", name: "");
    

    @IBOutlet weak var foodLevelBar: DisplayView!
    @IBOutlet weak var happinessBar: DisplayView!
    
    @IBOutlet weak var playedTimesLabel: UILabel!
    
    @IBOutlet weak var fedTimesLabel: UILabel!
    
    @IBAction func playTouched(_ sender: UIButton) {
        currentPet.play()
        updateStatus()
        
    }
    @IBAction func feedTouched(_ sender: UIButton) {
        currentPet.feed()
        updateStatus()
    }
    @IBAction func dogSwitch(_ sender: UIButton) {
        currentPet = dog
        updateStatus()
        updateImg()
        updateBackground()
    }
    @IBAction func catSwitch(_ sender: UIButton) {
        currentPet = cat
        updateStatus()
        updateImg()
        updateBackground()
    }
    @IBAction func birdSwitch(_ sender: UIButton) {
        currentPet = bird
        updateStatus()
        updateImg()
        updateBackground()
    }
    @IBAction func fishSwitch(_ sender: UIButton) {
        currentPet = fish
        updateStatus()
        updateImg()
        updateBackground()
    }
    @IBAction func bunnySwitch(_ sender: UIButton) {
        currentPet = bunny
        updateStatus()
        updateImg()
        updateBackground()
    }
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petBackground: UIView!
    var currentPet: Pet!
    
    public func updateBackground() {
        petBackground.backgroundColor = currentPet.color
        foodLevelBar.color = currentPet.color!
        happinessBar.color = currentPet.color!
    }
    
    public func updateImg() {
        petImage.image = currentPet.image
    }
    public func updateStatus() {
        playedTimesLabel.text = "Played: \(currentPet.totalPlayTimes)"
        fedTimesLabel.text = "Fed: \(currentPet.totalFeedTimes)"
        foodLevelBar.animateValue(to: CGFloat(Double(currentPet.currentFoodLevel / 10)))
        happinessBar.animateValue(to: CGFloat(Double(currentPet.currentHappiness / 10)))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentPet = cat
        updateStatus()
        updateImg()
        updateBackground()
    }
    

}


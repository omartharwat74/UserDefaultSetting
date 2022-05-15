//
//  ViewController.swift
//  UserDefaultSetting
//
//  Created by Omar Tharwat on 5/15/22.
//  Copyright © 2022 Omar Tharwat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let defaults = UserDefaults.standard
    var fontSize : Int!
    
     // MARK : OUTLETS
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if defaults.integer(forKey: "fontSize") > 0 {
            updateTextSize(newSize: defaults.integer(forKey: "fontSize"))
        } else {
            fontSize = 30
            defaults.set(fontSize, forKey: "fontSize")
        }
        if defaults.bool(forKey: "SwitchState") != false {
            updateSwitch(value: defaults.bool(forKey: "SwitchState"))
        } else {
            updateSwitch(value: false)
        }
        
    }
    func updateTextSize(newSize:Int)  {
       if newSize > 0 {
        fontSize = newSize
        labelText.font = labelText.font.withSize(CGFloat(fontSize))
        defaults.set(fontSize, forKey: "fontSize")
        }
    }
    func updateSwitch(value : Bool)  {
        if value {
            defaults.set(true, forKey: "SwitchState")
            overrideUserInterfaceStyle = .dark
            darkModeSwitch.isOn = true
        } else {
            defaults.set(false, forKey: "SwitchState")
                       overrideUserInterfaceStyle = .light
                       darkModeSwitch.isOn = false
        }
    }
    // MARK : ACTIONS
    @IBAction func fontPlusButton(_ sender: Any) {
        updateTextSize(newSize:defaults.integer(forKey: "fontSize") + 5)
    }
    @IBAction func fontMinButton(_ sender: Any) {
        updateTextSize(newSize:defaults.integer(forKey: "fontSize") - 5)

    }
    @IBAction func darkModeButton(_ sender: Any) {
        updateSwitch(value: (sender as AnyObject).isOn)
       
    }
    

}


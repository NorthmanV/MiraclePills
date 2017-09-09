//
//  ViewController.swift
//  MiraclePills
//
//  Created by Руслан Акберов on 09.09.17.
//  Copyright © 2017 Руслан Акберов. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerButton: UIButton!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var successView: UIImageView!
    var vanishViews = [UIView]()
    
    let states = ["Alaska", "Arkansas", "Alabama", "California", "Maine", "New York"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        self.vanishViews = [statePicker, countryLabel, countryTextField, zipCodeLabel, zipCodeTextField]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func changeHiddenStatus(array: [UIView]) {
        for view in array {
            view.isHidden = !view.isHidden
        }
    }
    
    @IBAction func stateButtonPressed(_ sender: UIButton) {
        
        changeHiddenStatus(array: self.vanishViews)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerButton.setTitle(states[row], for: UIControlState.normal)
        //statePicker.isHidden = true
    }
    
    @IBAction func buyButtonPressed(_ sender: UIButton) {
        for view in self.view.subviews {
            view.isHidden = true
        }
        successView.isHidden = false
    }
}



//
//  ViewController.swift
//  iTip
//
//  Created by Siva Kalagarla on 7/29/17.
//  Copyright © 2017 Siva Kalagarla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var guestsSlider: UISlider!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var guestsLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    var guestCount = Int(1)
    var tipPercent = Int(15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAndSetDefaults()
        billText.becomeFirstResponder()
        guestsLabel.text = "Guests # 1"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadAndSetDefaults()
        calculateBill()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateBill(_ sender: AnyObject) {
        calculateBill()
    }

    @IBAction func guestSliderValueChanged(_ sender: UISlider) {
        guestCount = Int(guestsSlider.value)
        guestsLabel.text = "Guests # " + String(guestCount)
    }
    
    @IBAction func tipSliderValueChanged(_ sender: UISlider) {
        tipPercent = Int(tipSlider.value)
        tipLabel.text = "Tip " + String(tipPercent) + "%"
    }
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    private func loadAndSetDefaults() {
        let defaults = UserDefaults.standard
        let defaultTip = defaults.integer(forKey: "defaultTip")
        tipLabel.text = "Tip " + String(defaultTip) + "%"
        tipSlider.value = Float(defaultTip)
    }
    
    private func calculateBill() {
        let amt = Float(billText.text!) ?? 0
        let currentGuestCount = Int(guestsSlider.value)
        
        let currentTipPercent = Int(tipSlider.value)
        guestCount = currentGuestCount
        let tipPercent = Float(currentTipPercent)
        var tipAmt = Float(0)
        if tipPercent != 0 {
            tipAmt = Float(amt) * Float(tipPercent/100)
        }
        let total = Float(amt) + tipAmt
        let split = total / Float(guestCount)
        
        tipAmountLabel.text = String(format: "$%.2f", tipAmt)
        totalLabel.text = String(format: "$%.2f", total)
        splitLabel.text = String(format: "$%.2f", split)
    }
}

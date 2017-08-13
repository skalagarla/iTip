//
//  SettingsViewController.swift
//  iTip
//
//  Created by Siva Kalagarla on 8/12/17.
//  Copyright © 2017 Siva Kalagarla. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAndSetDefaults()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear in settings page")
        loadAndSetDefaults()
    }
    
    @IBAction func setTip(_ sender: UITextField) {
        let tip = Int(tipText.text!) ?? 0
        let defaults = UserDefaults.standard
        defaults.setValue(tip, forKey: "defaultTip")
        defaults.synchronize()
    }
    
    private func loadAndSetDefaults() {
        let defaults = UserDefaults.standard
        let defaultTip = defaults.integer(forKey: "defaultTip")
        tipText.text = String(defaultTip)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

}

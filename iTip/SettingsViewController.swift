//
//  SettingsViewController.swift
//  iTip
//
//  Created by Siva Kalagarla on 7/30/17.
//  Copyright © 2017 Siva Kalagarla. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipText: UITextField!
    @IBOutlet weak var maximumTipText: UITextField!
    @IBOutlet weak var minimumTipText: UITextField!
    
    let sysdefaultTip = 20
    let sysdefaultMinimumTip = 0
    let sysdefaultMaximumTip = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let defaultTip = defaults.integer(forKey: "default_tip")
        let defaultMinimumTip = defaults.integer(forKey: "default_min_tip")
        let defaultMaximumTip = defaults.integer(forKey: "default_max_tip")
        
        // set default
        if(defaultTip == 0) {
            defaults.setValue(sysdefaultTip, forKey: "default_tip")
        }
        
        if(defaultMinimumTip == 0) {
            defaults.setValue(sysdefaultMinimumTip, forKey: "default_min_tip")
        }
        
        if(defaultMaximumTip == 0) {
            defaults.setValue(sysdefaultMaximumTip, forKey: "default_max_tip")
        }
        
        defaults.setValue(defaultTipText.text, forKey: "default_tip")
        defaults.setValue(minimumTipText.text, forKey: "default_min_tip")
        defaults.setValue(maximumTipText.text, forKey: "default_max_tip")
        defaults.synchronize()
        
        defaultTipText.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*@IBAction func minimumTipValueChanged(_ sender: Any) {
        let defaults = UserDefaults.standard
        let value = minimumTipText.text
        defaults.setValue(value, forKey: "default_min_tip")
        defaults.synchronize()
    }
    
    
    @IBAction func maximumTipValueChanged(_ sender: Any) {
        let value = maximumTipText.text
        let defaults = UserDefaults.standard
        defaults.setValue(value, forKey: "default_max_tip")
        defaults.synchronize()
    }
    
    @IBAction func defaultTipValueChanged(_ sender: Any) {
        let defaultTipValue = defaultTipText.value(forKey: "default_tip")
        let defaults = UserDefaults.standard
        defaults.setValue(defaultTipValue, forKey: "default_tip")
        defaults.synchronize()
    }*/
}

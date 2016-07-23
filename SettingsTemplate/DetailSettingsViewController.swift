//
//  DetailSettingsViewController.swift
//  SettingsTemplate
//
//  Created by Joe E. on 7/23/16.
//  Copyright © 2016 Montchat. All rights reserved.
//

import UIKit

class DetailSettingsViewController: UIViewController {
    
    var setting:SettingsViewController.SettingsIndex! 

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "\(setting)"

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  SettingsViewController.swift
//  SettingsTemplate
//
//  Created by Joe E. on 7/23/16.
//  Copyright © 2016 Montchat. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    enum SettingsIndex: Int { case Name, Username, Email, Mobile, Password }

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self ; tableView.dataSource = self
        navigationItem.title = "Settings" 
        
    }

}

extension SettingsViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let settingsCell:SettingsCell = tableView.cellForRowAtIndexPath(indexPath) as? SettingsCell else { return }
        performSegueWithIdentifier("detailSegue", sender: settingsCell)
     
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let settingsCell = sender as? SettingsCell {
            guard let detailVC = segue.destinationViewController as? DetailSettingsViewController else { return }
            detailVC.setting = settingsCell.setting
            
        }
        
    }
    
}

extension SettingsViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count: Int { return SettingsIndex.Password.hashValue + 1 }
        
        return count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        let settingsCell = SettingsCell(setting: SettingsIndex(rawValue: row)!)
        
        return settingsCell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    
}


class SettingsCell : UITableViewCell {
    
    let setting: SettingsViewController.SettingsIndex!
    
    init(setting:SettingsViewController.SettingsIndex) {
        self.setting = setting
        super.init(style: .Subtitle, reuseIdentifier: "cell")
        
        textLabel?.text = "\(setting)"
        selectionStyle = .None
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


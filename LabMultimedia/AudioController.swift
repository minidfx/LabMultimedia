//
//  SecondViewController.swift
//  LabMultimedia
//
//  Created by Benjamin Burgy on 14.12.15.
//  Copyright © 2015 HES-SO Master. All rights reserved.
//

import UIKit
import MediaPlayer

class AudioController: UITableViewController {
    
    var mediaItems: [MPMediaItem]?
    var items: [String] = ["Song1", "Song2"]
    
    @IBOutlet var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mediaItems = MPMediaQuery.songsQuery().items
        self.mainTableView.dataSource = self
        self.mainTableView.delegate = self
        
        NSLog("AudioController loaded.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SongCell", forIndexPath: indexPath)
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
}


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
    
    @IBOutlet var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainTableView.dataSource = self
        self.mainTableView.delegate = self
        
        self.mediaItems = MPMediaQuery.songsQuery().items
        
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
        return (self.mediaItems?.count)!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let mediaItem = self.mediaItems![indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SongCell", forIndexPath: indexPath)
        cell.textLabel?.text = mediaItem.valueForProperty(MPMediaItemPropertyTitle) as? String

        return cell
    }
}


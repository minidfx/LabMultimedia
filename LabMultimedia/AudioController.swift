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
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationVC = segue.destinationViewController as? PlayerController {
            let mediaItem = self.mediaItems![(self.mainTableView.indexPathForSelectedRow?.row)!]
            
            destinationVC.mediaItem = mediaItem
            destinationVC.mediaItems = self.mediaItems
        }
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
        cell.imageView?.image = mediaItem.artwork?.imageWithSize(CGSize(width: 20, height: 20))
        cell.detailTextLabel?.text = mediaItem.valueForProperty(MPMediaItemPropertyArtist) as? String
        
        return cell
    }
}


//
//  PlayerController.swift
//  LabMultimedia
//
//  Created by Benjamin Burgy on 14.12.15.
//  Copyright © 2015 HES-SO Master. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class PlayerController: UIViewController {
    

    let player = MPMusicPlayerController.applicationMusicPlayer()
    var mediaItem: MPMediaItem?
    var mediaItems: [MPMediaItem]?

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var artworkImage: UIImageView!
    
    @IBAction func touchDownStop(sender: AnyObject) {
        self.player.stop()
        
        self.playButton.enabled = true
        self.stopButton.enabled = false
    }
    
    @IBAction func touchDownPlay(sender: AnyObject) {
        self.player.play()
        
        self.playButton.enabled = false
        self.stopButton.enabled = true
    }
    
    @IBAction func touchDownPrevious(sender: AnyObject) {
        self.player.skipToPreviousItem()
        let item = self.player.nowPlayingItem
        
        self.displaySongInfo(item!)
        self.determineButtonStates()
    }
    
    @IBAction func touchDownNext(sender: AnyObject) {
        self.player.skipToNextItem()
        let item = self.player.nowPlayingItem
        
        self.displaySongInfo(item!)
        self.determineButtonStates()
    }
    
    @IBAction func touchDownClose(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collection = MPMediaItemCollection.init(items: self.mediaItems!)
        
        self.player.setQueueWithItemCollection(collection)
        self.player.nowPlayingItem = self.mediaItem!
        self.displaySongInfo(self.mediaItem!)
        self.determineButtonStates()
    }
    
    func determineButtonStates() {
        self.nextButton.enabled = self.player.indexOfNowPlayingItem + 1 < self.mediaItems?.count
        self.previousButton.enabled = self.player.indexOfNowPlayingItem > 0
    }
    
    func displaySongInfo(item: MPMediaItem) {
        
        self.titleLabel.text = item.valueForProperty(MPMediaItemPropertyTitle) as? String
        self.artistLabel.text = item.valueForProperty(MPMediaItemPropertyArtist) as? String
        self.albumLabel.text = item.valueForProperty(MPMediaItemPropertyAlbumTitle) as? String
        self.artworkImage.image = item.artwork?.imageWithSize(CGSize(width: 150, height: 150))
    }
}

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
    var isPlaying = Bool()
    var mediaItem: MPMediaItem?
    
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artworkImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collection = MPMediaItemCollection.init(items: [self.mediaItem!])
        
        self.player.setQueueWithItemCollection(collection)
        self.displaySongInfo()
    }
    
    @IBAction func touchDownStop(sender: AnyObject) {
        self.stop()
    }
    
    @IBAction func touchDownPlay(sender: AnyObject) {
        self.play()
    }
    
    @IBAction func touchDownClose(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func displaySongInfo() {
        self.titleLabel.text = self.mediaItem?.valueForProperty(MPMediaItemPropertyTitle) as? String
        self.artistLabel.text = self.mediaItem?.valueForProperty(MPMediaItemPropertyArtist) as? String
        self.albumLabel.text = self.mediaItem?.valueForProperty(MPMediaItemPropertyAlbumTitle) as? String
        self.artworkImage.image = self.mediaItem?.artwork?.imageWithSize(CGSize(width: 150, height: 150))
    }
    
    func stop() {
        self.player.stop()
    }
    
    func play() {
        
        if self.isPlaying {
            self.player.pause()
            self.isPlaying = false
        } else {
            self.player.play()
            self.isPlaying = true
        }
    }
}

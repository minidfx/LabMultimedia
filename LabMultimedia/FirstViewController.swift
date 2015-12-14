//
//  FirstViewController.swift
//  LabMultimedia
//
//  Created by Benjamin Burgy on 14.12.15.
//  Copyright © 2015 HES-SO Master. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func runMovie(sender: AnyObject) {
        let url = "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v"
        let playerItem = AVPlayerItem(URL: NSURL(string:url)!)
        let player = AVPlayer(playerItem:playerItem)
        
        player.play()
    }
}


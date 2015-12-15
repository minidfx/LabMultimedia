//
//  MoviePlayerController.swift
//  LabMultimedia
//
//  Created by Benjamin Burgy on 14.12.15.
//  Copyright © 2015 HES-SO Master. All rights reserved.
//

import Foundation
import AVKit
import AVFoundation

class MoviePlayerController: AVPlayerViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.player = AVPlayer.init(URL: NSURL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!)
        self.player?.play()
    }
}
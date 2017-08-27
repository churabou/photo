//
//  TryaddTextViewController.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/06/12.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class TryaddTextViewController: UIViewController,MovieTitleDelegate {
    
    let outputPath  = NSHomeDirectory() + "/Documents/output.mp4"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    @IBAction func onclick(){
    
        let path = Bundle.main.path(forResource: "doll", ofType: "mp4")!
        
        let manager = MovieTitleManager()
        manager.inputFilePath = path
        manager.outputPath = outputPath
        manager.text  = "sample text"
        manager.fontSize = 80.0
        manager.delegate = self
        manager.addText()
    }
    
    
    //delegate
    
    func addTextCompleated() {
        playMovieFromProjectBundle(path:outputPath )
    }
    
    
    //動画再生画面
    func playMovieFromProjectBundle(path:String) {
        
        let videoPlayer = AVPlayer(url: URL(fileURLWithPath: path))
        
        // 動画プレイヤーの用意
        let playerController = AVPlayerViewController()
        playerController.player = videoPlayer
        self.present(playerController, animated: true, completion: {
            videoPlayer.play()
        })
    }
    
    
    

}

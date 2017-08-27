//
//  MovieText.swift
//  SavePhotos
//
//  Created by ちゅーたつ on 2017/06/12.
//  Copyright © 2017年 ちゅーたつ. All rights reserved.
//

import UIKit
import AVFoundation


//動画に文字を入れたいとき
protocol MovieTitleDelegate {
    
    func addTextCompleated() -> Void
}


class MovieTitleManager{//とりあえず動く。アニメーションが期待ない
    
    
    var text:String!
    var inputFilePath:String!
    var delegate:MovieTitleDelegate?
    var outputPath =  NSHomeDirectory() + "/Documents/out.mp4"
    
    
    func addText(){
        
        let composition = AVMutableComposition()
        
        //動画の情報を取得
        let compositionVideoTrack = composition.addMutableTrack(withMediaType: AVMediaTypeVideo, preferredTrackID: kCMPersistentTrackID_Invalid)
        let compositionAudioTrack = composition.addMutableTrack(withMediaType: AVMediaTypeAudio, preferredTrackID: kCMPersistentTrackID_Invalid)
        
        let url = URL(fileURLWithPath: inputFilePath)
        
        let asset = AVURLAsset(url: url)
        
        let videoTrack = asset.tracks(withMediaType: AVMediaTypeVideo)[0]
        let audioTrack = asset.tracks(withMediaType: AVMediaTypeAudio)[0]
        
        do{
            try compositionVideoTrack.insertTimeRange(videoTrack.timeRange, of: videoTrack, at: kCMTimeZero)
        }catch{}
        do{
            try compositionAudioTrack.insertTimeRange(videoTrack.timeRange, of: audioTrack, at: kCMTimeZero)
        }catch{}
        
        
        let renderSize = videoTrack.naturalSize
        let transform = videoTrack.preferredTransform
        
        let videoLayer = CALayer() //直接parantLayerに貼るんじゃなくて別のレイヤーにつけること
        videoLayer.frame = CGRect(x: 0, y: 0, width: renderSize.width, height: renderSize.height)
        
        
        let textLayer = createTextLayer()
        
        textLayer.add(textColorAnimation(), forKey: nil)
        
        let parentTextLayer = CALayer()
        parentTextLayer.frame = CGRect(x: 0, y: 0, width: 550, height: 140)
        parentTextLayer.position = CGPoint(x:200,y:200)
        parentTextLayer.addSublayer(textLayer)
        parentTextLayer.add(defaultAnimation(), forKey: nil)
        
        let parentLayer = CALayer()
        parentLayer.frame = CGRect(x: 0, y: 0, width: renderSize.width, height: renderSize.height)
        parentLayer.addSublayer(videoLayer)
        parentLayer.addSublayer(parentTextLayer)
        
        
        let videoComposition = AVMutableVideoComposition()
        
        
        videoComposition.renderSize = renderSize
        videoComposition.frameDuration = CMTimeMake(1,30)
        
        let layerInstruction = AVMutableVideoCompositionLayerInstruction(assetTrack: compositionVideoTrack)
        layerInstruction.setTransform(transform, at: kCMTimeZero)
        
        let instruction = AVMutableVideoCompositionInstruction()
        instruction.timeRange = compositionVideoTrack.timeRange
        instruction.layerInstructions = [layerInstruction]
        
        videoComposition.instructions = [instruction]
        videoComposition.animationTool = AVVideoCompositionCoreAnimationTool(postProcessingAsVideoLayer: videoLayer, in: parentLayer)
        
        
        let fileManager = FileManager()
        
        if fileManager.fileExists(atPath: outputPath){
            do{
                try fileManager.removeItem(atPath: outputPath)
            } catch {
                print("ファイルを消すときのエラー\(error)")
                
            }
        }
        
        guard let assetExportSession = AVAssetExportSession(asset: composition, presetName: AVAssetExportPresetHighestQuality) else{
            fatalError("could not create assetExportSession")
        }
        
        assetExportSession.videoComposition = videoComposition
        
        assetExportSession.outputFileType = AVFileTypeQuickTimeMovie
        assetExportSession.outputURL = NSURL(fileURLWithPath: outputPath) as URL
        assetExportSession.shouldOptimizeForNetworkUse = true
        
        
        //動画をExport
        assetExportSession.exportAsynchronously(completionHandler: {
            
            switch assetExportSession.status{
            case .completed:
                print("作成完了")
                self.delegate?.addTextCompleated()
                break
            case .failed:
                print("失敗 \(assetExportSession.error)")
                break
                
            case .cancelled:
                print("キャンセル")
                break
            case .exporting:
                print("動画を作成中ですしばらくお待ちください")
            default:
                print("other")
                break
                
            }
            
        })
        
        
    }
    
    //アニメーション関係について模索中
    var textColor:UIColor = UIColor.red
    var fontSize:CGFloat = 70.0
    var setTextAnimation:CAAnimationGroup!
    
    
    var textMoveFromValue = CGPoint(x:300,y:400)
    var textMoveToValue = CGPoint(x: 700, y:400)
    var textMoveDuration = 1.0
    
    //textlayer UILabel likeのもの
    func createTextLayer() -> CATextLayer{
        let textLayer = CATextLayer()
        textLayer.frame = CGRect(x: 0, y: 0, width: 550, height: 140)
        textLayer.position = CGPoint(x:200,y:200)
        textLayer.string = text
        textLayer.font = UIFont(name: "Helvetica", size: fontSize)
        textLayer.fontSize = fontSize
        textLayer.foregroundColor = textColor.cgColor
        textLayer.alignmentMode = kCAAlignmentCenter
        return textLayer
        
    }
    
    
    //textLayerを貼り付けたparentLayerのpostionにアニメーションをつける。
    
    func defaultAnimation() -> CAAnimationGroup {
        
        
        let fadeinAnimation = CABasicAnimation(keyPath: "opacity")
        
        fadeinAnimation.fromValue = 1
        fadeinAnimation.toValue = 0
        
        let textMoveAnimation = CABasicAnimation(keyPath: "position")
        
        textMoveAnimation.fromValue = textMoveFromValue
        textMoveAnimation.toValue = textMoveToValue
        
        
        let group = CAAnimationGroup()
        group.animations = [textMoveAnimation]
        group.duration = textMoveDuration
        group.beginTime = AVCoreAnimationBeginTimeAtZero
        group.isRemovedOnCompletion = false
        group.fillMode = kCAFillModeForwards
        
        
        return group
        
    }
    
    
    //CATextLayer にカラーアニメーションをつける
    
    func textColorAnimation() -> CABasicAnimation {
        let textColorAnimation = CABasicAnimation(keyPath: "foregroundColor")
        textColorAnimation.fromValue = UIColor.white.cgColor
        textColorAnimation.toValue = UIColor.blue.cgColor
        textColorAnimation.duration = 0.5   //*2倍ppoi
        
        textColorAnimation.isRemovedOnCompletion = false
        textColorAnimation.fillMode = kCAFillModeForwards
        
        return textColorAnimation
        
    }
}


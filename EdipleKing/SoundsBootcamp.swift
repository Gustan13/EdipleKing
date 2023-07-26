//
//  SoundsBootcamp.swift
//  EdipleKing
//
//  Created by Gustavo Binder on 26/07/23.
//

import AVKit

class SoundManager {
    static let instance = SoundManager()
    
    var player : AVAudioPlayer!
    
    func playSound(_ sound: String) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: ".mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error: \(error)")
        }
    }
}

//
//  AK5Test1App.swift
//  AK5Test1
//
//  Created by Matthew Hoopes on 11/15/20.
//

import SwiftUI
import AudioKit
import AVFoundation

//class PlayerController {
//
//    var player = AudioPlayer()
//
//    func load(filename: String) {
//        player.stop()
//        let url = Bundle.main.resourceURL?.appendingPathComponent("Samples/\(filename)")
//        let file = try! AVAudioFile(forReading: url!)
//        let buffer = try! AVAudioPCMBuffer(file: file)!
//        player.scheduleBuffer(buffer, at: nil, options: .loops)
//        player.play()
//    }
//}

class AKTest {
        
    init() {
        let engine = AudioEngine()
        
        let mixer = Mixer()
        mixer.volume = 1
        
        engine.output = mixer
        try! engine.start()
        
        let noise = WhiteNoise()
        mixer.addInput(noise)
        
        noise.amplitude = 1
        noise.start()

        //        let player = AudioPlayer()
        //        mixer.addInput(player)
        //        let url = Bundle.main.resourceURL?.appendingPathComponent("alphabet.mp3")
        //        let file = try! AVAudioFile(forReading: url!)
        //        let buffer = try! AVAudioPCMBuffer(file: file)!
        //        player.scheduleBuffer(buffer, at: nil, options: .loops)
        //        player.play()
    }
}

@main
struct AK5Test1App: App {
    
    var whatever = AKTest()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

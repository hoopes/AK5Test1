//
//  AK5Test1App.swift
//  AK5Test1
//
//  Created by Matthew Hoopes on 11/15/20.
//

import SwiftUI
import AudioKit
import AVFoundation

class AKTest {
    
    let engine = AudioEngine()
    let outputMixer = Mixer()
    let globalPlayer = AudioPlayer()
    
    func start() {
        outputMixer.addInput(globalPlayer)
        
        engine.output = outputMixer
        try! engine.start()
    }
    
    /** Play an mp3 on the main player */
    func works() {
        playMp3(p: globalPlayer)
    }
    
    /** Create a player and attach it to the main mixer */
    func alsoWorks() {
        let p1 = AudioPlayer()
        outputMixer.addInput(p1)
        
        playMp3(p: p1)
    }
    
    /** Try to add a mixer with a player to the main mixer */
    func doesNotWork() {
        let p2 = AudioPlayer()
        let localMixer = Mixer()
        
        localMixer.addInput(p2)
        outputMixer.addInput(localMixer)
        
        print ("TREE:")
        print (engine.connectionTreeDescription)
        
        playMp3(p: p2)
    }
    
    func playMp3(p: AudioPlayer) -> Void {
        let url = URL(string: "file:///tmp/mpthreetest.mp3")!
        try! p.load(url: url)
        p.play()
    }
}

@main
struct AK5Test1App: App {
    
    var whatever = AKTest()
    
    var body: some Scene {
        WindowGroup {
            VStack {
//                Button("Click me to initialize", action: { whatever.start() })
                Button("Works", action: { whatever.works() })
                Button("Also Works", action: { whatever.alsoWorks() })
                Button("Ain't Work", action: { whatever.doesNotWork() })
            }.onAppear {
                print ("APPEAR")
                whatever.start()
            }
        }
    }
    
}

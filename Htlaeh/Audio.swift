//
//  Audio.swift
//  Htlaeh
//
//  Created by Cody Weaver on 8/31/16.
//  Copyright © 2016 Cody Weaver. All rights reserved.
//

import Foundation
import AVFoundation

struct Audio {
   
   static func countdown(seconds: Int) {
      
      let speech: AVSpeechSynthesizer = AVSpeechSynthesizer()
      speech.speakUtterance(AVSpeechUtterance(string: "\(seconds)"))
      
   }
   
   static func tenSecondsLeft() {
      
      let speech: AVSpeechSynthesizer = AVSpeechSynthesizer()
      speech.speakUtterance(AVSpeechUtterance(string: "10 seconds until next set"))
      
   }
   
   static func speak(string: String) {
      
      let speech: AVSpeechSynthesizer = AVSpeechSynthesizer()
      speech.speakUtterance(AVSpeechUtterance(string: string))
      
   }
   
}

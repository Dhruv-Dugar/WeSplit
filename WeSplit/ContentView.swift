//
//  ContentView.swift
//  WeSplit
//
//  Created by Dhurv Dugar on 10/01/23.
//

import SwiftUI

struct ContentView: View {
    
    var tapCount = 0
    
    var body: some View {
        Button("Tap Count :\(tapCount)"){
            tapCount += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

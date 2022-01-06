//
//  ContentView.swift
//  SwiftMainActorBugDemo
//
//  Created by xiaogd on 2022/1/6.
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 48) {
            Button(action: {
                MainActorTester().failedTest()
            }) {
                Text("Run failed test!")
            }

            Button(action: {
                MainActorTester().successTest()
            }) {
                Text("Run success test!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

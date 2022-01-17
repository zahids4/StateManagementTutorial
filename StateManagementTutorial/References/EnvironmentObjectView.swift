//
//  EnvironmentObjectView.swift
//  StateManagementTutorial
//
//  Created by Saim Zahid on 2022-01-17.
//

import SwiftUI

// Our observable object class
class AppState: ObservableObject {
    @Published var score = 0
}

// A view that expects to find a GameSettings object
// in the environment, and shows its score.
struct ScoreView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            Text("Score: \(appState.score)")
            Button("Increase Score") {
                appState.score += 1
            }
        }
    }
}


// A view that expects to find a GameSettings object
// in the environment, and shows its score.
struct SecondScoreView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        Text("Second Score View Score: \(appState.score)")
    }
}
// A view that creates the GameSettings object,
// and places it into the environment for the
// navigation view.
/// Think of this as the entry point of the app
struct EnvironmentObjectView: View {
    /// Declare this in the root, this is where the state object is instantiated or injected
    @StateObject var appState: AppState

    var body: some View {
        NavigationView {
            VStack {
                // A button that writes to the environment settings
                Button("Increase Score") {
                    appState.score += 1
                }

                NavigationLink(destination: ScoreView()) {
                    Text("Show Score View")
                }
                
                NavigationLink(destination: SecondScoreView()) {
                    Text("Show 2nd Score View")
                }
            }
            .frame(height: 200)
        }
        .environmentObject(appState)
    }
}
struct EnvironmentObjectView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectView(appState: AppState())
    }
}

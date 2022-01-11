//
//  StateAndBindingView.swift
//  StateManagementTutorial
//
//  Created by Saim Zahid on 2022-01-07.
//

import SwiftUI

struct StateAndBindingView: View {
    @State private var counter: Int = 3
    
    var body: some View {
        VStack {
            Text("\(counter)")
            ChildViewWithBinding(counter: $counter)
        }
        
    }
}

struct ChildViewWithBinding: View {
    @Binding var counter: Int
    
    var body: some View {
        Button(action: {
            counter += 1
        }, label: {
            Text("Increment")
        })
    }
}

struct StateAndBindingView_Previews: PreviewProvider {
    static var previews: some View {
        StateAndBindingView()
    }
}

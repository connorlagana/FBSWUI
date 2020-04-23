//
//  ContentView.swift
//  FBSW
//
//  Created by Connor Lagana on 4/23/20.
//  Copyright © 2020 Connor Lagana. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let posts = ["1", "2", "3"]
    
    var body: some View {
        NavigationView {
            List {
                
                ScrollView {
                    
                    VStack (alignment: .leading) {
                        Text("Trending")
                        HStack {
                            Text("Group1")
                            Text("Group1")
                            Text("Group1")
                            Text("Group1")
                        }
                    }
                }.frame(height: 100)
                
                ForEach(posts, id: \.self) { post in
                    PostView()
                }
                
            }.navigationBarTitle(Text("Groups"))
        }
        
    }
}

struct PostView: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("Username").font(.headline)
            Text("Caption")
            Image("arches")
        }.padding(.leading, -15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

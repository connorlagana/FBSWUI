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
            HStack {
                Image("alex")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                VStack (alignment: .leading, spacing: 4) {
                    Text("Alexandra Daddario").font(.headline)
                    Text("Posted 18 minutes ago")
                }.padding(.leading, 8)
            }
            
            Text("Just had the time of my life at Arches National Park™. I wish Zac Efron was here so we can workout together and get super swoll!")
            Image("arches")
        }.padding(.leading, -15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

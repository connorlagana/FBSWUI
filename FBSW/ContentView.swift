//
//  ContentView.swift
//  FBSW
//
//  Created by Connor Lagana on 4/23/20.
//  Copyright © 2020 Connor Lagana. All rights reserved.
//

import SwiftUI


struct Post: Identifiable {
    let id: Int
    let username, text, imageName, userImageName: String
}

struct Story: Identifiable {
    let id: Int
    let username, imageName: String
}


struct ContentView: View {
    
    let stories: [Story] = [
        .init(id: 0, username: "Zac Efron", imageName: "zac"),
        .init(id: 1, username: "Martha Stewart", imageName: "martha"),
        .init(id: 2, username: "Kygo", imageName: "kygo"),
        .init(id: 3, username: "Mongoose", imageName: "mongoose"),
        .init(id: 4, username: "Alexandra Daddario", imageName: "alex"),
        .init(id: 5, username: "Kelly Kapowski", imageName: "kelly"),
        .init(id: 6, username: "Con", imageName: "con"),
        .init(id: 7, username: "Kevvy", imageName: "kev"),
    ]
    
    let posts: [Post] = [
        .init(id: 0, username: "Alexandra Daddario", text: "Just had the time of my life at Arches National Park™. I wish Zac Efron was here so we can workout together and get super swoll!", imageName: "arches", userImageName: "alex"),
        .init(id: 1, username: "Zac Efron", text: "In hawaii for the weekend. it's soooo much fun. Wish alex was here!!!!", imageName: "hawaii", userImageName: "zac")]
    
    init() {
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                VStack (alignment: .leading) {
                    Text("Stories")
                    ScrollView (.horizontal, showsIndicators: false) {
                        
                        VStack {
                            HStack {
                            ForEach(stories, id: \.id) { story in
                                StoryView(story: story)
                                
                                }
                            }
                        }
                    }.frame(height: 130).padding(.leading, -15).padding(.trailing, -15)
                }
                
                
                
                ForEach(posts, id: \.id) { post in
                    PostView(post: post)
                }
                
            }.navigationBarTitle(Text("Conbook"))
        }
        
    }
}

struct StoryView: View {
    let story: Story
    var body: some View {
        VStack {
            Image("\(story.imageName)")
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60, alignment: .leading)
                .clipShape(Circle())
                .overlay(Circle().stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 248/255, green: 219/255, blue: 132/255), Color(red: 234/255, green: 132/255, blue: 59/255), Color(red: 197/255, green: 59/255, blue: 117/255), Color(red: 138/255, green: 55/255, blue: 184/255)]), startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: 4))
            Text("\(story.username)").lineLimit(1).font(.caption)
            }.frame(width: 70, height: 100)
    }
}

struct PostView: View {
    
    let post: Post
    
    let rand = Int(arc4random_uniform(UInt32(59)))
    
    var body: some View {
        VStack (alignment: .leading, spacing: 12) {
            HStack {
                Image("\(post.userImageName)")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                VStack (alignment: .leading, spacing: 4) {
                    Text("\(post.username)").font(.headline)
                    Text("Posted \(rand) minutes ago").font(.subheadline).foregroundColor(.gray)
                }.padding(.leading, 8)
                
            }.padding(.leading, 16).padding(.top, 16)
            
            Text("\(post.text)")
                .lineLimit(nil)
                .padding(.leading, 16)
                .padding(.trailing, 16)
                
            Image("\(post.imageName)")
                
                .resizable()
                .scaledToFill()
                .frame(width:  400, height: 260)
                
            }.padding(.leading, -20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

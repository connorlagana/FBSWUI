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
        .init(id: 5, username: "Kelly Kapowski", imageName: "kelly")
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
                .frame(width: 60, height: 60, alignment: .leading)
                .clipShape(Circle())
            Text("\(story.username)").lineLimit(1)
            }.frame(width: 100)
    }
}

struct PostView: View {
    
    let post: Post
    
    var body: some View {
        VStack (alignment: .leading, spacing: 12) {
            HStack {
                Image("\(post.userImageName)")
                    .resizable()
                    //I don't know how to fix the stretch, this works but it makes the image smaller for some odd reason (not fixed amount tho)
//                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                VStack (alignment: .leading, spacing: 4) {
                    Text("\(post.username)").font(.headline)
                    Text("Posted 18 minutes ago").font(.subheadline).foregroundColor(.gray)
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

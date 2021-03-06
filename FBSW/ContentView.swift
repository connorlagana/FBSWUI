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

let backs = ["back1", "back2", "back3", "back4", "back5", "back6"]

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
                    Text("Stories").font(.headline)
                    ScrollView (.horizontal, showsIndicators: false) {
                        
                        VStack {
                            HStack {
                            ForEach(stories, id: \.id) { story in
                                NavigationLink(destination: StoryDetailView(story: story)) {
                                    StoryView(story: story)
                                }
                                
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

struct StoryDetailView: View {
    
    let story: Story
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let rand = Int(arc4random_uniform(UInt32(backs.count)))
    
    var body: some View {
        VStack {
            HStack {
                Image("\(story.imageName)").resizable()
                .scaledToFill()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                Text("\(story.username)").font(.caption).foregroundColor(.white)
            }.frame(width: 350, height: 730, alignment: .topLeading)

        }.background(Image("\(backs[rand])").resizable().scaledToFill().frame(width: 400, height: 1000).clipped()).onAppear( perform: {
            print("hello")
            
        })
        
        
    }
}

struct StoryView: View {
    let story: Story
    var body: some View {
        VStack {
            Image("\(story.imageName)").renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 248/255, green: 219/255, blue: 132/255), Color(red: 234/255, green: 132/255, blue: 59/255), Color(red: 197/255, green: 59/255, blue: 117/255), Color(red: 138/255, green: 55/255, blue: 184/255)]), startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: 4))
            Text("\(story.username)").foregroundColor(.primary).lineLimit(1).font(.caption)
            }.frame(width: 70, height: 100)
    }
}

struct PostView: View {
    
    let post: Post
    
    let rand = Int(arc4random_uniform(UInt32(60)))
    
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

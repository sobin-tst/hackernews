//
//  ContentView.swift
//  H4ckerNexz
//
//  Created by Sobin Thomas on 06/12/21.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var networkManager = NetworkManger()
    
    var body: some View {
        NavigationView {
          
            List(networkManager.posts, rowContent: { post in
                
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        VStack {
                            HStack {
                                Text(String(post.points)) // another way to cast to string rather than string interpolation
                                Text(post.title)
                            }
                            Text(post.author)
                                .foregroundColor(.blue)
                               
                        }
                    })
                

               
            })
            .navigationTitle("Hacker News")

        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//let posts = [Post(id: "1", title: "Title 1"),
//             Post(id: "2", title: "Title 2"),
//             Post(id: "3", title: "Title 3")]
//where do this posts var belong to??? not related to any struct or class

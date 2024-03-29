//
//  Posts.swift
//  MyPlace
//
//  Created by Julian Smith on 3/10/23.
//

import SwiftUI

struct Posts: View {
  @StateObject var viewModel = PostsViewModel()
  @State private var searchText = ""
  @State private var showNewPostForm = false
  
  func getPosts() {
    
  }
  
  var body: some View {
    NavigationView {
      List(viewModel.posts) { post in
        if searchText.isEmpty || post.contains(searchText){
          PostCard(post: post)
        }
      }
      .navigationTitle("Home")
      .searchable(text: $searchText)
    }
    .sheet(isPresented: $showNewPostForm) {
      NewPostForm(createAction: viewModel.makeCreateAction())
    }
    .overlay(
      Button {
        showNewPostForm = true
      } label: {
        Image(systemName: "square.and.pencil")
      }
      .padding()
      .foregroundColor(.white)
      .background(Color.blue)
      .cornerRadius(9999)
      .padding(.bottom, 20)
      .padding(.trailing, 20)
      ,alignment: .bottomTrailing
    )
    .onAppear {
      Task {
        do {
          try await viewModel.fetchPosts()
        } catch {
          print("Error fetching posts: \(error.localizedDescription)")
          viewModel.posts = []
        }
      }
    }
  }
}

struct Posts_Previews: PreviewProvider {
  static var previews: some View {
      Posts()
  }
}

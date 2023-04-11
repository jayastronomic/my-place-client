//
//  PostsViewModel.swift
//  MyPlace
//
//  Created by Julian Smith on 3/12/23.
//

import Foundation

@MainActor
class PostsViewModel: ObservableObject {
  @Published var posts: [Post] = []
  var postsRepository =  PostsRepository()
  
  func makeCreateAction() -> NewPostForm.CreateAction {
    return { [weak self] post in
      self?.posts.insert(post, at: 0)
    }
  }
  
  func fetchPosts() async throws {
    self.posts = try await postsRepository.getPosts()
  }
}

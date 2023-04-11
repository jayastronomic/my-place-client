//
//  PostsRepository.swift
//  MyPlace
//
//  Created by Julian Smith on 3/12/23.
//

import Foundation
 
struct PostsRepository {
  static let postsReference: [Post] = []
  
  func getPosts() async throws -> [Post] {
    return try await fetch("/posts", method: .GET, type: [Post].self, payload: Post())!
  }
}

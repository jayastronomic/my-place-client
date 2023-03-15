//
//  Post.swift
//  MyPlace
//
//  Created by Julian Smith on 3/10/23.
//

import Foundation

struct Post: Identifiable, Codable {
  var id = UUID()
  var content: String
  var timestamp = Date()
  
  func contains(_ string: String) -> Bool {
    let properties = [content].map { $0.lowercased() } 
    let query = string.lowercased()
    let matches = properties.filter { $0.contains(query)}
    return !matches.isEmpty
  }
  
}

extension Post {
  static let testPost = Post(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
}

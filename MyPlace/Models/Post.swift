//
//  Post.swift
//  MyPlace
//
//  Created by Julian Smith on 3/10/23.
//

import Foundation

struct Post: Identifiable, Codable{
  var id = UUID()
  var content: String
  
  func contains(_ string: String) -> Bool {
    let properties = [content].map { $0.lowercased() } 
    let query = string.lowercased()
    let matches = properties.filter { $0.contains(query)}
    return !matches.isEmpty
  }
  
  init(id: UUID = UUID(), content: String) {
    self.id = id
    self.content = content
  }
  
  init(){
    self.content = ""
  }
}

extension Post {
  static let testPost = Post(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
}


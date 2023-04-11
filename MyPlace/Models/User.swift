//
//  User.swift
//  MyPlace
//
//  Created by Julian Smith on 3/15/23.
//

import Foundation

struct User: Codable, Identifiable {
  var id = UUID()
  var username: String = ""
  var email: String = ""
  var name: String?
  var city: String?
  var state: String?
  var bio: String?
  var website: String?
  
  init(id: UUID?, username: String, email: String, name: String?, city: String?, state: String?, bio: String?, website: String?){
    self.id = id!
    self.username = username
    self.email = email
    self.name = name
    self.city = city
    self.state = state
    self.bio = bio
    self.website = website
  }
  
  init() {}
}

extension User {
  struct Create: Codable {
    var username: String
    var email: String
    var password: String
    var confirmPassword: String
  }
}

extension User {
  struct SignIn: Codable {
    var username: String
    var password: String
  }
}

extension User {
  struct Token: Codable {
    var id: UUID?
    var value: String
    var user: User
    
    enum CodingKeys: String, CodingKey {
      case id
      case value
      case user
    }
    
    enum UserInfoKeys: String, CodingKey {
      case id
      case username
      case email
      case name
      case city
      case state
      case bio
      case website
    }
    
    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      id = try values.decode(UUID.self, forKey: .id)
      value = try values.decode(String.self, forKey: .value)
      let userInfo = try values.nestedContainer(keyedBy: UserInfoKeys.self, forKey: .user)
      user = User(
              id: try userInfo.decode(UUID.self, forKey: .id),
              username: try userInfo.decode(String.self, forKey: .username),
              email: try userInfo.decode(String.self, forKey: .email),
              name: try userInfo.decodeIfPresent(String.self, forKey: .name),
              city: try userInfo.decodeIfPresent(String.self, forKey: .city),
              state: try userInfo.decodeIfPresent(String.self, forKey: .state),
              bio: try userInfo.decodeIfPresent(String.self, forKey: .bio),
              website: try userInfo.decodeIfPresent(String.self, forKey: .website)
            )
    }
  }
}


//
//  UsersRepository.swift
//  MyPlace
//
//  Created by Julian Smith on 3/20/23.
//

import Foundation

@MainActor
public struct UsersRepository {
  
  // POST /users
  static func createUser(_ newUser: User.Create) async throws -> User {
    try await fetch("/users", method: .POST, type: User.self, payload: newUser)!
  }
  
  // POST /login
  static func signInUser(_ authUser: User.SignIn) async throws -> User {
    try await fetch("/login", method: .POST, type: User.self, payload: authUser)!
  }
}

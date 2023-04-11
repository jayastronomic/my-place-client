//
//  AuthService.swift
//  MyPlace
//
//  Created by Julian Smith on 3/22/23.
//

import Foundation
import KeychainAccess

@MainActor
class AuthService: ObservableObject {
  @Published var isAuthenticated = false

  
  func createAccount(_ newUser: User.Create) async throws -> User.Token? {
    guard let authUserToken = try await fetch("/users", method: .POST, type: User.Token.self, payload: newUser) else {
      print("error")
      return nil
    }
    return authUserToken
  }
  
  func signIn(_ authUser: User.SignIn) async throws -> User.Token {
    let Base64Credentials = "\(authUser.username):\(authUser.password)".data(using: .utf8)?.base64EncodedString()
    let headers = [
      "Authorization": "Basic \(Base64Credentials!)"
    ]
    return try await fetch("/login", method: .POST, headers: headers, type: User.Token.self, payload: authUser)!
  } 
  
  func signOut() throws {
    deleteResource()
  }
}

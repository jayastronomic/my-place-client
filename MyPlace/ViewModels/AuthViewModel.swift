//
//  AuthViewModel.swift
//  MyPlace
//
//  Created by Julian Smith on 3/23/23.
//

import Foundation

@MainActor
class AuthViewModel: ObservableObject {
  @Published var authUser: User? = nil
  @Published var isAuthenticated = false
  @Published var authUserToken: User.Token? = nil
  @Published var username = ""
  @Published var password = ""
  
  private let authService = AuthService()
  
  init() {
    authService.$isAuthenticated.assign(to: &$isAuthenticated)
  }
  
  private func setAuthenticated() {
      isAuthenticated = true
  }
  func makeCreateAction() -> SignUp.CreateAction {
    return { user in
      let authUserToken = try await AuthService().createAccount(user)
      self.setAuthenticated()
      return
    }
  }
  
  func signIn() {
      Task {
          do {
            authUserToken = try await authService.signIn(User.SignIn(username: username, password: password))
            isAuthenticated = true
          } catch {
              print("[AuthViewModel] Cannot sign in: \(error)")
          }
      }
  }
}

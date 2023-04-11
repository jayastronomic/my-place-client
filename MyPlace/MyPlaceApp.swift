//
//  MyPlaceApp.swift
//  MyPlace
//
//  Created by Julian Smith on 3/8/23.
//

import SwiftUI

@main
struct MyPlaceApp: App {
  @StateObject var authViewModel = AuthViewModel()
  
    var body: some Scene {
        WindowGroup {
          if authViewModel.isAuthenticated {
            Home()
              .environmentObject(authViewModel)
          } else {
            LandingPage()
              .environmentObject(authViewModel)
          }
        }
    }
}

//
//  Home.swift
//  MyPlace
//
//  Created by Julian Smith on 3/24/23.
//

import SwiftUI

struct Home: View {
  var body: some View {
    TabView {
      Posts()
        .tabItem {
          Label("Home", systemImage: "house")
        }
      Text("Search")
        .tabItem {
          Label("Search", systemImage: "magnifyingglass")
        }
      Text("Notifications")
        .tabItem {
          Label("Notifications", systemImage: "bell")
        }
      Text("Messages")
        .tabItem {
          Label("Messages", systemImage: "envelope")
        }
    }
  }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

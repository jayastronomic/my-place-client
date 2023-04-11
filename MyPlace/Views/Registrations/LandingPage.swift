//
//  SignUp.swift
//  MyPlace
//
//  Created by Julian Smith on 3/14/23.
//

import SwiftUI

struct LandingPage: View {
  @EnvironmentObject var authViewModel: AuthViewModel
  var body: some View {
    NavigationView {
      ZStack{
        Color.white.edgesIgnoringSafeArea(.all)
        VStack {
          Image("Bubble-Logo")
            .resizable()
            .frame(width: 400, height: 400)
            .clipped()
          Image("Bubble")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 40)
          VStack {
            SignUpButton(title: "Sign up")
              .environmentObject(authViewModel)
            SignInButton(title: "Sign in")
          }
          .padding()
          Terms()
        }
        .padding()
      }
    }
  }
}

struct SignUpButton: View {
  var title: String
  @EnvironmentObject var authViewModel: AuthViewModel
  
  var body: some View {
    NavigationLink(destination: SignUp(createAction: authViewModel.makeCreateAction())) {
      Text(title)
    }
    .environmentObject(authViewModel)
    .font(.title3)
    .padding()
    .foregroundColor(Color.white)
    .frame(maxWidth: .infinity)
    .background(AppColor.blue)
    .cornerRadius(50)
  }
}

struct SignInButton: View {
  var title: String
  @StateObject var viewModel = UsersViewModel()
  
  var body: some View {
    NavigationLink(destination: SignIn(signInAction: viewModel.makeSignInAction())) {
      Text(title)
    }
    .font(.title3)
    .padding()
    .foregroundColor(AppColor.blue)
    .frame(maxWidth: .infinity)
    .background(Color.white)
    .cornerRadius(50)
    .overlay(
      RoundedRectangle(cornerRadius: 50)
        .stroke(Color.gray, lineWidth: 0.3)
    )
    .shadow(color: Color.black.opacity(0.14), radius: 60, x: 0.0, y: 16)
  }
}

struct Terms: View {
  var body: some View {
    VStack {
      Text("By signing up, you agree to our ") +
      Text("Terms")
        .foregroundColor(Color.blue)
      + Text(", ")
      + Text("Privacy Policy")
        .foregroundColor(Color.blue)
      + Text(", and ")
      + Text("Cookie Use")
        .foregroundColor(Color.blue)
    }
  }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
      LandingPage()
    }
}


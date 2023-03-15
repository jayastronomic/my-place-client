//
//  SignUp.swift
//  MyPlace
//
//  Created by Julian Smith on 3/14/23.
//

import SwiftUI

struct SignUp: View {
  @State private var email = ""
  @State private var username = ""
  @State private var password = ""
  @State private var passwordConfirmation = ""
  
  var body: some View {
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
          LoginButton(title: "Login")
        }
        .padding()
      }
      .padding()
    }
  }
}

struct SignUpButton: View {
  var title: String
  var body: some View {
    Text(title)
      .font(.title3)
      .fontWeight(.bold)
      .padding()
      .foregroundColor(Color.white)
      .frame(maxWidth: .infinity)
      .background(AppColor.blue)
      .cornerRadius(50)
  }
}

struct LoginButton: View {
  var title: String
  var body: some View {
    Text(title)
      .font(.title3)
      .fontWeight(.bold)
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

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}


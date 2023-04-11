//
//  SignUp.swift
//  MyPlace
//
//  Created by Julian Smith on 3/15/23.
//

import SwiftUI

struct SignUp: View {
  
  @Environment(\.dismiss) var dismiss
  @State private var newUser = User.Create(
    username: "",
    email: "",
    password: "",
    confirmPassword: ""
  )
  @EnvironmentObject var authviewModel: AuthViewModel

  typealias CreateAction = (User.Create) async throws -> Any
  let createAction: CreateAction  
  
  private func createUser() {
    Task {
      do {
        let token = try await createAction(newUser)
        print(token)
        authviewModel.isAuthenticated = true
      } catch {
        print("Cannot create user: \(error)")
      }
    }
  }
  
  var body: some View {
    NavigationView {
        Form {
          ZStack {
            VStack {
              HStack {
                Text("Create your account")
                  .font(.title2)
                  .bold()
                Spacer()
              }
              TextField("Email", text: $newUser.email)
                .underlineTextField()
              TextField("Username", text: $newUser.username)
                .underlineTextField()
              SecureField("Password", text: $newUser.password)
                .underlineTextField()
                .textContentType(.oneTimeCode)
              SecureField("Confirm Password", text: $newUser.confirmPassword)
                .underlineTextField()
                .textContentType(.oneTimeCode)
              
              Button(action: {
                createUser()
              }) {
                Text("Create Account")
                  .bold()
                  .padding()
                  .frame(maxWidth: .infinity)
                  .background(AppColor.blue)
                  .foregroundColor(Color.white)
                  .cornerRadius(10)
              }
              Spacer()
            }
            .padding()
          }
        }
        .onSubmit(createUser)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading ) {
            Button {
              dismiss()
            } label: {
              Text("Cancel")
            }
          }
        }
      }
    .navigationBarBackButtonHidden(true)
  }
}

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 16)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(Color.gray)
            .padding(10)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp(createAction: { _ in })
        .environmentObject(AuthViewModel())
    }
}

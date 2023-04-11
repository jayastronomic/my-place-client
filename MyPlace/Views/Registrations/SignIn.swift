//
//  Login.swift
//  MyPlace
//
//  Created by Julian Smith on 3/23/23.
//

import SwiftUI

struct SignIn: View {
  @Environment(\.dismiss) var dismiss
  @StateObject var viewModel = AuthViewModel()
  
  typealias SignInAction = (User.SignIn) async throws -> User
  let signInAction: SignInAction
  
    var body: some View {
      NavigationView {
        Form {
          ZStack {
            VStack {
              HStack {
                Text("Sign in")
                  .font(.title2)
                  .bold()
                Spacer()
              }
              TextField("Username", text: $viewModel.username)
                .underlineTextField()
              SecureField("Password", text: $viewModel.password)
                .underlineTextField()
                .textContentType(.oneTimeCode)
              Button(action: {
                viewModel.signIn()
              }) {
                Text("Sign In")
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

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
      SignIn(signInAction: { _ in
        User()
      })
    }
}

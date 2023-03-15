//
//  NewPostForm.swift
//  MyPlace
//
//  Created by Julian Smith on 3/11/23.
//

import SwiftUI

struct NewPostForm: View {
  @State private var post = Post(content: "")
  typealias CreateAction = (Post) -> Void
  let createAction: CreateAction
  @Environment(\.dismiss) private var dismiss
  
  var body: some View {
    NavigationView {
      Form {
        HStack {
          Image(systemName: "person.circle.fill")
            .font(.system(size: 30))
            .foregroundColor(.gray)
        }
        TextEditor(text: $post.content)
          .frame(width: 200, height: 400)
          .overlay(
            Text(post.content.isEmpty ? "What's on your mind?" : "")
            , alignment: .topLeading
          )
//        Button(action: createPost) {
//            Text("Create Post")
//        }
//        .font(.headline)
//        .frame(maxWidth: .infinity)
//        .foregroundColor(.white)
//        .padding()
//        .listRowBackground(Color.accentColor)
      }
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarLeading) {
          Button("Cancel") {
           dismiss()
          }
        }
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          Button {
            createPost()
          } label: {
            ZStack {
              Color.blue
              Text("Post")
                .padding(.horizontal)
                .padding(4)
                .foregroundColor(.white)
            }
            .cornerRadius(20)
          }
        }
      }
      .navigationTitle("New Post")
    }
  }
  
  private func createPost() {
    createAction(post)
    dismiss()
  }
}

struct NewPostForm_Previews: PreviewProvider {
  static var previews: some View {
    NewPostForm(createAction: { _ in })
  }
}

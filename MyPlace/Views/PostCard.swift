//
//  PostCard.swift
//  MyPlace
//
//  Created by Julian Smith on 3/10/23.
//

import SwiftUI

struct PostCard: View {
  let post: Post
    var body: some View {
      VStack(alignment: .leading, spacing: 10) {
        HStack {
          Text("Julian Smith")
            .font(.subheadline)
            .fontWeight(.medium)
          Spacer()
          Text(post.timestamp.formatted(date: .abbreviated, time: .omitted))
            .font(.caption)
        }
        .foregroundColor(.gray)
        HStack{
          Text("Title")
            .font(.title3)
            .fontWeight(.semibold)
        }
        Text(post.content)
      }
      .padding(.vertical)
    }
}

struct PostCard_Previews: PreviewProvider {
    static var previews: some View {
      PostCard(post: Post.testPost)
    }
}

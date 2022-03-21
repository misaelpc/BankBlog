//
//  BlogAction.swift
//  bankblog
//
//  Created by Misael Pérez Chamorro on 21/03/22.
//

import Foundation
class BlogAction: ActionData {
  func fetchPosts() {
    path = "/posts"
    method = "GET"
  }
  
  func fetchComments() {
    path = "/comments"
    method = "GET"
  }
}

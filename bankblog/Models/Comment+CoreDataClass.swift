//
//  Comment+CoreDataClass.swift
//  bankblog
//
//  Created by Misael Pérez Chamorro on 21/03/22.
//
//

import Foundation
import CoreData


public class Comment: NSManagedObject, Decodable {
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case name = "name"
    case email = "email"
    case body = "body"
    case postId = "postId"
  }
    
  required public convenience init(from decoder: Decoder) throws {
    let context = LocalDataManager.sharedInstance.persistentContainer.viewContext
    self.init(context: context)
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(Int64.self, forKey: CodingKeys.id)
    name = try values.decode(String.self, forKey: CodingKeys.name)
    email = try values.decode(String.self, forKey: CodingKeys.email)
    body = try values.decode(String.self, forKey: CodingKeys.body)
    postId = try values.decode(Int64.self, forKey: CodingKeys.postId)
  }
  
  static let request = BlogRequest.sharedInstance
  
  static func fetch(onSuccess: @escaping () -> Void,
                    onFailure: @escaping () -> Void) {
    let action = BlogAction()
    action.fetchComments()
    request.performAsync(onAction: action, onSuccess: { (responseBody) in
      guard let jsonBody = responseBody as? Data
        else {
          return
      }
      
      do {
        let decoder = JSONDecoder()
        _ = try decoder.decode(CommentList.self, from: jsonBody)
        onSuccess()
      } catch {
          print("JSONSerialization error:", error)
        onFailure()
      }
    }, onFailure: { (_) in
      onFailure()
    })
  }
}

typealias CommentList = [Comment]

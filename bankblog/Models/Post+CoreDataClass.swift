//
//  Post+CoreDataClass.swift
//  bankblog
//
//  Created by Misael Pérez Chamorro on 21/03/22.
//
//

import Foundation
import CoreData


public class Post: NSManagedObject, Decodable {
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case userId = "userId"
    case title = "title"
    case body = "body"
  }
    
  required public convenience init(from decoder: Decoder) throws {
    let context = LocalDataManager.sharedInstance.persistentContainer.viewContext
    self.init(context: context)
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(Int64.self, forKey: CodingKeys.id)
    userId = try values.decode(Int64.self, forKey: CodingKeys.userId)
    title = try values.decode(String.self, forKey: CodingKeys.title)
    body = try values.decode(String.self, forKey: CodingKeys.body)
  }
  
  
  static let request = BlogRequest.sharedInstance
  
  static func fetch(onSuccess: @escaping () -> Void,
                    onFailure: @escaping () -> Void) {
    let action = BlogAction()
    action.fetchPosts()
    request.performAsync(onAction: action, onSuccess: { (responseBody) in
      guard let jsonBody = responseBody as? Data
        else {
          return
      }
      
      do {
        let decoder = JSONDecoder()
        _ = try decoder.decode(PostList.self, from: jsonBody)
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

typealias PostList = [Post]

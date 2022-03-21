//
//  LocalDataManager.swift
//  bankblog
//
//  Created by Misael Pérez Chamorro on 21/03/22.
//

import Foundation
import CoreData

class LocalDataManager {
  static let sharedInstance = LocalDataManager()

  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "bankblog")
    container.loadPersistentStores(completionHandler: { (_, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()

  private init() {}
}

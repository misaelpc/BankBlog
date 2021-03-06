//
//  NSManagedObject+ActiveRecord.swift
//  bankblog
//
//  Created by Misael Pérez Chamorro on 21/03/22.
//

import Foundation
import CoreData

extension NSManagedObject {
  static func create() -> NSManagedObject {
    let localDataManager  = LocalDataManager.sharedInstance
    let context = localDataManager.persistentContainer.viewContext
    return NSEntityDescription.insertNewObject(forEntityName: entityName(), into: context)
  }

  static func entityName() -> String {
    let entityName = NSStringFromClass(self.self)
    return entityName.replacingOccurrences(of: "bankblog.", with: "")
  }

  func save() {
    let localDataManager  = LocalDataManager.sharedInstance
    let context = localDataManager.persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
  
  static func deleteAll() -> [NSManagedObject] {
    let request = NSFetchRequest<NSFetchRequestResult>()
    let localDataManager  = LocalDataManager.sharedInstance
    let context = localDataManager.persistentContainer.viewContext
    request.entity = NSEntityDescription.entity(forEntityName: entityName(), in: context)
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
    do {
      try context.execute(deleteRequest)
      return []
    } catch {
      NSLog("Unable to fetch local information")
      return []
    }
  }
  
  static func resultsController() -> NSFetchedResultsController<NSFetchRequestResult> {
    let localDataManager  = LocalDataManager.sharedInstance
    let context = localDataManager.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>()
    request.entity = NSEntityDescription.entity(forEntityName: entityName(), in: context)
    request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
    
    let controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
    do {
      try controller.performFetch()
      return controller
    } catch {
      fatalError("Failed to fetch entities: \(error)")
    }
  }
  
  static func resultsController(post: Post) -> NSFetchedResultsController<NSFetchRequestResult> {
    let localDataManager  = LocalDataManager.sharedInstance
    let context = localDataManager.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>()
    request.entity = NSEntityDescription.entity(forEntityName: entityName(), in: context)
    request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
    request.predicate = NSPredicate(format: "postId == %d", post.id)
    let controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
    do {
      try controller.performFetch()
      return controller
    } catch {
      fatalError("Failed to fetch entities: \(error)")
    }
  }
}

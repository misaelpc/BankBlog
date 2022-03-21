//
//  PostViewController+DataSource.swift
//  bankblog
//
//  Created by Misael Pérez Chamorro on 21/03/22.
//

import Foundation
import UIKit
import CoreData

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let sections = self.resulsController?.sections else {
        fatalError("No sections in fetchedResultsController")
    }
    let sectionInfo = sections[section]
    return sectionInfo.numberOfObjects
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let post = self.resulsController?.object(at: indexPath) as? Post else {
        fatalError("Attempt to configure cell without a managed object")
    }
    let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell",
    for: indexPath) as? PostTableViewCell
    cell?.bindWithPost(post: post)
    return cell!
  }
}

extension PostViewController: NSFetchedResultsControllerDelegate {
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    tableView.reloadData()
  }
}

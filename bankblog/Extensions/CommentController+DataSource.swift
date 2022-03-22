//
//  CommentController+DataSource.swift
//  bankblog
//
//  Created by Misael Pérez Chamorro on 21/03/22.
//

import Foundation
import CoreData
import UIKit

extension CommentViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let sections = self.resulsController?.sections else {
        fatalError("No sections in fetchedResultsController")
    }
    let sectionInfo = sections[section]
    return sectionInfo.numberOfObjects
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let comment = self.resulsController?.object(at: indexPath) as? Comment else {
        fatalError("Attempt to configure cell without a managed object")
    }
    let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell",
    for: indexPath) as? CommentTableViewCell
    cell?.bindWithComment(comment: comment)
    return cell!
  }
}

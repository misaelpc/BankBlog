//
//  CommentTableViewController.swift
//  bankblog
//
//  Created by Misael Pérez Chamorro on 21/03/22.
//

import UIKit
import CoreData

class CommentViewController: UIViewController {
  var post: Post!
  var resulsController: NSFetchedResultsController<NSFetchRequestResult>?
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var postitleLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateData()
    setupTableView()
    setupPostDetail()
  }
  
  func updateData() {
    resulsController = Comment.resultsController(post: post)
    do {
      _ = try resulsController?.performFetch()
    } catch {
        print("Comments fetch error:", error)
    }
  }
  
  func setupPostDetail() {
    guard let count = resulsController?.fetchedObjects?.count else {
      return
    }
    self.title = "\(count) comments"
    self.postitleLabel.text = post.title
  }
  
  func setupTableView() {
    self.tableView.register(UINib(nibName: "CommentTableViewCell",
                                bundle: nil), forCellReuseIdentifier: "CommentTableViewCell")
  }
 

}

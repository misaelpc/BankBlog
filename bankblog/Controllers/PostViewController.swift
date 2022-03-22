//
//  ViewController.swift
//  bankblog
//
//  Created by Misael Pérez Chamorro on 18/03/22.
//

import UIKit
import CoreData

class PostViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  private let refreshControl = UIRefreshControl()
  var resulsController: NSFetchedResultsController<NSFetchRequestResult>?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    updateData()
    // Do any additional setup after loading the view.
  }
  
  func updateData() {
    resulsController = Post.resultsController()
    resulsController?.delegate = self
    Post.fetch {
      Comment.fetch {
      } onFailure: {
      }
    } onFailure: {
    }
  }

  func setupTableView() {
    tableView.refreshControl = refreshControl
    refreshControl.addTarget(self, action: #selector(refreshPostData(_:)), for: .valueChanged)
    self.tableView.register(UINib(nibName: "PostTableViewCell",
                                bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
  }
  
  @objc private func refreshPostData(_ sender: Any) {
    Post.fetch {
      self.refreshControl.endRefreshing()
    } onFailure: {
      
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let memberController = segue.destination as? CommentViewController {
      memberController.post = sender as? Post
    }
  }
}


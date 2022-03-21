//
//  PostTableViewCell.swift
//  bankblog
//
//  Created by Misael Pérez Chamorro on 21/03/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {
  @IBOutlet weak var titleTextView: UITextView!
  @IBOutlet weak var bodyTextView: UITextView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
  
  func bindWithPost(post: Post) {
    titleTextView.text = post.title?.capitalized
    bodyTextView.text = post.body
  }
    
}

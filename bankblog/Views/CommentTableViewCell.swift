//
//  CommentTableViewCell.swift
//  bankblog
//
//  Created by Misael Pérez Chamorro on 21/03/22.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var commentTextView: UITextView!
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
  
  func bindWithComment(comment: Comment) {
    nameLabel.text = comment.name
    emailLabel.text = comment.email
    commentTextView.text = comment.body
  }
    
}

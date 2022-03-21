//
//  Comment+CoreDataProperties.swift
//  bankblog
//
//  Created by Misael Pérez Chamorro on 21/03/22.
//
//

import Foundation
import CoreData


extension Comment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comment> {
        return NSFetchRequest<Comment>(entityName: "Comment")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int64
    @NSManaged public var email: String?
    @NSManaged public var body: String?
    @NSManaged public var post: Post?

}

extension Comment : Identifiable {

}

//
//  bankblogTests.swift
//  bankblogTests
//
//  Created by Misael Pérez Chamorro on 18/03/22.
//

import XCTest
@testable import bankblog

class bankblogTests: XCTestCase {
  override func setUp() {
    super.setUp()
  }
  
  override func setUpWithError() throws {
      // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDownWithError() throws {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testAddPost() {
    let post = Post.create() as? Post
    post?.id = 1
    post?.save()
    XCTAssertNotNil(post, "Post should not be nil")
  }
  
  func testAddPostWithComments() {
    let post = Post.create() as? Post
    post?.id = 2
    let comment = Comment.create() as? Comment
    comment?.id = 2
    post?.comments = [comment!]
    post?.save()
    XCTAssertNotNil(post?.comments, "Post comments should not be nil")
  }

  func testPerformanceExample() throws {
      // This is an example of a performance test case.
      self.measure {
          // Put the code you want to measure the time of here.
      }
  }
  
  override func tearDown() {
    super.tearDown()
    //_ = Posts.deleteAll()
  }
}

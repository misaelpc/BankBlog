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
  func testPostCommentsParsing() {
    let data = """
    [{
      "postId": 1,
      "id": 1,
      "name": "id labore ex et quam laborum",
      "email": "Eliseo@gardner.biz",
      "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
    }]
    """.replacingOccurrences(of: "\n", with: "").data(using: .utf8)!
    let decoder = JSONDecoder()
    let commentsList = try? decoder.decode(CommentList.self, from: data)
    XCTAssertNotNil(commentsList, "Comments should not be nil")
  }
  
  func testPostDataParsing() {
    let data = """
    [{
      "userId": 1,
      "id": 1,
      "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    }]
    """.replacingOccurrences(of: "\n", with: "").data(using: .utf8)! 
    let decoder = JSONDecoder()
    let postList = try? decoder.decode(PostList.self, from: data)
    XCTAssertNotNil(postList, "Post comments should not be nil")
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

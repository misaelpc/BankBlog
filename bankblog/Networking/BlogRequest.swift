//
//  BlogRequest.swift
//  bankblog
//
//  Created by Misael Pérez Chamorro on 21/03/22.
//

import Foundation
import Alamofire

class BlogRequest {
  let serverURL = "https://jsonplaceholder.typicode.com"
  static let sharedInstance = BlogRequest()
  
  var onSuccessResponse:(_ success: Any) -> Void = {_ in }
  var onFailureResponse:(_ error: String) -> Void = {_ in }

  func performAsync(onAction: ActionData, onSuccess: @escaping (Any) -> Void,
                    onFailure: @escaping (_ error: String) -> Void) {
    onSuccessResponse = onSuccess
    onFailureResponse = onFailure
    var request: DataRequest!
    
    request = AF.request(getFullPath(actionPath: onAction.path),
                          method: getMethod(actionMethod: onAction.method),
                          parameters: onAction.body)
    
    request.responseData { response in
        switch response.result {
        case .success(let jsonResponse):
          onSuccess(jsonResponse)
        case .failure(let error):
          onFailure("\(error)")
        }
    }
  }
  
  func getFullPath(actionPath: String) -> String {
    return serverURL + actionPath
  }
  
  func getMethod(actionMethod: String) -> HTTPMethod {
    switch actionMethod {
    case "POST":
      return HTTPMethod.post
    case "PUT":
      return HTTPMethod.put
    case "PATCH":
      return HTTPMethod.patch
    case "DELETE":
      return HTTPMethod.delete
    default:
      return HTTPMethod.get
    }
  }
}

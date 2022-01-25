//
//  ApiNetwork.swift
//  FatchData
//
//  Created by Chetu on 22/01/22.
//  Copyright © 2022 Chetu. All rights reserved.
//

import Foundation
class ApiNetwork
{
  
  static var shareInstance = ApiNetwork()
  
  func CallDataFormServer(urlStrings : String , complitionHandlar : @escaping(_ result_Data : Array <Any>) -> Void)
  {
    var  c_url = URL(string : urlStrings)
    
    URLSession.shared.dataTask(with : c_url! ){ (result, response, error) in
      var  dataresponse = [[String : Any]] ()
      
      
      do{
        
        
        
        let json = try JSONSerialization.jsonObject(with: result!, options: [])
        let json_conv = json as! [String : Any]
        dataresponse = json_conv["results"] as! [[String : Any]]
        
        complitionHandlar(dataresponse)
      }
        
        
      catch{
        print(error.localizedDescription)
      }
    }.resume()
  }
}

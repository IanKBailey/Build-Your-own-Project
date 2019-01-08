//
//  APIClient.swift
//  PathOfExileLadder
//
//  Created by Ian Bailey on 12/28/18.
//  Copyright © 2018 Ian Bailey. All rights reserved.
//

import Foundation
final class UserAPIClient {

    static func loadData(completionHandler: @escaping ((AppError?,[POELadder]?) -> Void)) {
        
 let url = "https://api.pathofexile.com/ladders/SSF+Betrayal+HC?offset=0&limit=100"
        NetworkHelper.performDataTask(urlString: url, httpMethod: "Get") { (error, data, response) in
            if let error = error {
                completionHandler(error,nil)
            }
                if let data = data {
                    do {
                        let ladderInfo = try JSONDecoder().decode(LadderData.self, from: data)
                        completionHandler(nil, ladderInfo.entries)
                        
                    } catch {
                        completionHandler(AppError.decodingError(error), nil)
                }
            }
        }
    }
}
    

    
    
    
    
    
    



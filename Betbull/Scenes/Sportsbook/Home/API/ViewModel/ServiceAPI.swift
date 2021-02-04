//
//  ServiceAPI.swift
//  Betbull
//
//  Created by AryaOmnitalk MDA on 31/01/21.
//  Copyright © 2021 Betbull. All rights reserved.
//

import UIKit
import Foundation


/****************************************************/
  /*  Function that will call API and stored reposnse in
      Tournamnt Model using MVVM architecture */
  /****************************************************/

class ServiceAPI {
    
    weak var vc : SportsbookHomeScene?
    
    var allTournamentData = [Tournament]()
     
    func getAllDataFromURL(){
        
        let urlString = "https://run.mocky.io/v3/38bc099e-1170-45ce-ab53-200d10e1522b"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print("Loading data error: \(err.localizedDescription)")
            }else{
                guard let data  = data else { return }
                do {
                    let results = try JSONDecoder().decode([Tournament].self, from: data)
                    self.allTournamentData.append(contentsOf: results)
                    DispatchQueue.main.async {
                        self.vc?.tblView.reloadData()
                    }
                } catch let jsonError {
                    print("Json error : \(jsonError.localizedDescription)")
                }
            }
        }.resume()
    }
}

/****************************************************/
/****************************************************/

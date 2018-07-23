//
//  JSONFromSiteVC.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 7/13/18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class JSONFromSiteVC: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: /*"https://api.letsbuildthatapp.com/jsondecodable/course"*/"https://app.riabinin.net") else {print("ops"); return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else {return}
            guard let dataAsString = String(data: data, encoding: .utf8) else{return}
            print(dataAsString)
          

            }.resume()


   

}
}

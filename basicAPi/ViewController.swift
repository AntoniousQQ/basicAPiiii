//
//  ViewController.swift
//  basicAPi
//
//  Created by Admin on 27.09.22.
//

import UIKit

class ViewController: UIViewController {
    
    var test = " test variable"
    var test2 = " test variable"
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        request()
    }
    let referense = "https://api.nasa.gov/planetary/apod?api_key=8HPmuKQ5fOzg1m5AITtBHNKObE4GXmZphrDYNGoC"
    private func request() {
        guard let url = URL(string:referense) else { return}
        URLSession.shared.dataTask(with: url) { date, response, error in
            
            if let error = error {
                print( error)
                return
            }
            
            guard let date = date else { return }
            let nasa = String(data: date, encoding: .utf8)
            print(nasa)
        } .resume()
       
        }
   
    }



    


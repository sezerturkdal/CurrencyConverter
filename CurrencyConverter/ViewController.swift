//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Sezer on 23.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCAD: UILabel!
    @IBOutlet weak var lblCHF: UILabel!
    @IBOutlet weak var lblGBP: UILabel!
    @IBOutlet weak var lblJPY: UILabel!
    @IBOutlet weak var lblNOK: UILabel!
    @IBOutlet weak var lblUSD: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let accessKey = "test"
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=" + accessKey)
        let session = URLSession.shared
        
        //Closure
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil{
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else{
                if data != nil{
                    do{
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        
                        DispatchQueue.main.async {
                            print(jsonResponse )
                        }
                        
                    }catch{
                        print("Error!")
                    }
                }
            }
        }
        task.resume()
        
    }


}


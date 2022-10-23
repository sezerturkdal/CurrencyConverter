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
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,Any>
                        
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String:Any]{
                                if let cad = rates["CAD"] as? Double{
                                    self.lblCAD.text = "CAD : \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double{
                                    self.lblCHF.text = "CHF : \(chf)"
                                }
                                if let gbp = rates["GBP"] as? Double{
                                    self.lblGBP.text = "GBP : \(gbp)"
                                }
                                if let jpy = rates["JPY"] as? Double{
                                    self.lblJPY.text = "JPY : \(jpy)"
                                }
                                if let nok = rates["NOK"] as? Double{
                                    self.lblNOK.text = "NOK : \(nok)"
                                }
                                if let usd = rates["USD"] as? Double{
                                    self.lblUSD.text = "USD : \(usd)"
                                }
                            }
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


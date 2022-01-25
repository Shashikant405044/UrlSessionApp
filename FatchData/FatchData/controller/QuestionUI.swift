//
//  QuestionUI.swift
//  FatchData
//
//  Created by Chetu on 22/01/22.
//  Copyright © 2022 Chetu. All rights reserved.
//

import UIKit

class QuestionUI: UIViewController {
  
  var apimodal = [ApiModel] ()
  
  var count = 0
  
  @IBOutlet weak var opt4: UIButton!
  @IBOutlet weak var c_opt1: UIButton!
  @IBOutlet weak var btnNext: UIButton!
  @IBOutlet weak var question_ui: UILabel!
  @IBOutlet weak var opt3: UIButton!
  @IBOutlet weak var opt2: UIButton!
  
  @IBOutlet weak var category_lbl: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
btnNext.addTarget(self, action: #selector(pressedNextBtn), for: .touchUpInside)
    
       callData()
    
  }
  
  

  
  @objc func pressedNextBtn()
  {
  
//    if count < apimodal.count{
        count += 1
//
     callData()
//
//    }
//    else{ if count == apimodal.count
//      {
//        let vc = self.storyboard?.instantiateViewController(identifier: "ResultUI") as! ResultUI
//        self.navigationController?.pushViewController(vc, animated: true)
//
//        }
//    }
    
  }
  
  
  @IBAction func checkAnswerButtonTapped(_ sender: UIButton) {
     
    if sender.tag == 0
    {
       
      category_lbl.text = "correct Answer"
    
      sender.tintColor = UIColor.green
     
    }
      
    else if sender.tag == 1 {
     
       category_lbl.text = "wrong Answer "
      
    }
    
    else if sender.tag == 2 {
     
       category_lbl.text = "wrong Answer "
      
    }
    
    else{
      
      category_lbl.text = "wrong Answer "
    }
     
    
  }
  
  
  
  
  func callData() {
    ApiNetwork.shareInstance.CallDataFormServer(urlStrings: urlString) { (result) in
      
      for valIndex in result{
        self.apimodal.append(ApiModel(result: valIndex as! [String : Any]))
    
        
      }
      getAndPrint()
    }
    
  
    func getAndPrint(){
      let values = apimodal.self[count]
      
      let wrongAns = values.result[wrong_answer] as! Array<Any>
      
      
      DispatchQueue.main.async {
       // self.category_lbl.text = values.result["category"] as? String
        
        self.question_ui.text  = values.result[question] as? String
        self.c_opt1.setTitle(values.result[correct_answer] as? String, for: .normal)
     
        self.opt4.setTitle(wrongAns[0] as? String, for: .normal)
        self.opt2.setTitle(wrongAns[1] as? String, for: .normal)
        self.opt3.setTitle(wrongAns[2] as? String, for: .normal)
        
      }
      
    }
    
  }
  
}



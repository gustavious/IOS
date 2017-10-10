//
//  ExamsViewController.swift
//  com.moviles.psychoapp
//
//  Created by macuser on 10/8/17.
//  Copyright © 2017 Gustavo Adolfo Alegria Zu±iga. All rights reserved.
//

import UIKit
import Firebase

class ExamsViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var ExamsTable: UITableView!
    
    var ref: DatabaseReference!
    
    
    var exams:[Exam] = [Exam]()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        ExamsTable.delegate = self
        ExamsTable.dataSource = self
        
        
        
     
        
        

        // Do any additional setup after loading the view.
        let userID = Auth.auth().currentUser?.uid
        
        print ("el id del ususario es " + userID!)
        
        
        ref.child("candidates").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            
            let value = snapshot.value as! NSDictionary
            let exams = value["exams"] as! NSDictionary
            
            
            for item in exams {
                
                var dict = [String : AnyObject]()
                var values = item.value as! Dictionary<String, AnyObject>
                
                dict["id"] = item.key as AnyObject?
                dict["date"] = values["date"]
                dict["employer"] = values["employer"]
                dict["maxScore"] = values["maxScore"]
                dict["name"] = values["name"]
                dict["score"] = values["score"]
                dict["time"] = values["time"]
                
                self.ref.child("exams").child(item.key as! String).observeSingleEvent(of: .value, with: { (snapshot) in
                    
                    let params = snapshot.value as! Dictionary<String, AnyObject>
                
                    
                    dict["company"] = params["company"]
                    dict["description"] = params["description"]
                    dict["title"] = params["title"]
                    dict["user"] = params["user"]
                    dict["username"] = params["username"]
                    dict["tests"] = params["tests"]
                    
                    
                    let exam : Exam = Exam(dict)
                    self.exams.append( exam )
                    self.ExamsTable.reloadData()
                    
                    
                    
                    self.ref.child("exams").child(exam.id!).observeSingleEvent(of: .value, with: { (snapshot) in
                        
                        let value = snapshot.value as! NSDictionary
                        let tests = value["tests"] as! NSDictionary
                        
                        
                        for item in tests {
                            
                            var dict = [String : AnyObject]()
                            var values = item.value as! Dictionary<String, AnyObject>
                            
                            dict["id"] = item.key as AnyObject?
                            dict["maxValue"] = values["time"]
                            dict["weight"] = values["weight"]
                            
                            
                            
                            self.ref.child("tests").child(item.key as! String).observeSingleEvent(of: .value, with: { (snapshot) in
                                
                                let params = snapshot.value as! Dictionary<String, AnyObject>
                                
                                
                                dict["testDescription"] = params["description"]
                                dict["instructions"] = params["instructions"]
                                dict["name"] = params["name"]
                                dict["privateId"] = params["privateId"]
                                
                                
                                let test : Test = Test(dict)
                                exam.testList.append(test)
                                
                            }) { (error) in
                                print(error.localizedDescription)
                            }
                            
                            
                        }
                        
                        // ...
                    }) { (error) in
                        print(error.localizedDescription)
                    }
                    
                    

                    // ...
                }) { (error) in
                    print(error.localizedDescription)
                }

            
           
            }
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath)
        
        let currentExam: Exam = exams[indexPath.row]
        
        let labelName: UILabel = cell.viewWithTag(1) as! UILabel
        labelName.text = currentExam.title!
        
        let labelCompany: UILabel = cell.viewWithTag(2) as! UILabel
        labelCompany.text = currentExam.company!
        
 
        
        let labelDescription: UILabel = cell.viewWithTag(4) as! UILabel
        labelDescription.text = currentExam.testDescription!
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Clickea una celda")
        let selectedExam: Exam = exams[indexPath.row]
        
        self.performSegue(withIdentifier: "ShowExamView", sender: selectedExam)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowExamView"{
            
            let viewController: ExamViewController = segue.destination as! ExamViewController
            viewController.exam = sender as! Exam
            
            
        }
    }
    
    
   
        
        
        
    
        
        
    
    
    
}
    
    
    
  


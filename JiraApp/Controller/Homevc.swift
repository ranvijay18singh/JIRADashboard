//
//  Homevc.swift
//  JiraApp
//
//  Created by ranjansahu on 17/07/17.
//  Copyright © 2017 Ranvijay. All rights reserved.
//

import UIKit

class Homevc: BaseViewController,UITableViewDataSource, UITableViewDelegate {

    /**
     *  Array containing menu options
     */
    var arraySprintOptions = [Dictionary<String,String>]()
    
    /**
     *  Array to display menu options
     */
    @IBOutlet var tblProjectProgress : UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()

        print(currentReachabilityStatus == .notReachable)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = "ProgressView"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func updateDetails(selectedProject:String)  {
//         self.title = selectedProject
//    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateArrayMenuOptions()
      
        
    }
    func updateArrayMenuOptions(){
        arraySprintOptions.removeAll()
        arraySprintOptions.append(["title":"Sprint1", "progress":"90%"])
        arraySprintOptions.append(["title":"Sprint2", "progress":"70%"])
        arraySprintOptions.append(["title":"Sprint3", "progress":"40%"])
        arraySprintOptions.append(["title":"Sprint4", "progress":"50%"])
        
        
        tblProjectProgress.reloadData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellSprint")!
        
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.backgroundColor = UIColor.clear//Utility.colorFromHex(hex: "#00529c")
        
        let lblTitle : UILabel = cell.contentView.viewWithTag(100) as! UILabel
        let lblProgress : UILabel = cell.contentView.viewWithTag(101) as! UILabel
        
        lblProgress.text = arraySprintOptions[indexPath.row]["progress"]!
        lblTitle.text = arraySprintOptions[indexPath.row]["title"]!
        lblTitle.textColor = UIColor.white
        lblProgress.textColor = UIColor.white
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     self.goToProject()
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraySprintOptions.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func goToProject(){
        Utility.hideActivityIndicator()
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let projectVcObj = storyBoard.instantiateViewController(withIdentifier: "ProjectsVC") as! ProjectsVC
        self.navigationController?.pushViewController(projectVcObj, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  SQLiteDeleteMe
//
//  Created by Fabio De Lorenzo on 12/31/15.
//  Copyright © 2015 Fabio De Lorenzo. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print ("viewDidLoad")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction
    func dbCreate(sender: AnyObject) {
        print ("click create")
        let sql = SqlFile()
        sql.create()
    }
    
    @IBAction
    func dbInsert(sender: AnyObject) {
        print ("click dbInsert")
        let sql = SqlFile()
        sql.insert()
    }
    
    @IBAction
    func findRecord(sender: AnyObject) {
        print ("click findRecord")
        let sql = SqlFile()
        sql.findAlice()
    }


}


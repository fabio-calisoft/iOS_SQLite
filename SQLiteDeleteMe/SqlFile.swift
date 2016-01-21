//
//  SqlFile.swift
//  SQLiteDeleteMe
//
//  Created by Fabio De Lorenzo on 12/31/15.
//  Copyright © 2015 Fabio De Lorenzo. All rights reserved.
//

import Foundation
import SQLite

class SqlFile {
    
    static var index = 0
    let users = Table("users")
    let id = Expression<Int64>("id")
    let email = Expression<String>("email")
    let name = Expression<String?>("name")
    let path = NSSearchPathForDirectoriesInDomains(
        .DocumentDirectory, .UserDomainMask, true
        ).first!
    
    
    func SqlFile() {
        print ("nothing todo in the contructor")
    }
    
    func create() {
        print ("create")
        
        
        
        let db = try! Connection("\(path)/db.sqlite3")
        
        db.trace { print($0) }
        
        
        try! db.run(users.create { t in
            t.column(id, primaryKey: true)
            t.column(email, unique: true, check: email.like("%@%"))
            t.column(name)
            })
        print ("createD")
        
    }
    
    
    func insert() {
        let i = self.dynamicType.index++
        print ("insert index:\(i)")
        let db = try! Connection("\(path)/db.sqlite3")
        let mEmail = "xxfabio_" + String(i) + "@crokky.com"
        let mName = "XXFabio" + String(i)
        let rowid = try! db.run(users.insert(email <- mEmail, name <- mName) )
        print ("value insertED with row id=\(rowid)")
    }
    
    
    func findAlice() {
        print ("findAlice")
        let db = try! Connection("\(path)/db.sqlite3")
        
        for user in db.prepare(users) {
            print("id: \(user[id]), email: \(user[email])")
        }
        /*
        let alice = users.filter(name == "Alice")
        let emails = VirtualTable("emails")
        
        let subject = Expression<String?>("subject")
        let body = Expression<String?>("body")
        
        try! db.run(emails.create(.FTS4(subject, body)))
        
        try! db.run(emails.insert(
        subject <- "Hello, world!",
        body <- "This is a hello world message."
        ))
        
        let row = db.pluck(emails.match("hello"))
        
        let query = db.prepare(emails.match("hello"))
        for row in query {
        print(row[subject])
        }
        */
    }
    
    
    
}
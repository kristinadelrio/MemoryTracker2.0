//
//  WinnerData.swift
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 11/1/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

import Foundation

@objc class WinnerData: NSObject, NSCoding, Comparable {
    
    let username: String
    let score: Int
    let winDate: Date
    
    override init() {
        username = "Unknown"
        score = 0
        winDate = Date()
    }
    
    init(user: String, score: Int) {
        self.username = user
        self.score = score
        winDate = Date()
    }
    
    required init?(coder aDecoder: NSCoder) {
        username = aDecoder.decodeObject(forKey: "username") as? String ?? ""
        score = aDecoder.decodeInteger(forKey: "score")
        winDate = aDecoder.decodeObject(forKey: "date") as? Date ?? Date()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(username, forKey: "username")
        aCoder.encode(score, forKey: "score")
        aCoder.encode(winDate, forKey: "date")
    }
    
    static func < (lhs: WinnerData, rhs: WinnerData) -> Bool {
        return lhs.score < rhs.score
    }
    
    static func == (lhs: WinnerData, rhs: WinnerData) -> Bool {
        return lhs.score == rhs.score
    }
}



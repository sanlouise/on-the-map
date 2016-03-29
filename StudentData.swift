//
//  StudentData.swift
//  On The Map
//
//  Created by Sandra Adams-Hallie on Mar/29/16.
//  Copyright © 2016 Sandra Adams-Hallie. All rights reserved.
//

import UIKit
import Foundation

struct StudentInformation {
    
    var First: String!
    var Last: String!
    var MediaUrl: String!
    
    var GEODescriptor: String!
    var Longitude: Double!
    var Latitude: Double!
    
    
    var ObjectID: String!
    var UniqueKey: String!
    var UpdateTime: String!
    
    init(studentLocationDictionary: [String : AnyObject]) {
        /* Initialize data from studentLocationDictionary */
        First = studentLocationDictionary[ParseClient.JSONResponseKeys.FirstName] as! String
        Last = studentLocationDictionary[ParseClient.JSONResponseKeys.LastName] as! String
        MediaUrl = studentLocationDictionary[ParseClient.JSONResponseKeys.MediaURL] as! String
        
        GEODescriptor = studentLocationDictionary[ParseClient.JSONResponseKeys.GEODescriptor] as! String
        Longitude = studentLocationDictionary[ParseClient.JSONResponseKeys.Longitude] as! Double
        Latitude = studentLocationDictionary[ParseClient.JSONResponseKeys.Latitude] as! Double
        
        
        ObjectID = studentLocationDictionary[ParseClient.JSONResponseKeys.ObjectID] as! String
        UniqueKey = studentLocationDictionary[ParseClient.JSONResponseKeys.UniqueKey] as! String
        
        
        let UpdateTimeString = studentLocationDictionary[ParseClient.JSONResponseKeys.UpdateTime] as! String
        let index = UpdateTimeString.characters.indexOf("T")
        UpdateTime = UpdateTimeString.substringToIndex(index!)
        
    }
    
    /* Create an array of student location data from results returned by ParseClient */
    static func generateLocationDataFromResults(results: [[String : AnyObject]]) -> [StudentInformation] {
        var locationDataArray = [StudentInformation]()
        
        for result in results {
            
            locationDataArray.append(StudentInformation(studentLocationDictionary: result))
            
        }
        /* Will sort location data to be most recent first, just in case the results are returned out of order. */
        //        locationDataArray.sortInPlace({
        //            $0.UpdateTime > $1.UpdateTime
        //        })
        return locationDataArray
    }
    
}

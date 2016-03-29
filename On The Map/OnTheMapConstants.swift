//
//  OnTheMapConstants.swift
//  On The Map
//
//  Created by Sandra Adams-Hallie on Mar/29/16.
//  Copyright © 2016 Sandra Adams-Hallie. All rights reserved.
//

import Foundation

// Inspired by github.com/RyanCCollins/On-the-Map

// Helpers to get a_synchronous queues
var GlobalMainQueue: dispatch_queue_t {
    return dispatch_get_main_queue()
}

var GlobalUserInteractiveQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_USER_INTERACTIVE.rawValue), 0)
}

var GlobalUserInitiatedQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)
}

var GlobalUtilityQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_UTILITY.rawValue), 0)
}

var GlobalBackgroundQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_BACKGROUND.rawValue), 0)
}


// Display global errors
struct GlobalErrors : ErrorType {
    
    static let LogoutError = Errors.constructError(domain: "Global", userMessage: "An error occured while trying to logout.")
    static let GenericNetworkError = Errors.constructError(domain: "Global", userMessage:  "An error occured while getting data from the network.")
    static let GenericError = Errors.constructError(domain: "Global", userMessage:  "An error occured.  Please try again.")
    static let MissingData = Errors.constructError(domain: "Global", userMessage:  "Missing something.  Please make sure all text fields are filled out appropriately.")
    static let InvalidURL = Errors.constructError(domain: "Global", userMessage:  "The link is not valid.  Please try again.")
    static let GEOCode = Errors.constructError(domain: "Global", userMessage:  "Could not geocode your location.  Enter a more specific location and try again.")
    static let BadCredentials = Errors.constructError(domain: "Global", userMessage:  "Please enter a valid email address and password.")
    static let LogOut = Errors.constructError(domain: "Global", userMessage:  "Failed to logout of session.  Please try again.")
    
}

// Display errors within domain of Parse Client
struct ErrorMessage {
    
    static let JSONSerialization =  "An error occured when sending data to the network."
    static let Parse =  "An error occured while getting data from the network."
    
    struct Status {
        static let Auth = "The network returned an invalid response.  Please re-enter your credentials and try again."
        static let InvalidResponse = "Unable to log you in due to an invalid response from the server.  Please make sure your username and password are correct and try again."
        static let Network = "Could not connect to the network.  Please try again."
    }
}

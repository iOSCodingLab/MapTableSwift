//
//  Place.swift
//  MapTableSwift
//
//  Created by Ricardo Reyes on 7/12/14.
//  Copyright (c) 2014 iOS Coding Lab. All rights reserved.
//

import UIKit

class Place: NSObject
{
    var name: String
    var address: String
    
    init(name: String, address: String)
    {
        self.name = name
        self.address = address
    }
}

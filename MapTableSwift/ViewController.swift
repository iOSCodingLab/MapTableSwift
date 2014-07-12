//
//  ViewController.swift
//  MapTableSwift
//
//  Created by Ricardo Reyes on 7/12/14.
//  Copyright (c) 2014 iOS Coding Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource
{
    @IBOutlet var tableView : UITableView
    
    var plist: NSArray = []
    var places: NSMutableArray = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("Places", ofType: "plist")
        plist = NSArray(contentsOfFile: path)
        
        for i in 0..plist.count
        {
            let dictionary = plist[i] as NSDictionary
            
            let place = Place(name: dictionary["name"] as String, address: dictionary["address"] as String)
            
            places.addObject(place)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return places.count
    }
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let place = places[indexPath.row] as Place
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        cell.textLabel.text = place.name
        cell.detailTextLabel.text = place.address
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
    {
        if(segue.identifier == "MapSegue")
        {
            let indexPath = tableView.indexPathForSelectedRow()
            let place = places[indexPath.row] as Place
            
            let vc = segue.destinationViewController as MapViewController
            vc.name = place.name
            vc.address = place.address
        }
    }
}


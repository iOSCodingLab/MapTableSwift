//
//  MapViewController.swift
//  MapTableSwift
//
//  Created by Ricardo Reyes on 7/12/14.
//  Copyright (c) 2014 iOS Coding Lab. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {

    var name: String = ""
    var address: String = ""
    
    @IBOutlet var mapView : MKMapView
    
    let geocoder = CLGeocoder()

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    init(coder aDecoder: NSCoder!)
    {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks: AnyObject[]!, error: NSError!) in
            
                let placemark = placemarks[0] as CLPlacemark
            
                let annotation = MKPointAnnotation()
                annotation.title = self.name
                annotation.subtitle = self.address
                annotation.coordinate = placemark.location.coordinate
            
                self.mapView.addAnnotation(annotation)
            
                let region = MKCoordinateRegionMakeWithDistance(placemark.location.coordinate, 500, 500)
                self.mapView.region = region
            })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView!
    {
        var pin = mapView.dequeueReusableAnnotationViewWithIdentifier("Pin") as? MKPinAnnotationView
        
        if pin == nil
        {
            pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
            pin!.pinColor = .Red
        }
        else
        {
            pin!.annotation = annotation
        }
        
        return pin
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}

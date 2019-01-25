//
//  ViewController.swift
//  CustomPlacePicker
//
//  Created by lamha on 1/21/19.
//  Copyright © 2019 lamha. All rights reserved.
//

import UIKit
import GooglePlaces

class ViewController: UIViewController {
    @IBOutlet weak var testView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        let autocompleteController = Utils.getViewController(from: "EditProfile", viewControllerId: "test_lamah") as! GMSAutocompleteViewController
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let autocompleteController = storyboard.instantiateViewController(withIdentifier: "CustomGooglePicker") as! GMSAutocompleteViewController
        
        autocompleteController.delegate = self
        let addressFilter = GMSAutocompleteFilter()
        addressFilter.type = .address
        autocompleteController.autocompleteFilter = addressFilter
        autocompleteController.view.frame = testView.bounds
        autocompleteController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        autocompleteController.willMove(toParent: self)
        testView.addSubview(autocompleteController.view)
        addChild(autocompleteController)
        autocompleteController.didMove(toParent: self)
    }


}

extension ViewController: GMSAutocompleteViewControllerDelegate {
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        //        Print place info to the console.
        print("Place name: \(place.name)")
        print("Place address: \(place.formattedAddress ?? "")")
        print("Place attributions: \(place.attributions ?? NSAttributedString(string: ""))")
        
        
        
        // Close the autocomplete widget.
        self.dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Show the network activity indicator.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    // Hide the network activity indicator.
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}



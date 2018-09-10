//
//  ViewController.swift
//  NibbleList
//
//  Created by Herman Kwan on 1/16/18.
//  Copyright © 2018 Herman Kwan. All rights reserved.
//

import UIKit

var foodList = [FoodItems]()
var currentFoodList = [FoodItems]()
var emptyList = [FoodItems(title: "No results found...add a request?", image: .checkMark, desc: "Tell us what to add!")]
var myIndex = 0     // To access in DetailsViewController
var recentSearch = [FoodItems]()


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchBarBottomConstraint: NSLayoutConstraint?
    
    // Create a UITapeGestureRecognizer reference
    private var tapGesture = UITapGestureRecognizer()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Allow view to be touched
        view.isUserInteractionEnabled = true
        
        //Add a method to tapGesture so when it's tapped, that method is run
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewControllerTapped))
        //Add the gesture to the view
        view.addGestureRecognizer(tapGesture)
        //set self as delegate
        tapGesture.delegate = self
        //Allows nearby view to be tapped still
        tapGesture.cancelsTouchesInView = false

        searchBar.showsCancelButton = false
        
        if recentSearch.isEmpty == true {
            recentSearch.append(FoodItems(title: "No recent search", image: .checkMark, desc: "None"))
        }
        
        if foodList.isEmpty == true {
            setUpFoodList()
        }
        currentFoodList = foodList.sorted { $0.title < $1.title }
 
        tableView.reloadData()
        
        // Searchbar Constraints
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        let searchBarLeadingConstraint = NSLayoutConstraint(item: searchBar, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let searchBarTrailingConstraint = NSLayoutConstraint(item: searchBar, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        searchBarBottomConstraint = NSLayoutConstraint(item: searchBar, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -350.0)
 
        view.addConstraints([searchBarLeadingConstraint, searchBarTrailingConstraint, searchBarBottomConstraint!])
        
        
        // Tableview Constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let tableViewLeadingConstraint = NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let tableViewTrailingConstraint = NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let tableViewTopConstraint = NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: searchBar, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let tableViewBottomConstraint = NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        view.addConstraints([tableViewLeadingConstraint, tableViewTrailingConstraint, tableViewTopConstraint, tableViewBottomConstraint])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // Tap Gesture Methods
    
    @objc func viewControllerTapped(_ sender: UITapGestureRecognizer) {
        searchBarCancelButtonClicked(searchBar)
        print("tapView got tapped!")
    }
    
    //This is the method that the tapGesture will take in.
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        if touch.view == self.tableView {
            return false
        } else if touch.view == view {
            return true
        }
        return false
    }
    
    
    // Setting up the searchBar
    private func setUpSearchBar() {
        searchBar.delegate = self
    }
    
    
    //MARK TableView DataSource Stubs
    
    // Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if currentFoodList.count > 0 {
            return currentFoodList.count
        } else {
            return emptyList.count
        }
    }
    
    // Configure each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DataCell else {
            return UITableViewCell()
        }
        
        if currentFoodList.count > 0 {
            cell.textLabel?.text = currentFoodList[indexPath.row].title
            cell.textLabel?.textColor = UIColor.black
                } else {
                    currentFoodList = emptyList
                    cell.textLabel?.text = currentFoodList[indexPath.row].title
                    cell.textLabel?.textColor = UIColor(red: 146/255.0, green: 146/255.0, blue: 146/255.0, alpha: 1.0)

            
        }
        return cell
    }
    
    // What happens when user taps on a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        myIndex = indexPath.row
        
        // Create differentf f segue for emptyList/foodList
        if emptyList[0] === currentFoodList[indexPath.row] {
            performSegue(withIdentifier: "Segue2", sender: self)
        } else {
            performSegue(withIdentifier: "Segue", sender: self)
        }
    }
    
    
    //MARK: SearchBar DataSource Method
    
    // Configure what happens when text changes
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            currentFoodList = foodList.sorted { $0.title < $1.title }
            tableView.reloadData()
            return
        }
        currentFoodList = foodList.filter({ food -> Bool in
            food.title.lowercased().hasPrefix(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    // SearchBar Cancel Button
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()        // Takes away keyboard
        currentFoodList = foodList.sorted { $0.title < $1.title }       // resets the list
        searchBar.text = nil        // cleans up the text in searchbar
        tableView.reloadData()      // reloads all the data
        
        // Adding animation to the searchBar and Tableview when cancel button is clicked
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.searchBarBottomConstraint?.constant = -350
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    // SearchBar Done Button
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarClickedConstraints() {
        // Adding animation to searchbar and tableview when cancel is clicked
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            //searchBar's bottom constraint = superView's height value, make it negative, then add searchBar's height and a lil more
            self.searchBarBottomConstraint?.constant = (self.view.frame.size.height * -1) + self.searchBar.frame.size.height + 50
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        searchBarClickedConstraints()
    }
}



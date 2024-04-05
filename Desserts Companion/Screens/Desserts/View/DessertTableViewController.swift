//
//  DessertsViewController.swift
//  Desserts Companion
//
//  Created by csuftitan on 4/3/24.
//

import UIKit
import SwiftUI

class DessertTableViewController: UIViewController {
    
    @IBOutlet weak var dessertTableView: UITableView!
    var dessertTableViewCell : DessertTableViewCell?
    var dessertDetailsViewModel : DessertDetailsViewModel = DessertDetailsViewModel()
    private var viewModel = DessertViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
}

//MARK: - Configure, InitViewModel, ObserveEvent
extension DessertTableViewController{
    func configuration(){
        dessertTableView.register(UINib(nibName: "DessertTableViewCell", bundle: nil), forCellReuseIdentifier: "DessertTableViewCell")
        initViewModel()
        observeEvent()
    }
    
    func initViewModel(){
        viewModel.fetchDessertData()
    }
    
    //observe DataBinding event - communication
    func observeEvent(){
        viewModel.eventHandler = { [weak self] event in
            guard let self else{
                return
            }
            switch event {
            case .loading :
                print("Product Loading...")
            case .stopLoading :
                print("Stop Loading...")
            case .dataLoading:
                print("Data Loaded.")
                DispatchQueue.main.async {
                    self.dessertTableView.reloadData()
                }
            case .error(let error):
                print(error?.localizedDescription)
            }
        }
    }
}

//MARK: - TableViewDataSource
extension DessertTableViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = viewModel.desserts?.meals.count else {
            return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dessertTableViewCell = dessertTableView.dequeueReusableCell(withIdentifier: "DessertTableViewCell") as? DessertTableViewCell else{
            return UITableViewCell()
        }
        let meals = viewModel.desserts?.meals[indexPath.row]
        dessertTableViewCell.meals = meals
        return dessertTableViewCell
    }
}

//MARK: - TableViewDelegate
extension DessertTableViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let mealID = viewModel.desserts?.meals[indexPath.row].idMeal else{
            return
        }
        let dessertDetailsView = DessertDetailsView(mealID: mealID)
        
        let hostingController = UIHostingController(rootView: dessertDetailsView)
        
        navigationController?.pushViewController(hostingController, animated: true)
    }
}

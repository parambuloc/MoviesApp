//
//  MoviesView.swift
//  MoviesApp
//
//  Created by Paolo Arámbulo on 6/05/24.
//

import UIKit

protocol MoviesUI: AnyObject {
    func updateList()
    func errorLoadList(error: String)
}

class MoviesView: UIViewController {
    
    @IBOutlet weak var moviesSearchBar: UISearchBar!
    @IBOutlet weak var moviesTableView: UITableView!

    private let presenter: MoviesPresentable
    
    init(presenter: MoviesPresentable) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupSearchBar()
        
        presenter.onAppear()
    }
    
    private func setupTableView() {
        moviesTableView.register(UINib(nibName: "MovieCellView", bundle: nil), forCellReuseIdentifier: "MovieCellView")
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
    }
    
    private func setupSearchBar() {
        moviesSearchBar.delegate = self
    }

}

extension MoviesView: UISearchBarDelegate { 
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) { 
        presenter.onSearch(searchText: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}

extension MoviesView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.movieCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellView", for: indexPath) as? MovieCellView else {
            return UITableViewCell()
        }
        
        let movie = presenter.movieCellViewModels[indexPath.row]
        cell.configure(movie: movie)
        
        return cell
    }
    
}

extension MoviesView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onTapCell(atIndex: indexPath.row)
    }
    
}

extension MoviesView: MoviesUI {
    
    func updateList() {
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
    
    func errorLoadList(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}

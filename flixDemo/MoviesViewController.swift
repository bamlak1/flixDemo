//
//  MoviesViewController.swift
//  flixDemo
//
//  Created by Bamlak Gessessew on 6/21/17.
//  Copyright © 2017 Bamlak Gessessew. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var movieSearchBar: UISearchBar!

    @IBOutlet weak var tableView: UITableView!
    var movies: [[String: Any]] = []
    var refreshControl: UIRefreshControl!
    var filteredMovies : [[String:Any]] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Start the activity indicator
        activityIndicator.startAnimating()
        
        // Stop the activity indicator
        // Hides automatically if "Hides When Stopped" is enabled
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(MoviesViewController.didPullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        movieSearchBar.delegate = self
        tableView.dataSource = self
        
        fetchMovies()
        activityIndicator.stopAnimating()
    }

    func didPullToRefresh(_ refreshControl: UIRefreshControl) {
        fetchMovies()
    
    }
    
    
    
    
    
    
    

    
    func searchBar(_ movieSearchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredMovies = movies
        
        } else {
        
            filteredMovies = movies.filter { (movie: [String: Any]) -> Bool in
                let title = movie["title"] as! String
                return title.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            
            }
        }
        
        tableView.reloadData()

    }
    

    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = filteredMovies[indexPath.row]
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        cell.titleLabel.text = title
        cell.overviewLabel.text = overview
        
        let posterPathString = movie["poster_path"] as! String
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        let posterURL = URL(string: baseURLString + posterPathString)!
        cell.posterImageView.af_setImage(withURL: posterURL)
        
        
        
        //cell.textLabel?.text = "row\(indexPath.row)"
        //print("row\(indexPath.row)")
        return cell
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell) {
            let movie = filteredMovies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie
            
            
        }
        
    }
    
    func fetchMovies() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            //This will run when network request returns
            if let error = error {
                print(error.localizedDescription)
                
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movies = dataDictionary["results"] as! [[String: Any]]
                self.movies = movies
                self.filteredMovies = movies
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
                //could not attach to pid
                
            }
        }
        
        task.resume()

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

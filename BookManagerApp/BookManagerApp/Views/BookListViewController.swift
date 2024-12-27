//
//  BookListViewController.swift
//  BookManagerApp
//
//  Created by Anjali on 28/12/24.
//

import UIKit

class BookListViewController: UIViewController {
    
    private let viewModel = BookListViewModel()
    
    @IBOutlet weak var bookListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.fetchBooks()
        
    }
    
    private func setupUI(){
        bookListTableView.delegate = self
        bookListTableView.dataSource = self
    }
    
    private func bindViewModel() {
        viewModel.onBooksLoaded = { [weak self] in
            //reload tableview
            self?.bookListTableView.reloadData()
        }
        
        viewModel.onError = { [weak self] error in
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self?.present(alert, animated: true)
        }
    }
    
}

extension BookListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //show details and provide options for edit
    }
    
}
extension BookListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookListTableViewCell
        let book = viewModel.bookList[indexPath.row]
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.author
        cell.yearLabel.text = String(book.yearOfPublication)
        cell.onButtonTap = { [weak self] in
            //define logic for updating status
        }
        return cell
    }
    
    
}

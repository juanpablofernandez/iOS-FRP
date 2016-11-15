//
//  TableViewController.swift
//  TicTacToe
//
//  Created by Jay on 11/15/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TableViewController: UITableViewController {
    
    let game: Variable<[Board]> = Variable([])
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = nil
        tableView.dataSource = nil
        
        game.asObservable().bindTo(tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (row:Int, board: Board, cell: UITableViewCell) in
            if let win = board.winner()?.rawValue {
                cell.textLabel?.text = "Winner \(win)"
            } else {
                cell.textLabel?.text = "Turn \(board.playerWithCurrentTurn().rawValue)"
            }
            }.addDisposableTo(disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController {
            destination.doBoard = {
                self.game.value.append($0)
            }
        }
    }
}

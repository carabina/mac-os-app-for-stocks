//
//  ViewController.swift
//  Stok
//
//  Created by Zakria on 01/08/2018.
//  Copyright © 2018 Zakria. All rights reserved.
//
import Cocoa
import Alamofire
import SwiftSoup


class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate, NSTextFieldDelegate {
    
    //------------------------------------- Stocks with notes------------------------------------------
    // List of all stocks:
    var stocks = [StockInformation]()
    
    @IBOutlet weak var tableView: NSTableView!
    
    // Putting the Stock name to get the: Stock name, volume and Price
    @IBOutlet weak var input: NSTextField!
    @IBAction func additem(_ sender: Any)  {
        if !input.stringValue.isEmpty {
            let stock = StockInformation(symbol: input.stringValue)
            stock.GetStockInformation {
            }
            let insertionIndex = IndexSet(integer: self.stocks.count)
            self.stocks.append(stock)
            self.tableView.insertRows(at: insertionIndex, withAnimation: .effectGap)
            self.input.stringValue = ""
        }
    }
    // Detecting the target price
    @IBAction func target(_ sender: NSTextFieldCell) {
        let insertionIndex = IndexSet(integer: self.stocks.count)
        let indexPath = tableView.selectedRow
        print(indexPath)
        stocks[indexPath].Target = sender.doubleValue
        stocks[indexPath].SetTargetPercent(Target_Percent_from_Cell: sender.doubleValue)
        print(stocks[indexPath].Target)
        print(sender.doubleValue)
        stocks[indexPath].CalculateProfit()
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int{
        return stocks.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return stocks[row]
    }
    
    public func tableView(_ tableView: NSTableView, rowActionsForRow row: Int, edge: NSTableView.RowActionEdge) -> [NSTableViewRowAction] {
        print("swipe")
        // left swipe
        if edge == .trailing {
            let deleteAction = NSTableViewRowAction(style: .destructive, title: "Delete", handler: { (rowAction, row) in
                // action code
                self.stocks.remove(at: row)
                tableView.removeRows(at: IndexSet(integer: row), withAnimation: .effectFade)
            })
            deleteAction.backgroundColor = NSColor.red
            return [deleteAction]
        }
        let archiveAction = NSTableViewRowAction(style: .regular, title: "Archive", handler: { (rowAction, row) in
            // action code
        })
        return [archiveAction]
    }
    //--------------------------------------------------------------------------------------------------------
    // System functions:
    override func viewDidLoad() {
       print(AnalystRecom(Recommendation: "1", PriceUnder: "4"))
    }
    override func viewDidAppear() {
        tableView.reloadData()
    }

    
   
    
}
    






































/*
 {
 var stocks = [StockInformation]()
 @IBOutlet weak var tableView: NSTableView!
 
 
 // Putting the Stock name to get the: Stock name, volume and Price
 @IBOutlet weak var input: NSTextField!
 @IBAction func additem(_ sender: Any)  {
 if !input.stringValue.isEmpty {
 let stock = StockInformation(symbol: input.stringValue)
 stock.GetStockInformation {
 /*//let newStock = StockInformation(symbol: stock.Symbol)
 let insertionIndex = IndexSet(integer: self.stocks.count)
 print(self.stocks.count)
 self.stocks.append(stock)
 self.tableView.insertRows(at: insertionIndex, withAnimation: .effectGap)
 self.input.stringValue = ""*/
 }
 //let newStock = StockInformation(symbol: stock.Symbol)
 let insertionIndex = IndexSet(integer: self.stocks.count)
 //print(self.stocks.count)
 self.stocks.append(stock)
 self.tableView.insertRows(at: insertionIndex, withAnimation: .effectGap)
 self.input.stringValue = ""
 }
 }
 //-------------------------------------------
 // Detecting the target price
 @IBAction func target(_ sender: NSTextFieldCell) {
 let insertionIndex = IndexSet(integer: self.stocks.count)
 
 let indexPath = tableView.selectedRow
 print("indexPath:")
 print(indexPath)
 stocks[indexPath].Target = sender.doubleValue
 stocks[indexPath].SetTargetPercent(Target_Percent_from_Cell: sender.doubleValue)
 print("stocks[indexPath].Target:")
 print(stocks[indexPath].Target)
 print("sender.doubleValue:")
 print(sender.doubleValue)
 stocks[indexPath].CalculateProfit()
 }
 
 
 
 
 override func viewDidLoad() {
 
 
 
 }
 
 override func viewDidAppear() {
 
 tableView.reloadData()
 }
 
 
 
 func numberOfRows(in tableView: NSTableView) -> Int{
 return stocks.count
 }
 
 func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
 return stocks[row]
 }
 
 
 
 public func tableView(_ tableView: NSTableView, rowActionsForRow row: Int, edge: NSTableView.RowActionEdge) -> [NSTableViewRowAction] {
 print("swipe")
 // left swipe
 if edge == .trailing {
 let deleteAction = NSTableViewRowAction(style: .destructive, title: "Delete", handler: { (rowAction, row) in
 // action code
 self.stocks.remove(at: row)
 tableView.removeRows(at: IndexSet(integer: row), withAnimation: .effectFade)
 })
 deleteAction.backgroundColor = NSColor.red
 return [deleteAction]
 }
 let archiveAction = NSTableViewRowAction(style: .regular, title: "Archive", handler: { (rowAction, row) in
 // action code
 })
 return [archiveAction]
 }
 
 }*/



//
//  StockInformation.swift
//  StockScreener
//
//  Created by Zakria on 31/07/2018.
//  Copyright © 2018 Zakria. All rights reserved.
//
import Alamofire
import Foundation
import SwiftSoup

@objcMembers
class StockInformation: NSObject {
    
    var Symbol: String
    //dynamic var LastRefreshed: String
    //dynamic var Interval: String
    //dynamic var TimeZone: String
    dynamic var Price: Double
    dynamic var Percent: Double
    dynamic var Volume: Int
    dynamic var Link: String
    
    //dynamic var BrokkerFee: Double
    //dynamic var BrokkerFeePerStock: Double
    //dynamic var TargetProfit: Double
    //dynamic var Note: String
    
    dynamic var Investing: Double
    dynamic var Target: Double
    dynamic var Profit: Double
    dynamic var CurrentPrice_for_Target: Double
    
    
    init(symbol: String){ 
        self.Symbol = symbol
        /// The URL is defined
        //self.Link = "https://api.iextrading.com/1.0/stock/"+Symbol+"/batch?types=quote,news,chart&range=1m&last=1/threshold-securities?token=088ed86879664f9088f7150244823d57"
        
        self.Link = "https://api.iextrading.com/1.0/stock/"+Symbol+"/batch?types=quote,news,chart&range=1m&last=1/threshold-securities?token=088ed86879664f9088f7150244823d57"
        
        self.Price = 0.0
        self.Volume = 0
        self.Percent = 0.0
        self.Investing = 0.0
        self.Profit = 0.0
        self.Target = 0.0
        self.CurrentPrice_for_Target = 0.0
    }

    func GetStockInformation(completion: @escaping ()-> Void){
        Alamofire.request("https://api.iextrading.com/1.0/stock/"+Symbol+"/batch?types=quote,news,chart&range=1m&last=1").responseJSON { response in
            if var json = response.result.value{
                if var StockDict = json as? [String:Any]{
                    // Meta data of the stock
                    if var Quote_Dict = StockDict["quote"] as? [String:Any]{
                        if var StockTimeZone = Quote_Dict["primaryExchange"] as? String{
                            //self.TimeZone = StockTimeZone
                            //print(StockTimeZone)
                        }
                        if var Stock_Open = Quote_Dict["latestPrice"]  as? Double{
                            self.Price = Stock_Open
                            //print("Khallo =  \(Stock_Open)")
                        }
                        if var Stock_Volume = Quote_Dict["latestVolume"]  as? Int{
                            self.Volume  = Stock_Volume
                            //print("Khallo =  \(Stock_Volume)")
                        }
                        if var Stock_Percent = Quote_Dict["changePercent"]  as? Double{
                            //self.Percent = Stock_Percent*100.0
                            self.Percent =  (Stock_Percent*100.0 * 10).rounded() / 10
                            //print("Khallo =  \(self.Percent)")
                        }
                    }
                }
            }
            completion()
        }
    }
    
    func SetTargetPercent(Target_Percent_from_Cell: Double) -> Void {
        self.Target = Target_Percent_from_Cell
        self.CurrentPrice_for_Target = Price
    }
    
    func CalculateProfit() -> Double {
        if self.Target < 0.0 {
            self.Profit = ((self.CurrentPrice_for_Target - self.Price)/90.0 + 1.0) * self.Investing;
            print(" << ")
            print(self.Profit)
        }
        else if self.Target > 0.0 {
            self.Profit = ((self.Price - self.CurrentPrice_for_Target)/90.0 + 1.0) * self.Investing;
            print(" CurrentPrice_for_Target : ")
            print(self.CurrentPrice_for_Target)
            print(self.Profit)
        }
        return self.Profit
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //Example of scrapping:
    /*
 // loss
 do {
 let url = URL(string: "https://finviz.com/screener.ashx?v=111&f=sh_price_u4&ft=4&o=change&ar=20")
 guard let myURL = url else {
 print("Error: \(String(describing: url)) doesn't seem to be a valid URL")
 return
 }
 let html = try! String(contentsOf: myURL, encoding: .utf8)
 let doc: Document = try SwiftSoup.parse(html)
 var table_headers = [String]()
 for th in try doc.select(".table-top") {
 table_headers.append(try th.text())
 }
 table_headers.insert("ass", at:10)
 var counter = 0
 var row_data = [String: String]()
 for th in try doc.select(".screener-body-table-nw") {
 row_data[table_headers[counter]] = try th.text()
 counter += 1
 if counter >= (table_headers.count){
 counter = 0
 print(row_data["Ticker"]!)
 row_data.removeAll()
 }
 }
 } catch Exception.Error(let _, let message) {
 print(message)
 } catch {
 print("error")
 }*/
    
    
    
    
    
    
    
    
    
    
    /*func Loser() -> Void {
        
    
    // Defining all the sectors in a list:
        let SectorNames = ["Communication Services","Materials","Technology","Energy","Real Estate","Consumer Discretionary","Health Care","Industrials","Utilities","Financials","Consumer Staples"];

    // Funtion to get the list
    for Sector in SectorNames {
        Alamofire.request("https://api.iextrading.com/1.0/stock/market/collection/sector?collectionName="+Sector).responseJSON { response in
            if let json = response.result.value{
                if let StockDict = json as? [String:Any]{
                    // Meta data of the stock
                  print(StockDict)
                }
            }
            //completion()
        }
    }
        
    }*/


 
    
    
    
    
    //Loss Stocks List:
    
    
    
    
    
    //-----------------------------------------------------

    
 ///--------------------------------------------------------------
  /*  func profit() -> Double {
        var Kapital = Investing - BrokkerFee
        var NumberOfStocks = Kapital/(Price + BrokkerFeePerStock)
        return (NumberOfStocks*Price + NumberOfStocks*TargetProfit*Price)
    }*/
    

}


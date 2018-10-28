//
//  Strategy.swift
//  Stok
//
//  Created by Zakria on 01/09/2018.
//  Copyright © 2018 Zakria. All rights reserved.
//

import Foundation
import SwiftSoup

//-----------------------------------------------------
//                       Strategy for trading
//
// Loss function for scrapping:
func Loss(PriceUnder: String ) -> [String] {
    var List_Of_Stocks = [String]()
    do {
        let url = URL(string: "https://finviz.com/screener.ashx?v=111&f=sh_price_u"+PriceUnder+"&ft=4&o=change&ar=20") // The first 20 stock but this can be changed
        guard let myURL = url else {
            print("Error: \(String(describing: url)) doesn't seem to be a valid URL")
            return List_Of_Stocks
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
                List_Of_Stocks.append(row_data["Ticker"]!)
                //print(row_data["Ticker"]!)
                row_data.removeAll()
            }
        }
        return List_Of_Stocks
    } catch Exception.Error( _, let message) {
        print(message)
        return List_Of_Stocks
    } catch {
        print("error")
        return List_Of_Stocks
    }
}
//--------------------------------------------------------------------------
// Oversold function for scrapping:
func OverSold(PriceUnder: String) -> [String] {
    var List_Of_Stocks = [String]()
    do {
        let url = URL(string: "https://finviz.com/screener.ashx?v=111&s=ta_oversold&f=sh_price_u"+PriceUnder+"&ft=4")
        guard let myURL = url else {
            print("Error: \(String(describing: url)) doesn't seem to be a valid URL")
            return List_Of_Stocks
        }
        let html = try! String(contentsOf: myURL, encoding: .utf8)
        let doc: Document = try SwiftSoup.parse(html)
        var table_headers = [String]()
        for th in try doc.select(".table-top") {
            table_headers.append(try th.text())
        }
        
        var counter = 0
        var row_data = [String: String]()
        for th in try doc.select(".screener-body-table-nw") {
            row_data[table_headers[counter]] = try th.text()
            //print(try th.text())
            counter += 1
            if counter >= (table_headers.count){
                //print(row_data)
                counter = 0
                List_Of_Stocks.append(row_data["Ticker"]!)
                //print(row_data["Ticker"]!)
                row_data.removeAll()
            }
        }
        return List_Of_Stocks
    } catch Exception.Error( _, let message) {
        print(message)
        return List_Of_Stocks
    } catch {
        print("error")
        return List_Of_Stocks
    }
}
//--------------------------------------------------------------------------
// Short float function for scrapping:
func Short(FloatShort: String ) -> [String] {
    var List_Of_Stocks = [String]()
    do {
        let url = URL(string: "https://finviz.com/screener.ashx?v=111&f=sh_short_u"+FloatShort+"&ft=4&o=change")
        guard let myURL = url else {
            print("Error: \(String(describing: url)) doesn't seem to be a valid URL")
            return List_Of_Stocks
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
                List_Of_Stocks.append(row_data["Ticker"]!)
                //print(row_data["Ticker"]!)
                row_data.removeAll()
            }
        }
        return List_Of_Stocks
    } catch Exception.Error( _, let message) {
        print(message)
        return List_Of_Stocks
    } catch {
        print("error")
        return List_Of_Stocks
    }
}
//--------------------------------------------------------------------------
// Insider function for scrapping:
func Insider(InsiderOwnership: String, PriceUnder: String) -> [String] {
    var List_Of_Stocks = [String]()
    do {
        let url = URL(string: "https://finviz.com/screener.ashx?v=111&f=sh_insiderown_o"+InsiderOwnership+",sh_price_u"+PriceUnder+"&ft=4&o=change&ar=20")
        guard let myURL = url else {
            print("Error: \(String(describing: url)) doesn't seem to be a valid URL")
            return List_Of_Stocks
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
                List_Of_Stocks.append(row_data["Ticker"]!)
                //print(row_data["Ticker"]!)
                row_data.removeAll()
            }
        }
        return List_Of_Stocks
    } catch Exception.Error( _, let message) {
        print(message)
        return List_Of_Stocks
    } catch {
        print("error")
        return List_Of_Stocks
    }
}
//--------------------------------------------------------------------------
// Institution function for scrapping:
func Institution(InstitutionOwnership: String, PriceUnder: String) -> [String] {
    var List_Of_Stocks = [String]()
    do {
        let url = URL(string: "https://finviz.com/screener.ashx?v=111&f=sh_instown_o"+InstitutionOwnership+",sh_price_u"+PriceUnder+"&ft=4&o=change")
        guard let myURL = url else {
            print("Error: \(String(describing: url)) doesn't seem to be a valid URL")
            return List_Of_Stocks
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
                List_Of_Stocks.append(row_data["Ticker"]!)
                row_data.removeAll()
            }
        }
        return List_Of_Stocks
    } catch Exception.Error( _, let message) {
        print(message)
        return List_Of_Stocks
    } catch {
        print("error")
        return List_Of_Stocks
    }
}
//--------------------------------------------------------------------------
// Analyst recommendation function for scrapping:
func AnalystRecom(Recommendation: String, PriceUnder: String) -> [String] {
    var populatedDictionary = ["1": "an_recom_strongbuy", "2": "an_recom_buybetter", "3": "an_recom_buy", "4": "an_recom_holdbetter", "5": "an_recom_hold"]
    var List_Of_Stocks = [String]()
    do {
        let url = URL(string: "https://finviz.com/screener.ashx?v=111&f="+populatedDictionary[Recommendation]!+",sh_price_u"+PriceUnder+"&ft=4&o=change&ar=20")
        guard let myURL = url else {
            print("Error: \(String(describing: url)) doesn't seem to be a valid URL")
            return List_Of_Stocks
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
                List_Of_Stocks.append(row_data["Ticker"]!)
                row_data.removeAll()
            }
        }
        return List_Of_Stocks
    } catch Exception.Error( _, let message) {
        print(message)
        return List_Of_Stocks
    } catch {
        print("error")
        return List_Of_Stocks
    }
}


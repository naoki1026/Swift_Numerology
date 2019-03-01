//
//  ViewController.swift
//  Swift_Numerology
//
//  Created by Naoki Arakawa on 2019/02/28.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var dateField: UITextField!
    
    @IBOutlet weak var yourNumber: UILabel!
    
    //UIDatePickerを定義するための変数
    var datePicker: UIDatePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ピッカー設定
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.timeZone = NSTimeZone.local
        
        //日本用のピッカーに変更している
        datePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        dateField.inputView = datePicker
        
        // 決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        // インプットビュー設定(紐づいているUITextfieldへ代入)
        dateField.inputView = datePicker
        dateField.inputAccessoryView = toolbar
    }
    
    // UIDatePickerのDoneを押したら発火
    @objc func done() {
    dateField.endEditing(true)
        
        // 日付のフォーマット
        let formatter = DateFormatter()
        let formatterYear = DateFormatter()
        let formatterMonth = DateFormatter()
        let formatterDay = DateFormatter()
        
        
        
        //"yyyy年MM月dd日"を"yyyy/MM/dd"したりして出力の仕方を好きに変更できるよ
        formatter.dateFormat = "yyyy年MM月dd日"
        formatterYear.dateFormat = "yyyy"
        
        //ここはMMにしないとおかしい数字が表示されてしまうので注意
        formatterMonth.dateFormat = "MM"
        formatterDay.dateFormat = "dd"
        
        //おそらくここでは、データピッカーから取得した日付のうち、formatter2で指定した部分を取得するというロジックになっているのだと思う
        let year = String(formatterYear.string(from: datePicker.date))
        let month = String(formatterMonth.string(from: datePicker.date))
        let day = String(formatterDay.string(from: datePicker.date))
        
        //年の指定した番号の文字列を抽出して、数値型にキャスト
        let firstYear = Int(year.prefix(1))!
        let secondYear = Int(year[year.index(year.startIndex, offsetBy: 1)..<year.index(year.startIndex, offsetBy: 2)])!
        let thirdYear = Int(year[year.index(year.startIndex, offsetBy: 2)..<year.index(year.startIndex, offsetBy: 3)])!
        let fourthYear = Int(year.suffix(1))!
        
        //年の合計値を算出
        let sumYear = firstYear + secondYear + thirdYear + fourthYear
        
        print(firstYear)
        print(secondYear)
        print(thirdYear)
        print(fourthYear)
        print(sumYear)
        
        //月の指定した番号の文字列を抽出して、数値型にキャスト
        let firstMonth = Int(month.prefix(1))!
        let secondMonth = Int(month.suffix(1))!
        
        print(firstMonth)
        print(secondMonth)
        
        let sumMonth = firstMonth + secondMonth
        
        //日の指定した番号の文字列を抽出して、数値型にキャスト
        let firstDay = Int(day.prefix(1))!
        let secondDay = Int(day.suffix(1))!
        
        print(firstDay)
        print(secondDay)
        
        let sumDay = firstDay + secondDay
        
        //ライフパスナンバーを算出
        let lifePassNumber = String(sumYear + sumMonth + sumDay)
        let firstLPN = Int(lifePassNumber.prefix(1))!
        let secondLPN = Int(lifePassNumber.suffix(1))!
        
        let finalLPN = firstLPN + secondLPN
        print(finalLPN)
        
        
        
        yourNumber.text = String(finalLPN)
       
        //(from: datePicker.date))を指定してあげることで
        //datePickerで指定した日付が表示される
        dateField.text = "\(formatter.string(from: datePicker.date))"
       
        // 本当はNSDate()じゃない方がいいと思う。
        let now = Date()
        print("今日は\(now))です")
        
        let Age = now.timeIntervalSince(datePicker.date)//生まれてからの秒数
        let myAge2 = Int(Age)//秒齢
        let myAge3 = Double(myAge2)
        let myAge4 = Int(myAge2/60/60/24)//日齢
        let myAge5 = Int(myAge3/60/60/24/365.24)//年齢＿端数の切り捨て:満年齢:整数Integer
        
        //ログから出力されていることを確認、
        print("年齢は満\(myAge5)歳です")
    
        
    }
}

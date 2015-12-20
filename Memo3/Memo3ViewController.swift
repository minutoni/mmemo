//
//  Memo3ViewController.swift
//  Memo3
//
//  Created by 所　紀彦 on 2015/12/06.
//  Copyright © 2015年 norihiko tokoro. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var TitleTextField: UITextField!
    @IBOutlet var ContentTextView: UITextView!
    
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TitleTextField.text = saveData.objectForKey("title") as! String?
        ContentTextView.text = saveData.objectForKey("content") as! String?
        
       // TitleTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveMemo() {
        //NSUserDefaultsに書き込み
        saveData.setObject(TitleTextField, forKey: "title")
        saveData.setObject(ContentTextView, forKey: "content")
        saveData.synchronize()
        
        //alertを出す。
        let alert = UIAlertController(title:"保存",
         
            message: "メモの保存が完了しました。",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        //OKボタン
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertActionStyle.Default,
                handler: {action in
                    //ボタンが押された時の動作
                    self.navigationController?.popViewControllerAnimated(true)
                    
                }
            )
        )
        
        presentViewController(alert,animated: true, completion: nil)
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

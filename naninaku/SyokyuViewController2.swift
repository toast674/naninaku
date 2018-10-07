//
//  syokyuViewController2.swift
//  naninaku
//
//  Created by 苅宿大將 on 2018/07/15.
//  Copyright © 2018年 mizuno. All rights reserved.
//

import Foundation
import WebKit

//UIViewControllerを継承した初級用クラス
class SyokyuViewController2 : UIViewController {
    
    var correctAnswer = "suru";
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var explanationText: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nakiButton: UIButton!
    @IBOutlet weak var suruButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isHidden = true
    }
    
    @IBAction func nakiButton(_ sender: UIButton) {
        if correctAnswer == "naki" {
            answerLabel.text = "正解！"
        } else {
            answerLabel.text = "不正解！"
        }
        explanationText.isEditable = false
        explanationText.text = explanation()
        nakiButton.isHidden = true
        suruButton.isHidden = true
        nextButton.isHidden = false
    }
    
    @IBAction func suruButton(_ sender: UIButton) {
        if correctAnswer == "suru" {
            answerLabel.text = "正解！"
        } else {
            answerLabel.text = "不正解！"
        }
        explanationText.isEditable = false
        explanationText.text = explanation()
        nakiButton.isHidden = true
        suruButton.isHidden = true
        nextButton.isHidden = false
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
    }
    func explanation() -> String {
        let explanation = "前問と違い完全イーシャンテンの形。リーチで満貫まで見える手であり、速度も申し分ないのでスルー。"
        return explanation
    }
}

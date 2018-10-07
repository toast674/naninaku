//
//  syokyuViewController.swift
//  naninaku
//
//  Created by 苅宿大將 on 2018/07/05.
//  Copyright © 2018年 mizuno. All rights reserved.
//

import Foundation
import WebKit
import UIKit

//UIViewControllerを継承した初級用クラス
class SyokyuViewController : UIViewController {
    
    var correctAnswer = "naki";
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var explanationText: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nakiButton: UIButton!
    @IBOutlet weak var suruButton: UIButton!
    
    @IBOutlet weak var paizu: SyokyuCustomView!
    
    //問題の配列を宣言
    var mondai:[Mondai] = []
    
    var count = 0
    
    
    //問題一式の構造体を指定
    //クイズアプリのviewcontrollerに倣って作成
    struct Mondai {
        //手牌部分
        var tehai: [Quiz]
        //捨て牌部分
        var sutehai: [Quiz]
        //ドラ部分
        var dora: [Quiz]
        //点数状況部分
        var tensuu: String
        //場況設定部分
        var bakyou: String
        
        //解説部分
        var kaisetu : String
        //答え「正解！」or「不正解！」
        var answer: String
    }
    
    struct Quiz {
        var type : String
        var loc: UIImageView
    }
    
    
    @IBOutlet weak var mirrorTon: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nextButton.isHidden = true
        explanationText.isEditable = false
        
        mondai.append(mondai1())
        
        mondaiSet()
    }
    
    //1問目 問題を生成
    func mondai1()->Mondai{
        //コンストラクタで手牌の画像をセット
        let tehai1 = Quiz.init(type: "man8", loc: paizu.tehai1)
        let tehai2 = Quiz.init(type: "man9", loc: paizu.tehai2)
        let tehai3 = Quiz.init(type: "pin1", loc: paizu.tehai3)
        let tehai4 = Quiz.init(type: "pin1", loc: paizu.tehai4)
        let tehai5 = Quiz.init(type: "pin1", loc: paizu.tehai5)
        let tehai6 = Quiz.init(type: "pin3", loc: paizu.tehai6)
        let tehai7 = Quiz.init(type: "pin4", loc: paizu.tehai7)
        let tehai8 = Quiz.init(type: "aka1", loc: paizu.tehai8)
        let tehai9 = Quiz.init(type: "sou4", loc: paizu.tehai9)
        let tehai10 = Quiz.init(type: "sou4", loc: paizu.tehai10)
        let tehai11 = Quiz.init(type: "ji1", loc: paizu.tehai11)
        let tehai12 = Quiz.init(type: "ji1", loc: paizu.tehai12)
        let tehai13 = Quiz.init(type: "ji4", loc: paizu.tehai13)
        
        //コンストラクタで捨て牌の画像をセット TODO 可変対応
        let sutehai1 = Quiz.init(type: "pin9yoko", loc: paizu.sutehai1)
        let sutehai2 = Quiz.init(type: "sou8yoko", loc: paizu.sutehai2)
        let sutehai3 = Quiz.init(type: "sou2yoko", loc: paizu.sutehai3)
        let sutehai4 = Quiz.init(type: "ji1yoko", loc: paizu.sutehai4)
        
        //コンストラクタでドラの画像をセット
        let dora = Quiz.init(type: "ji2", loc: paizu.dora)
        
        //コンストラクタで点数状況をセット
        let tensuu = "東一局 0本場　東家 25000 南家 25000 西家 25000 北家 25000"
        
        //コンストラクタで場況設定をセット
        let bakyou = "東家　ドラ"
        

        
        //mondai1にセットするために手牌を配列にする
        let tehaiArray = [tehai1, tehai2, tehai3, tehai4, tehai5, tehai6, tehai7, tehai8, tehai9, tehai10, tehai11, tehai12, tehai13]
        //mondai1にセットするために捨て牌を配列にする
        let sutehaiArray = [sutehai1, sutehai2, sutehai3, sutehai4]
        
        //手牌と捨て牌、解説「かいせつ」、設定したカスタムビュー、Mondaiの構造体を返す
        let mondai1 = Mondai.init(tehai: tehaiArray, sutehai:sutehaiArray, dora: [dora], tensuu: tensuu, bakyou: bakyou, kaisetu: "かいせつ", answer: "1")
        
        return mondai1
    }
    
    //初期表示時、次の問題時の画面セット
    func mondaiSet(){
        
        //カスタムビューのセット？
        for setQuiz in mondai[count].tehai {
            paizu.setQuiz(mondai: setQuiz)
        }
        //解説ラベル（本番ではテキストエリア）
        explanationText.text = mondai[count].kaisetu
        
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
        
        count += 1
        
        if mondai.count <= count {
            return
        }
        
        paizu.clearView()
        mondaiSet()
        
    }
    func explanation() -> String {
        let explanation = "愚形残りのイーシャンテン。面前で進めるには受け入れが少なすぎる。状況的に打点が必要なわけでもないのでポンテンをとる。"
        return explanation
    }


    
}

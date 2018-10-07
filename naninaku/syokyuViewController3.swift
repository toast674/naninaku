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
class SyokyuViewController3 : UIViewController {
    
    var correctAnswer = "naki";
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var explanationText: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nakiButton: UIButton!
    @IBOutlet weak var suruButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        let explanation = "面前ならスルーだが既に鳴いているので鳴く。仮に鳴きが早すぎたとしてもそれ以降の判断はしっかりとする。"
        return explanation
    }
    
    
}

extension UIImage {
    
    func rotatedBy(degree: CGFloat) -> UIImage {
        let radian = -degree * CGFloat.pi / 180
        UIGraphicsBeginImageContext(self.size)
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: self.size.width / 2, y: self.size.height / 2)
        context.scaleBy(x: 1.0, y: -1.0)
        
        context.rotate(by: radian)
        context.draw(self.cgImage!, in: CGRect(x: -(self.size.width / 2), y: -(self.size.height / 2), width: self.size.width, height: self.size.height))
        
        let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return rotatedImage
    }
    
}

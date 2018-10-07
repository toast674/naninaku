//
//  SyokyuCustomView.swift
//  naninaku
//
//  Created by 苅宿大將 on 2018/08/08.
//  Copyright © 2018年 mizuno. All rights reserved.
//

import UIKit

class SyokyuCustomView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBOutlet weak var tehai1: UIImageView!
    @IBOutlet weak var tehai2: UIImageView!
    @IBOutlet weak var tehai3: UIImageView!
    @IBOutlet weak var tehai4: UIImageView!
    @IBOutlet weak var tehai5: UIImageView!
    @IBOutlet weak var tehai6: UIImageView!
    @IBOutlet weak var tehai7: UIImageView!
    @IBOutlet weak var tehai8: UIImageView!
    @IBOutlet weak var tehai9: UIImageView!
    @IBOutlet weak var tehai10: UIImageView!
    @IBOutlet weak var tehai11: UIImageView!
    @IBOutlet weak var tehai12: UIImageView!
    @IBOutlet weak var tehai13: UIImageView!
    
    @IBOutlet weak var dora: UIImageView!
    
    @IBOutlet weak var sutehai1: UIImageView!
    @IBOutlet weak var sutehai2: UIImageView!
    @IBOutlet weak var sutehai3: UIImageView!
    @IBOutlet weak var sutehai4: UIImageView!
    
    @IBOutlet weak var bakyou: UILabel!
    @IBOutlet weak var tennsuu: UITextView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib(){
        let view = Bundle.main.loadNibNamed("SyokyuCustomView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func clearView(){
        tehai1.image = nil
        tehai2.image = nil
        tehai3.image = nil
        tehai4.image = nil
        tehai5.image = nil
        tehai6.image = nil
        tehai7.image = nil
        tehai8.image = nil
        tehai9.image = nil
        tehai10.image = nil
        tehai11.image = nil
        tehai12.image = nil
        tehai13.image = nil
        
        sutehai1.image = nil
        sutehai2.image = nil
        sutehai3.image = nil
        sutehai4.image = nil
        
        dora.image = nil
        
        
    }
    
    func setQuiz(mondai: SyokyuViewController.Quiz){
        mondai.loc.image = UIImage.init(named: mondai.type)
    }
}

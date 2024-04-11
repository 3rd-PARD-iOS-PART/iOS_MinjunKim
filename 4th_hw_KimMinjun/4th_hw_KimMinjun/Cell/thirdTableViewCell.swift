//
//  thirdTableViewCell.swift
//  4th_hw_KimMinjun
//
//  Created by 김민준 on 4/10/24.
//

import UIKit
 
class thirdTableViewCell : UITableViewCell {
    
     let mainImage = UIImageView()
     let remind_bt = UIButton()
     let share_bt = UIButton()
     let label = UILabel()
        
     // 필수 생성자
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    // 직접 만드는 경우 initialize 해주기
    override init(style: UITableViewCell.CellStyle, reuseIdentifier : String?){
        super.init(style: style, reuseIdentifier: "thirdCell")
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        
        
       // 이따가 검은색으로 바꾸기
        contentView.backgroundColor = #colorLiteral(red: 0.2588235736, green: 0.2588235736, blue: 0.2588235736, alpha: 1)
    
        // cell 안의 view들 오토레이아웃 지정
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.contentView.topAnchor , constant: 10),
            label.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor ,constant:  10),
        ])

    }
    
    
    
    
    
    
}

//
//  secondTableViewCell.swift
//  4th_hw_KimMinjun
//
//  Created by 김민준 on 4/10/24.
//

import UIKit

// 셀 내용
class secondTableViewCell : UITableViewCell{
    // 인스턴스 생성
//    let image = UIImageView()
    let label : UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let play_image : UIImageView = {
        let play_image = UIImageView()
        play_image.translatesAutoresizingMaskIntoConstraints = false
        play_image.contentMode = .scaleAspectFill // 이미지 비율 유지

        return play_image
    }()

    
    
    
    
    
    let image_name1: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill // 이미지 비율 유지
        return image
    }()
    // 필수 생성자
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // 직접 만드는 경우 initialize 해주기 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier : String?){
        super.init(style: style, reuseIdentifier: "secondCell")

      
        
        contentView.addSubview(image_name1)
        contentView.addSubview(label)
        contentView.addSubview(play_image)
        
        
        // cell 안의 view들 오토레이아웃 지정
        contentView.backgroundColor = #colorLiteral(red: 0.2588235736, green: 0.2588235736, blue: 0.2588235736, alpha: 1)
        
        NSLayoutConstraint.activate([
            image_name1.topAnchor.constraint(equalTo: contentView.topAnchor),
            image_name1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            image_name1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image_name1.widthAnchor.constraint(equalToConstant: 146),
            
  
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            play_image.centerYAnchor.constraint(equalTo: centerYAnchor),
            play_image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -3),
            play_image.widthAnchor.constraint(equalToConstant: 28),
            play_image.heightAnchor.constraint(equalToConstant: 28),
            
        ])

    }

}

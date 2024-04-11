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
    let label = UILabel()
    let playImage = UIImageView()
   
    let image : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    // 필수 생성자
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // 직접 만드는 경우 initialize 해주기 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier : String?){
        super.init(style: style, reuseIdentifier: "secondCell")
        
        label.translatesAutoresizingMaskIntoConstraints = false
        playImage.translatesAutoresizingMaskIntoConstraints = false
      
        
        contentView.addSubview(image)
        contentView.addSubview(label)
        contentView.addSubview(playImage)
        
        
        // cell 안의 view들 오토레이아웃 지정
        contentView.backgroundColor = #colorLiteral(red: 0.2588235736, green: 0.2588235736, blue: 0.2588235736, alpha: 1)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.widthAnchor.constraint(equalToConstant: 100),
            
            
            
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            playImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            playImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            playImage.leadingAnchor.constraint(equalTo: label.trailingAnchor ,constant: 117.67),
            playImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])

    }

}

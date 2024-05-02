//
//  modalTableViewCell.swift
//  5th_hw_KimMinjun
//
//  Created by 김민준 on 4/29/24.
//

import UIKit

class modalTableViewCell: UITableViewCell{
    
    
    
    
    
    // main image
    let mainImage : UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    
    // title
    let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12 ,weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // time
    let timeLabel : UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.5490196347, green: 0.5490196347, blue: 0.5490196347, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 10 ,weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // script
    let scriptLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    
     
    
    // 필수 생성자
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // 직접 만드는 경우 initialize 해주기
    override init(style: UITableViewCell.CellStyle, reuseIdentifier : String?){
        super.init(style: style, reuseIdentifier: "modal")
        
        contentView.backgroundColor = .black
        // contentView에 올리기
        addSubview(mainImage)
        addSubview(titleLabel)
        addSubview(timeLabel)
        addSubview(scriptLabel)
        
        
        // 오토레이아웃
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ,constant: 16),
            mainImage.widthAnchor.constraint(equalToConstant: 124),
            mainImage.heightAnchor.constraint(equalToConstant: 69),

            
            
            scriptLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor ,constant: 8),
            scriptLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            titleLabel.leadingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.5),
            
            timeLabel.leadingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant:8 ),
            timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            
            
            
        ])
    }
}

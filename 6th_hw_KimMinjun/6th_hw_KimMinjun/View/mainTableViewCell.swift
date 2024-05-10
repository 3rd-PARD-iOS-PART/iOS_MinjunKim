//
//  mainTableViewCell.swift
//  6th_hw_KimMinjun
//
//  Created by 김민준 on 5/8/24.
//

import UIKit

class mainTableViewCell : UITableViewCell {
    //MARK: - UI 설정
    
    var partLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var nameLabel: UILabel = {
       var label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - 메인
    override init(style: UITableViewCell.CellStyle, reuseIdentifier : String?){
        super.init(style: style, reuseIdentifier:   "maincell")
        contentView.backgroundColor = .clear
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  // MARK: - UI 올리고 오토레이아웃 잡기
    func setUI(){
       
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(partLabel)
        
        // 오토레이아웃 잡기
        NSLayoutConstraint.activate([
            partLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            partLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: partLabel.trailingAnchor ,constant: 20),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    // 파트와 이름을 Data로부터 받아와 각각 라벨에 저장
    func configure(with member: Data){
        print("저장됨")
        partLabel.text = "[\(member.part)]"
        nameLabel.text = member.name
    }
}









//
//  thirdTableViewCell.swift
//  5th_hw_KimMinjun
//
//  Created by 김민준 on 4/18/24.
//

import UIKit
 
class thirdTableViewCell : UITableViewCell {
    // 메인이미지 만들기
    let mainImage: UIImageView = {
        let mainImage = UIImageView()
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.contentMode = .scaleAspectFill// 이미지 비율 유지
        return mainImage
    }()
    
    
    // 제목 라벨 만들기
    let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    
    // 내용 라벨 만들기
    let scriptLabel : UILabel = {
       let label = UILabel()
        label.textColor = . white
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 11 , weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    
    // 카테고리 라벨 만들기
    let categoryLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 11.4, weight: .semibold)
        
        
        return label
    }()
    
    
    
   
    
    
    
    
    
 // remind 버튼 (configuration 사용)
    let remindButton : UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .clear
        config.imagePadding = 5
        config.imagePlacement = .top
        
        
        //(공부) 그래픽 컨텍스트!
//        그래픽 컨텍스트(Graphics Context)는 그래픽 작업을 수행하는 데 사용되는 환경을 나타냅니다.
//        Core Graphics 프레임워크를 사용하여 그래픽 컨텍스트를 다룹니다.
//         (기능)
//        - 이미지 그리기
//        - 도형 및 경로 그리기
//        - 텍스트 그리기
//        - 색상 및 그라데이션


        if let image = UIImage(named: "Bell"){
            let size = CGSize(width: 24, height: 24)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0) // 그래픽 컨텍스트 생성
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext() // 그래픽 컨텍스트에서 UIImage 객체 생성
            UIGraphicsEndImageContext() // 그래픽 컨텍스트 종료
            
            config.image = scaledImage
        }
        
        // 버튼의 내용
        var textButton = AttributedString.init("Remind Me")
        textButton.font = UIFont.systemFont(ofSize: 11.0, weight: .regular)
        config.attributedTitle = textButton
        
        
        // 버튼 지정
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    // share 버튼  remind 버튼과 동일
    let shareButton: UIButton = {
           var config = UIButton.Configuration.filled() // 버튼 configuration  설정
           config.background.backgroundColor = .clear
           config.imagePadding = 5
           config.imagePlacement = .top
           
           if let image = UIImage(named: "share") {
               let size = CGSize(width: 24, height: 24)
               
               UIGraphicsBeginImageContextWithOptions(size, false, 0.0) // 그래픽 컨텍스트 시작
               image.draw(in: CGRect(origin: .zero, size: size)) // 그래픽 컨텍스트 안에 넣어야 이미지 올라감
               let scaledImage = UIGraphicsGetImageFromCurrentImageContext() // object에 넣기
               UIGraphicsEndImageContext() // 그래픽 컨텍스트 종료
               config.image = scaledImage
           }
        var textButton = AttributedString.init("Share")
        textButton.font = .systemFont(ofSize: 11.0, weight: .regular)
           config.attributedTitle = textButton
     
        
        
           let button = UIButton(configuration: config)
           button.translatesAutoresizingMaskIntoConstraints = false
        
           return button
       }()
        
    
    // 날짜 라벨
    let dateLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11.4 , weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
     // 필수 생성자
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    // 직접 만드는 경우 initialize 해주기
    override init(style: UITableViewCell.CellStyle, reuseIdentifier : String?){
        super.init(style: style, reuseIdentifier: "thirdCell")
        
        // 뷰에 올리기
        contentView.addSubview(titleLabel)
        contentView.addSubview(mainImage)
        contentView.addSubview(scriptLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(remindButton)
        contentView.addSubview(shareButton)
        contentView.addSubview(dateLabel)
        
        contentView.backgroundColor = .black
    
        // cell 안의 view들 오토레이아웃 지정
        NSLayoutConstraint.activate([
            
            
            mainImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: 200),
            
            
            remindButton.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 10),
            remindButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 227),

            
            shareButton.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 10),
            shareButton.leadingAnchor.constraint(equalTo: remindButton.trailingAnchor , constant: 24),
            
            
            dateLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 73),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            
            titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor , constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ,constant:  12),
            
            scriptLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 13),
            scriptLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant:  12),
            
           
            
          
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
          
            
            
            
            
            
        ])

    }
    
    
    
    
    
    
}


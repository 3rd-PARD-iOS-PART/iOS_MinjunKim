//
//  ForthViewController.swift
//  4th_hw_KimMinjun
//
//  Created by 김민준 on 4/9/24.
//

import UIKit

class ForthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setUI()
    }
    func setUI(){
        // 다운로드 이미지 생성
        let downloadImage : UIImageView = {
           let downloadImage = UIImageView()
            downloadImage.image = UIImage(named: "download_circle")
            downloadImage.translatesAutoresizingMaskIntoConstraints = false
    
            
            return downloadImage
        }()
        
        // 다운로드 메세지 생성
        let downloadMessege: UILabel = {
            let downloadMessege = UILabel()

            downloadMessege.textColor = #colorLiteral(red: 0.650980413, green: 0.650980413, blue: 0.650980413, alpha: 1)
            downloadMessege.translatesAutoresizingMaskIntoConstraints = false
            
            // '\n'으로 줄 나누기 & numberOfLines = 2로 두줄 작성
            downloadMessege.text = "Movies and TV shows that you \n download appear here."
            downloadMessege.textAlignment = .center
            downloadMessege.numberOfLines = 2
            
            return downloadMessege
        }()
        
        
        // UI configuration으로 버튼 만들기 (iOS 15부터 적용)
        let downloadButton : UIButton = {
            var config = UIButton.Configuration.filled()    // 채워진 버전으로 그리기
            config.background.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // 배경 흰색으로
            // 버튼 속 text 관련된 설정
            config.attributedTitle = AttributedString("Find Something to Download",attributes: AttributeContainer([
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0, weight: .semibold),
                NSAttributedString.Key.foregroundColor: UIColor.black
            ]))
            
            // 버튼의 마진 조정
            config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            
            let downloadButton = UIButton(configuration: config)
            downloadButton.translatesAutoresizingMaskIntoConstraints = false
            
            return downloadButton
        }()
        
        
        // 뷰에 올리기
        view.addSubview(downloadImage)
        view.addSubview(downloadMessege)
        view.addSubview(downloadButton)
        
        // 오토레이아웃 잡기
        NSLayoutConstraint.activate([
            
            downloadImage.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 248),
            downloadImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            downloadMessege.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            downloadMessege.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 474),
            
            downloadButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            downloadButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -150),
            downloadButton.widthAnchor.constraint(equalToConstant: 280),
            downloadButton.heightAnchor.constraint(equalToConstant: 42),

            
            
        ])
        
        
    }

}




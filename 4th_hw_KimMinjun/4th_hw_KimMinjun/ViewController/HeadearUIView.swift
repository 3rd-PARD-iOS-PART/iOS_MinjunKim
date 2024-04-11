//
//  HeadearUIView.swift
//  4th_hw_KimMinjun
//
//  Created by 김민준 on 4/9/24.
//


import UIKit

// 컴포넌트들 설정하는 클래스
class HeaderUIView: UIView {
        
    // 컴포넌트들 올리기 (1. 만든다. 2. 올린다. 3. 고정한다.) to 민혁이형 나이스
    private let myListButton : UIButton = {
        let button = UIButton()
        button.setTitle("My List", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "plus")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.alignTextBelow(spacing: 4)
        return button
    }()
//    private let playButton : UIButton = {
//       let button = UIButton()
//        
//        button.setTitle("Play", for: .normal)
//        button.layer.borderColor = UIColor.white.cgColor
//        button.layer.borderWidth = 1
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setImage(UIImage(named: "Vector")?.withRenderingMode(.alwaysOriginal), for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.layer.cornerRadius = 10
//        
//        
//        button.setBackgroundColor(.white, for: .normal)
//        button.setBackgroundColor(.gray, for: .selected)
//        button.setBackgroundColor(.gray, for: .disabled)
//        return button
//    }()
    
    

    let playButton : UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = UIColor.lightGray
        config.title = "Play"
        config.image = UIImage(named:"play_bt")
        config.imagePadding = 15
        config.titlePadding = 15
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        config.baseForegroundColor = .black
    
        let playButton = UIButton(configuration: config)
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 20.46, weight: .semibold)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        return playButton
    }()
    
    
    
    
    
//
//    // "Play" 버튼 생성
//           let button2: UIButton = {
//               var configuration = UIButton.Configuration.filled()
//               configuration.background.backgroundColor = UIColor.lightGray
//               configuration.title = "Play"
//               configuration.image = UIImage(named: "play")
//               configuration.imagePadding = 15
//               configuration.titlePadding = 15
//               configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
//               configuration.baseForegroundColor = .black
//                   
//               let btnPlay = UIButton(configuration: configuration)
//               btnPlay.titleLabel?.font = UIFont.systemFont(ofSize: 13.64, weight: .heavy)
//               
//               btnPlay.translatesAutoresizingMaskIntoConstraints = false
//               return btnPlay
//           }()
//    
//    
    
    
    private let infoButton : UIButton = {
       let infoButton = UIButton()
        infoButton.setTitle("Info", for: .normal)
        infoButton.layer.borderColor = UIColor.white.cgColor
        infoButton.setImage(UIImage(named: "info")?.withRenderingMode(.alwaysOriginal), for: .normal)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.alignTextBelow(spacing: 4)
        return infoButton
    }()
    
    private let TvShowButton : UIButton = {
        let TvShowButton = UIButton()
        TvShowButton.setTitle("TV Shows", for: .normal)
        TvShowButton.layer.borderColor = UIColor.white.cgColor
        TvShowButton.translatesAutoresizingMaskIntoConstraints = false
        return TvShowButton
    }()
    
    private let button2 : UIButton = {
        let button2 = UIButton()
        button2.setTitle("Movies", for: .normal)
        button2.layer.borderColor = UIColor.white.cgColor
        button2.translatesAutoresizingMaskIntoConstraints = false
        return button2
    }()
    
    
    private let button3 : UIButton = {
        let button3 = UIButton()
        button3.setTitle("My List", for: .normal)
        button3.layer.borderColor = UIColor.white.cgColor
        button3.translatesAutoresizingMaskIntoConstraints = false
        return button3
    }()
    
    private let heroImageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "movie14")
        
        return imageView
    }()
    
    private let logoimage : UIImageView = {
        let logoimage = UIImageView()
        logoimage.image = UIImage(named: "logo")
        logoimage.contentMode = .scaleAspectFill
        logoimage.translatesAutoresizingMaskIntoConstraints = false
        logoimage.clipsToBounds = true

        return logoimage
        
    }()
    
    
    // 메인 이미지 그라데이션 만들기
//    private func addGradient (){
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [
//            UIColor.clear.cgColor,
//            UIColor.systemBackground.cgColor
//
//        ]
//        gradientLayer.frame = bounds
//        layer.addSublayer(gradientLayer)
//    }
    
    
    
    // view에 올리기
    override init(frame:CGRect){
        super.init(frame: frame)
        addSubview(heroImageView)
//        addGradient() //그라데이션 넣기
        addSubview(TvShowButton)
        addSubview(button2)
        addSubview(button3)
        addSubview(playButton)
        addSubview(myListButton)
        addSubview(logoimage)
        addSubview(infoButton)
        applyConstraints()
    }
    
    // constraint 설정하기
    private func applyConstraints(){
         let playButtonContstraints = [
//            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -35),
            playButton.widthAnchor.constraint(equalToConstant: 110.62),
            playButton.heightAnchor.constraint(equalToConstant: 45)
         ]
        
        let LogoImageContstraints = [
           logoimage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
           logoimage.topAnchor.constraint(equalTo: topAnchor, constant: 10 ),
        ]
        
        let TvShowButtonContstraints = [
           TvShowButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
           TvShowButton.topAnchor.constraint(equalTo: topAnchor, constant: 10 ),
        ]
        
        let Button2Contstraints = [
           button2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 200),
           button2.topAnchor.constraint(equalTo: topAnchor, constant: 10 ),
        ]
       
        
        let Button3Contstraints = [
           button3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
           button3.topAnchor.constraint(equalTo: topAnchor, constant: 10 ),
        ]
       
        let InfoButtonConstraints = [
            infoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            infoButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28)
        ]
        let MyListButtonConstraints = [
            myListButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10 ),
            myListButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -29),
            
        ]
        NSLayoutConstraint.activate(playButtonContstraints)
        NSLayoutConstraint.activate(MyListButtonConstraints)
        NSLayoutConstraint.activate(TvShowButtonContstraints)
        NSLayoutConstraint.activate(Button2Contstraints)
        NSLayoutConstraint.activate(Button3Contstraints)
        NSLayoutConstraint.activate(LogoImageContstraints)
        NSLayoutConstraint.activate(InfoButtonConstraints)


    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}


// 버튼 이미지 ,라벨 세로로 align
extension UIButton {
  
    
    func alignTextBelow(spacing: CGFloat = 4.0) {
            guard let image = self.imageView?.image else {
                return
            }

            guard let titleLabel = self.titleLabel else {
                return
            }

            guard let titleText = titleLabel.text else {
                return
            }

            let titleSize = titleText.size(withAttributes: [
                NSAttributedString.Key.font: titleLabel.font as Any
            ])

            titleEdgeInsets = UIEdgeInsets(top: spacing, left: -image.size.width, bottom: -image.size.height, right: 0)
            imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
            
        }
}

// 버튼 배경 색
extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
         
        self.setBackgroundImage(backgroundImage, for: state)
    }
}



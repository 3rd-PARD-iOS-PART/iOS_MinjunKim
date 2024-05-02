//
//  ThirdViewController.swift
//  5th_hw_KimMinjun
//
//  Created by 김민준 on 4/18/24.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
    // table view 인스턴스 생성
    let tableViewUI : UITableView = {
        let tableView = UITableView ()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = . black
//        if #available(iOS 15.0, *) {
//                   tableView.sectionHeaderTopPadding = 1
//               }
        
       return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        // tableview dataSource 와 delegate 생성
        tableViewUI.dataSource = self
        tableViewUI.delegate = self
        setUI()
    }
    
    
    func setUI(){
        
        
        // title label 만들기
        let title: UILabel = {
            let label = UILabel()
            label.text = "Notifications"
            label.font = UIFont.systemFont(ofSize: 16.91 , weight: .bold)
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        // title image 만들기
        let titleImage : UIImageView = {
           let titleImage = UIImageView()
            titleImage.image = UIImage(named:"redBell")
            titleImage.translatesAutoresizingMaskIntoConstraints = false
            return titleImage
        }()
        
        
        
        
        
        
        // view 올리기
        view.addSubview(titleImage)
        view.addSubview(title)
        view.addSubview(tableViewUI)
        
        
        // 셀 등록하기
        tableViewUI.backgroundColor = .black
        tableViewUI.register(thirdTableViewCell.self, forCellReuseIdentifier: "thirdCell")

        
        // 오토레이아웃 정하기
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13),
            titleImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            titleImage.widthAnchor.constraint(equalToConstant: 19),
            titleImage.heightAnchor.constraint(equalToConstant: 19),
            
            
            title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13),
            title.leadingAnchor.constraint(equalTo: titleImage.trailingAnchor, constant: 7),
            
            tableViewUI.topAnchor.constraint(equalTo: title.bottomAnchor , constant: 26),
            tableViewUI.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableViewUI.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableViewUI.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }

}

// tableview 익스텐션 생성
extension ThirdViewController : UITableViewDelegate, UITableViewDataSource {
   
    
    //1. 특정 섹션에 표시될 행의 수를 결정하는 역할
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //2. indexPath로 셀의 정보 인식, 각 행에 어떤 셀을 표시할지 지정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewUI.dequeueReusableCell(withIdentifier: "thirdCell", for: indexPath) as? thirdTableViewCell else {
            return UITableViewCell()
        }
        
        
        
        // 날짜
        cell.dateLabel.text =  ThirdViewData.thirdmodeling[indexPath.section][indexPath.row].date
       
        // 타이틀
        cell.titleLabel.text = ThirdViewData.thirdmodeling[indexPath.section][indexPath.row].title
        
        // 메인이미지
        let imageName = ThirdViewData.thirdmodeling[indexPath.section][indexPath.row].thirdMainImage
        cell.mainImage.image = UIImage(named: imageName)
        
        
        // script 내용
        cell.scriptLabel.text = ThirdViewData.thirdmodeling[indexPath.section][indexPath.row].script
        
        // category 내용
        cell.categoryLabel.text = ThirdViewData.thirdmodeling[indexPath.section][indexPath.row].category
        return cell
    }
    
    
    

    // 3. 섹션의 개수를 반환
    func numberOfSections(in tableView: UITableView) -> Int {
        return ThirdViewData.thirdmodeling.count

    }

    
    // 4. cell 의 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
  

    
  
    
    
    
    
    // 5. cell 사이 간격 조정
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
           let verticalPadding: CGFloat = -5
           let maskLayer = CALayer()
           maskLayer.backgroundColor = UIColor.black.cgColor
           maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
           cell.layer.mask = maskLayer
       }
    // willDisplay 메소드를 사용하면 하단 스크롤 시 로딩하는 애니메이션도 추가가능하다!!
    //CALayer 란?
    // Core Animation 프레임워크에서 기본적인 그래픽 작업을 수행하는 객체
    // 1. 그래픽 컨텐츠 그리기 : 사용자 지정된 모양 렌더링 가능
    // 2. 애니메이션 및 트랜지션 적용가능
    // 3. 레이아웃 관리 : 자동으로 자식 레이어의 배치와 크기 조정 관리
    //    4. 그림자 및 효과 추가: 그림자, 투명도, 테두리
    //    5. 터치 이벤트 및 사용자 상호 작용
    
    
    // frame 과 bounds 의 차이!
    // frame : 상위 뷰의 좌표계 기준으로 좌표 원점과 크기를 반환
    // bounds : 자기 자신의 좌표계 기준으로 좌표 원점과 크기를 반환
}



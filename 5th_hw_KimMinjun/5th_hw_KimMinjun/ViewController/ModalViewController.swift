//
//  ModalViewController.swift
//  5th_hw_KimMinjun
//
//  Created by 김민준 on 4/29/24.
//

import UIKit


final class ModalViewController : UIViewController {
    // 테이블 뷰 생성
    let modalTable : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        return tableView
    }()
    
    
    override func viewDidLoad() {
        view.backgroundColor = .black
        setUI()
        //tableview의 dataSource와 delegate 생성
        modalTable.delegate = self
        modalTable.dataSource = self

        // navigation var 스크롤 내릴때 투명하게 하기
        navigationController?.isNavigationBarHidden = true

        
    }
    // 모달창 닫기.. 여야 하는데 Why???
//    @objc func closeModal(){
//        self.dismiss(animated: true, completion: nil)
//    }
    
    
    
    // MARK: - tableView 만들어서 올리기
    func setUI(){
        
        // 뷰에 올리기
        view.addSubview(modalTable)
        // 셀 등록하기 (섹션 하나는 헤더처럼 하고 하나는 에피소드 보여주기 )

        modalTable.register(modalHeaderCell.self, forCellReuseIdentifier: "modalHeader")
        modalTable.register(modalTableViewCell.self, forCellReuseIdentifier: "modal")
        
        //MARK: - 오토레이아웃
        NSLayoutConstraint.activate([
            modalTable.topAnchor.constraint(equalTo: view.topAnchor ),
            modalTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            modalTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            modalTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
   
    
}


// MARK: - tableView extension
extension ModalViewController : UITableViewDelegate, UITableViewDataSource {
    // 특정 섹션에 표시되는 행의 수를 결정하는 역할
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return ModalViewData.modalModeling.count
        
    }
    
    
    
    // section의 개수 반환
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
    // indexPath로 셀의 정보 인식, 각 행에 어떤 셀을 표시할지 지정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        // section 0
        if indexPath.section == 0 {
            guard let cell = modalTable.dequeueReusableCell(withIdentifier: "modalHeader", for: indexPath)as?
                    modalTableViewCell else{
                return UITableViewCell()
            }
            return cell
        }
        
        
        
        
        //section 1 - Episode
        guard let cell = modalTable.dequeueReusableCell(withIdentifier: "modal", for: indexPath)as?
                modalTableViewCell else{
            return UITableViewCell()
        }
        
        
        
        // cell.viewcell에 있는 이름.text나 image = 위치[indexPath.row].데이터쪽의 이름!
        let imageName = ModalViewData.modalModeling[indexPath.row].image
        cell.mainImage.image = UIImage(named: imageName)
        // title
        cell.titleLabel.text = ModalViewData.modalModeling[indexPath.row].title
        cell.timeLabel.text = ModalViewData.modalModeling[indexPath.row].time
        cell.scriptLabel.text = ModalViewData.modalModeling[indexPath.row].script
        
        
        return cell
    }
    
    
    // cell 의 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 700
        }
    
        return 130
    }
    
    
    
    
    
    // 5. cell 사이 간격 조정
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 25
        let maskLayer = CALayer()
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
    
    
  
    
}

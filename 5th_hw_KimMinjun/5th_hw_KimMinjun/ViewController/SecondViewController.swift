//
//  SecondViewController.swift
//  5th_hw_KimMinjun
//
//  Created by 김민준 on 4/18/24.
//

import UIKit

class SecondViewController: UIViewController, UISearchBarDelegate {
    
    
    // tableView 인스턴스 생성
    let tableViewUI : UITableView = {
        let tableViewUI = UITableView()
        tableViewUI.translatesAutoresizingMaskIntoConstraints = false
        
        

       return tableViewUI
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        
        // 내가 만든 UIsearch bar
//        let searchController = UISearchController(searchResultsController: nil)
//        self.navigationItem.searchController = searchController
        
        // tableview의 datasource와 delegate 생성
        tableViewUI.dataSource = self
        tableViewUI.delegate = self
        setUI()
        setSearchBar()
    }
    

    
    func setUI(){
        // Title 생성
        let title: UILabel = {
            let label = UILabel()
            label.text = "Top Searches"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 26.75 )
            
            return label
        }()
        // Title, TableView 올리기
        view.addSubview(title)
        view.addSubview(tableViewUI)
        // 셀 등록하기
        tableViewUI.register(secondTableViewCell.self, forCellReuseIdentifier: "secondCell")
        tableViewUI.backgroundColor = .black
        //오토레이아웃 잡기
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            title.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            tableViewUI.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 21),
            tableViewUI.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableViewUI.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableViewUI.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        ])

        
    }
    
    
    
    
//     search bar 설정
    func setSearchBar(){
        let searchBar = UISearchBar()
        // placeholder 설정
        // placeholder란 사용자가 입력 필드에 값을 입력하기 전에 보여지는 힌트, 안내 텍스트
//        searchBar.placeholder = "Search for a show,movie,genre,e.t.c"
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search for a show, movie, genre, e.t.c.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
       //
        // 서치바의 기본 레이아웃 설정
        searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.2588235736, green: 0.2588235736, blue: 0.2588235736, alpha: 1)
        searchBar.searchTextField.textColor = #colorLiteral(red: 0.7686274648, green: 0.7686274648, blue: 0.7686274648, alpha: 1)
        searchBar.searchBarStyle = .minimal // 서치바 뒤의 배경이 없게 (Default , Prominent, Minimal)
        searchBar.searchTextField.layer.cornerRadius = 5 // 모서리 둥굴게
        searchBar.layer.borderWidth = 0 // 테두리 없애기
        searchBar.layer.borderColor = UIColor.clear.cgColor
        searchBar.searchTextField.clipsToBounds = true // 경계 설정 , 벗어나지 않게
        searchBar.updateHeight(height: 48) // 익스텐션에서 따로 높이 지정해주기
        searchBar.searchTextField.leftView?.tintColor = .lightGray
        navigationItem.titleView = searchBar // 네비게이션 바에 UIsearch bar 추가
        
        
        
        // 아직 공부 더 필요함 , iOS 13 이상에서 도입된 클래스, 네비게이션 바의 외관을 세부적으로 커스텀하는데 사용
//        let navigationBarAppearance = UINavigationBarAppearance()
//        navigationBarAppearance.backgroundColor = .black
//        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
//        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
}



// tableview의 익스텐션 생성
extension SecondViewController : UITableViewDelegate, UITableViewDataSource {
    
    //1. 특정 섹션에 표시될 행의 수를 결정하는 역할
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SecondViewData.tablemodeling.count
//        return 1
    }
    
    //2. indexPath로 셀의 정보 인식, 각 행에 어떤 셀을 표시할지 지정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewUI.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as? secondTableViewCell else {
            return UITableViewCell()
        }
//        
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        }
        // cell 에 text 등록
        // cell.viewcell에 있는 이름.text나 image = 위치[indexPath.row].데이터쪽의 이름!
        cell.label.text = SecondViewData.tablemodeling[indexPath.row].title
        // cell에 image 등록
        let imageName = SecondViewData.tablemodeling[indexPath.row].image_name1
        cell.image_name1.image = UIImage(named: imageName)
    
        let playImageName = SecondViewData.tablemodeling[indexPath.row].play_image
        cell.play_image.image = UIImage(named: playImageName)
    
        
        return cell
    }
    
    
    
    // 3. 섹션의 개수를 반환
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SecondViewData.tablemodeling.count
    }
    
    
    // 4. cell 의 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76.0
    }
    
    
    
    // 선택시 모달창
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        switch indexPath.row {
        case 0:
                openModal()
        case 1:
            openModal()

        case 2:
            openModal()
        case 3:
            openModal()
        case 4:
            openModal()
        case 5:
            openModal()
        case 6:
            openModal()
        case 7:
            openModal()

        default:
             return
            
        }
    }
    
    // 모달창 여는 메소드 
    @objc func openModal(){
        let modalVC = ModalViewController()
        let navController = UINavigationController(rootViewController: modalVC)
        self.present(navController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    // 5. cell 사이의 간격 주기
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
           let verticalPadding: CGFloat = 3
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



extension UISearchBar {
    func updateHeight(height: CGFloat, radius: CGFloat = 8.0) {
        let image: UIImage? = UIImage.imageWithColor(color: UIColor.clear, size: CGSize(width: 1, height: height))
        setSearchFieldBackgroundImage(image, for: .normal)
        for subview in self.subviews {
            for subSubViews in subview.subviews {
                if #available(iOS 13.0, *) {
                    for child in subSubViews.subviews {
                        if let textField = child as? UISearchTextField {
                            textField.layer.cornerRadius = radius
                            textField.clipsToBounds = true
                        }
                    }
                    continue
                }
                if let textField = subSubViews as? UITextField {
                    textField.layer.cornerRadius = radius
                    textField.clipsToBounds = true
                }
            }
        }
    }
}





// 서치바 높이 조절 익스텐션
private extension UIImage {
    static func imageWithColor(color: UIColor, size: CGSize) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        guard let image: UIImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        UIGraphicsEndImageContext()
        return image
    }
}


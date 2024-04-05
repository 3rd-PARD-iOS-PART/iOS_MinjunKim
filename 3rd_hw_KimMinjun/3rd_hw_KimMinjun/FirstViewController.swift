//
//  FirstViewController.swift
//  netflix_pr
//
//  Created by 김민준 on 4/3/24.
//

import UIKit

class FirstViewController: UIViewController {
        
    // 테이블 뷰 헤더섹션 타이틀 이런 식으로도 가능?
    let sectionTitles : [String] = ["Popular on Netflix","Trending Now", "Top 10 in Nigeria Today","My List", "African Movies","Nollywood Movies & Tv"]
 
    

    // 테이블 뷰
    private let firstTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        
//        if #available(iOS 15.0, *) {
//                table.sectionHeaderTopPadding = 0
//               }
//
        
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(firstTable)
// 테이블뷰 델리게이트 ,데이타소스
        firstTable.delegate = self
        firstTable.dataSource = self
        firstTable.backgroundColor = .black
        
        navigationController?.isNavigationBarHidden = true
        firstTable.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: "Cell")
//        헤더뷰 설정
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width , height: 450))
        firstTable.tableHeaderView = headerView
        
        
    }
    
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        firstTable.frame = view.bounds
        
    }
}


extension FirstViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count // 타이틀의 개수 만큼 줄 개수 생성
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // 셀 재사용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier , for: indexPath) as? CollectionViewTableViewCell else{
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case 0:
            cell.getSectionNumber(num: 0)
        case 1:
            cell.getSectionNumber(num: 1)
        case 2:
            cell.getSectionNumber(num: 2)
        case 3:
            cell.getSectionNumber(num: 3)
        case 4:
            cell.getSectionNumber(num: 4)
        case 5:
            cell.getSectionNumber(num: 5)
        default:
            cell.getSectionNumber(num: 0)
        }
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    
    // header sectiond의 Title font, size 수정
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.tintColor = .white
        header.textLabel?.font = .systemFont(ofSize: 20.9, weight: .bold)
        header.textLabel?.textColor = .white
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y , width: 100, height: header.bounds.height)
    }
    
    
    
    // section Title 배열 리턴
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    
    
    
    
}




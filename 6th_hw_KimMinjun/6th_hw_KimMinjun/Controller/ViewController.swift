//
//  ViewController.swift
//  6th_hw_KimMinjun
//
//  Created by 김민준 on 5/7/24.
//

import UIKit

class ViewController: UIViewController {

    // 만들어둔 Data를 해당 클래스 내에서 사용하기 위한 변수 선언
    var member: [Data] = []
    
    
    // MARK: - UI 세팅
    let tableView : UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    let urlSession : UILabel = {
      let label = UILabel()
        label.text = "UrlSession"
        label.font = UIFont.systemFont(ofSize: 30 , weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    
    let addButton : UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
   
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // UI 올리기
        
        tableView.dataSource = self
        tableView.delegate = self
        
        readData()
        
        setUI()

        view.backgroundColor = .white
        
        addButton.addTarget(self, action: #selector(addData), for: .touchUpInside)
        
        
        
        
        
    }
    
    // MARK: - UI 설정
    func setUI(){
        view.addSubview(urlSession)
        view.addSubview(addButton)
        view.addSubview(tableView)
        
        tableView.register(mainTableViewCell.self, forCellReuseIdentifier: "maincell")
        
        
        NSLayoutConstraint.activate([
            urlSession.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 20),
            urlSession.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            addButton.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: urlSession.bottomAnchor , constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
    
    
    //MARK: - GET 구현 :  데이터 받아서 보여주기
    func readData() {
        
        // 1. url session 만들기
        if let url  = URL(string: "https://pard-host.onrender.com/pard"){
            // 2. url
            let session = URLSession(configuration: .default)
            
            
            let task = session.dataTask(with: url){ data, response, error in
                if error != nil {
                    print("🚨fail",error!)
                    return
                }
                
                
                if let JSONdata = data {
                    let dataString = String(data: JSONdata, encoding: .utf8)
                    print("🟢 success", dataString!)
                    
                    let decoder = JSONDecoder()
                    
                    do{
                        let decodeData = try decoder.decode([Data].self, from: JSONdata)
                        self.member = decodeData
                        
                        DispatchQueue.main.async{
                            self.tableView.reloadData()
                        }
                    }catch let error as NSError{
                        print("🚨",error)
                    }
                }
            }
            task.resume()
        }
        
        
        
        
    }
    
    
    
    // 모달창 띄우기
    @objc func addData(){
        
        let page = modalViewController(viewController: self)
        page.modalPresentationStyle = UIModalPresentationStyle.automatic
        self.present(page, animated: true, completion: nil)
    }


}

// MARK: - table view extension
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return member.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell 만들기
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "maincell", for: indexPath) as? mainTableViewCell else{
            return UITableViewCell()
        }
        // member data 에서 가져와서 저장하기
        let memberCell = member[indexPath.row]
        // cell 보여주기
        cell.backgroundColor = .white
        cell.configure(with: memberCell)
        return cell
    }
     
            
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
            
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                // DetailViewController로 데이터 보내기
                let passMember = member[indexPath.row]
                let detailViewController = DetailViewController()
        
                detailViewController.member = passMember
                detailViewController.viewController = self
                            
                present(detailViewController, animated: true)
        
    }
            
    
}

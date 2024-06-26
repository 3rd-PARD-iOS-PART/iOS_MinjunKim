//
//  DetailViewController.swift
//  6th_hw_KimMinjun
//
//  Created by 김민준 on 5/9/24.
//


import UIKit

class DetailViewController : UIViewController {
    
    // viewcontroller로부터 데이터 받기
    var member: Data?
    var viewController: ViewController?
    

    
    //MARK: - UI올리기
    let deleteButton : UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let editButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Edit", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40 , weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    
    let ageLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13 , weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let partLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13 , weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    
    
    
    // MARK: - main
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        deleteButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(editTap), for: .touchUpInside)
        configure()
        setUI()
    }
    
    // 데이터 받아온거 컴포넌트에 넣기
    func configure() {
        guard let member = member else {
            return
        }
        nameLabel.text = member.name
        partLabel.text = "Part : \(member.part)"
        ageLabel.text = "Age : \(member.age)"
        
//        데이터 전달 성공했는지 확인용
//        print(member.name)
//        print(member.part)
//        print(member.age)
        
    }
    
    // 삭제 버튼 눌렀을떄
    @objc func buttonTap(){
        let alert = UIAlertController(title: "정말로 삭제하시겠습니다?", message: "삭제한 내용은 다시 되돌릴 수 없습니다.", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .default, handler: nil )
        let delete = UIAlertAction(title: "확인", style: .destructive ){_ in
            
            if let member = self.member {
                self.deleteData(member)
            }
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(cancel)
        alert.addAction(delete)
        
        present(alert, animated: true)
        
    }
    
    
    
    
    //MARK: - eidt 버튼
    @objc func editTap() {
        let alert = UIAlertController(title: "정보 변경하시겠습니까?", message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .default, handler: nil)
        let delete = UIAlertAction(title: "확인", style: .destructive) { _ in
            if let member = self.member {
                self.editData(member)
            }
            self.dismiss(animated: true, completion: nil)
        }

        alert.addTextField { text in
            text.text = self.member?.name ?? ""
        }

        alert.addTextField { text in
            text.text = String(self.member?.age ?? 0)
        }

        alert.addTextField { text in
            text.text = self.member?.part ?? ""
        }

        if let textFields = alert.textFields, let member = self.member {
            let nameTextField = textFields[0]
            let ageTextField = textFields[1]
            let partTextField = textFields[2]

            member.name = nameTextField.text ?? ""
            member.age = Int(ageTextField.text ?? "0") ?? 0
            member.part = partTextField.text ?? ""
        }

        alert.addAction(cancel)
        alert.addAction(delete)
        present(alert, animated: true)
    }
    
    
    //MARK: - PATCH 구현
    func editData(_ member: Data){
        guard let id = member.id else{ return }
        print(id)
        // 1. url 만들기
        let url = "http://172.17.201.143:8080/pard/update/\(id)"
        guard let editUrl = URL(string: url) else{
            print("🚨 error: Invalid URL")
            return
        }
        // 2. url session 만들기
        var request = URLRequest(url: editUrl)
        request.httpMethod = "PATCH"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //3. url session task 만들고 처리하기
        let task = URLSession.shared.dataTask(with: request) { data, response , error in
            guard error == nil else {
                print("🚨🚨edit task error \(error)")
                return
            }
            guard let data = data else {
                print("🚨🚨data error")
                return
            }
            do{
                let encoder = JSONEncoder()
                let jsonData = try encoder.encode(member)
                request.httpBody = jsonData
                // 3. dataTask 만들고 처리하기
                let task = URLSession.shared.dataTask(with: request){data, response, error in
                    if let error = error {
                        print("🚨 error", error)
                        
                    }else if let data = data {
                        if let respondString = String(data: data, encoding: .utf8){
                            print("🟢response: \(respondString)")
                            DispatchQueue.main.async{
                                self.viewController?.readData()
                            }
                        }
                      }
                    }
                    task.resume()
                }catch{
                    print("🚨 error", error)
                }
            
//            if let error = error{
//                print("🚨🚨edit task error \(error)")
//            }else if let editResponse = response as? HTTPURLResponse ,editResponse.statusCode == 200{
//                print("🟢edit success!")
//                DispatchQueue.main.async{
//                    self.viewController?.readData()
//                }
//            } else{
//                print("🚨 error : No Data ")
//            }
        }
        task.resume()

    }
    
    
    
    
    
    
    
    //MARK: -DELETE:  data 삭제하기
    func deleteData(_ member: Data){
        
        guard let id = member.id else{ return }
        
        // 1. url 만들기
        let url = "http://172.17.201.143:8080/pard/\(id)"
        guard let deleteUrl = URL(string: url) else{
            print("🚨 error: Invalid URL")
            return
        }
        // 2. url session 만들기
        var request = URLRequest(url: deleteUrl)
        request.httpMethod = "DELETE"
        
        
        //3. url session task 만들고 처리하기
        let task = URLSession.shared.dataTask(with: request) { data, response , error in
            if let error = error{
                print("🚨🚨delete task error \(error)")
            }else if let deleteResponse = response as? HTTPURLResponse ,deleteResponse.statusCode == 200{
                print("🟢delete success!")
                DispatchQueue.main.async{
                    self.viewController?.readData()
                }
            } else{
                
                print("🚨 error : No Data ")
            }
        }
        task.resume()

    }
    
    
    
    
    
    
    
    //MARK: - UI 올리고 오토레이아웃잡기
    func setUI(){
        view.addSubview(deleteButton)
        view.addSubview(editButton)
        view.addSubview(nameLabel)
        view.addSubview(partLabel)
        view.addSubview(ageLabel)
        
        
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 20),
            deleteButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor , constant: 20),
        
            
            editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 20),
            editButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant: -20),
            
            
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            ageLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            ageLabel.bottomAnchor.constraint(equalTo: partLabel.topAnchor , constant: -10),
            
            partLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            partLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -20),
        
        ])
    }
    
    
    
    
}





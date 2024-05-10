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
        label.font = UIFont.systemFont(ofSize: 20 , weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let ageLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13 , weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let partLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13 , weight: .medium)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        deleteButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)

        setUI()
    }
    
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
    
    
    // data 삭제하기
    func deleteData(_ member: Data){
        guard let id = member.id else{ return }
        
        // 1. url 만들기
        let url = "https://pard-host.onrender.com/pard\(id)"
        guard let deleteUrl = URL(string: url) else{
            print("🚨 error: Invalid URL")
            return
        }
        // 2. url session 만들기
        var request = URLRequest(url: deleteUrl)
        request.httpMethod = "DELETE"
        
        
        //3. url session task 만들기
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
    
    
    // 데이터 받아온거 컴포넌트에 넣기
    func configure() {
        guard let member = member else {
            return
        }
        nameLabel.text = member.name
        partLabel.text = "Part : \(member.part)"
        ageLabel.text = "Age : \(member.age)"
    }
    
    
    
}



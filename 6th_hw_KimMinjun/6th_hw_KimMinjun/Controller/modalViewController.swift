//
//  modalViewController.swift
//  6th_hw_KimMinjun
//
//  Created by 김민준 on 5/7/24.
//

import UIKit

class modalViewController : UIViewController {
    //MARK: - UI 만들기
    let addButton : UIButton = {
       let button = UIButton()
        button.setTitle("추가하기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    // UITextField란 ?
    // 사용자가 텍스트를 입력할 수 있는 기능 제공
    // placeholder로 입력하기 전에 보이는 메세지 띄우기 
    var nameField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력해주세요"
        textField.backgroundColor = UIColor.white
        textField.textColor = .black
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1.0
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
       

        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    var ageField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "나이를 입력해주세요"
        textField.backgroundColor = UIColor.white
        textField.textColor = .black
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1.0
        
        textField.autocorrectionType = .no
           textField.spellCheckingType = .no
       
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var partField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "파트를 입력해주세요"
        textField.backgroundColor = UIColor.white
        textField.textColor = .black
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1.0
        
        textField.autocorrectionType = .no
           textField.spellCheckingType = .no
       

        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    
    
    
    let viewController : ViewController
    
    init(viewController : ViewController){
        self.viewController = viewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    // MARK: - UI 구현
    override func viewDidLoad() {
        view.backgroundColor = .white
        setUI()
        addButton.addTarget(self, action: #selector(touchUpDismissModalButton), for: .touchUpInside)
        
    }
    
    func setUI() {
        // ui 올리기
        view.addSubview(addButton)
        view.addSubview(nameField)
        view.addSubview(ageField)
        view.addSubview(partField)
        textFieldColor()
       
        // 오토레이아웃 잡기
        NSLayoutConstraint.activate([
            
            nameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 100),
            nameField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            
            ageField.topAnchor.constraint(equalTo: nameField.bottomAnchor , constant: 25),
            ageField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            ageField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            partField.topAnchor.constraint(equalTo: ageField.bottomAnchor , constant: 25),
            partField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            partField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),

        ])
        
    }
    
    // textField의 placeholder 글자 색 바꾸기
    func textFieldColor(){
        if let placeholder = nameField.placeholder {
            let attributes = [
                NSAttributedString.Key.foregroundColor: UIColor.gray, // 원하는 색상으로 변경
                NSAttributedString.Key.strokeColor : UIColor.gray
            ]
            nameField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        }
        
        
        if let placeholder = ageField.placeholder {
            let attributes = [
                NSAttributedString.Key.foregroundColor: UIColor.gray, // 원하는 색상으로 변경
                NSAttributedString.Key.strokeColor : UIColor.gray
            ]
            ageField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        }
        
        
        if let placeholder = partField.placeholder {
            let attributes = [
                NSAttributedString.Key.foregroundColor: UIColor.gray, // 원하는 색상으로 변경
                NSAttributedString.Key.strokeColor : UIColor.gray
            ]
            partField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        }
        
        
    }
    
    
    

    
    // MARK: - POST 함수 만들기
    
    func postRequest(_ member: Data ){
        // url 생성하기
        guard let url = URL(string: "https://pard-host.onrender.com/pard") else{
            print("🚨 Invalid URL!")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("applicaition/json", forHTTPHeaderField: "Content-Type")
        
        do{
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(member)
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request){data, response, error in
                if let error = error {
                    print("🚨 error", error)
                    
                }else if let data = data {
                    if let respondString = String(data: data, encoding: .utf8){
                        print("🟢response: \(respondString)")
                        DispatchQueue.main.async{
                        self.viewController.readData()
                        }
                    }
                  }
                }
                task.resume()
            }catch{
                print("🚨 error", error)
            }
        }
        
        
        
        
        
        
        // 추가하기 함수
        @objc func touchUpDismissModalButton(){
            // 제대로 textfield에 쳤는지 확인하기
            guard let name = nameField.text, !name.isEmpty,
                  let part = partField.text, !part.isEmpty,
                  let ageStr = ageField.text, !ageStr.isEmpty,
                  let age = Int(ageStr) else {
                        let alert = UIAlertController(title: title, message: "다시 입력해주세요", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                return
            }
            
            
            let newMember = Data(name: name, part: part, age: age)
            postRequest(newMember )
            dismiss(animated: true)
//            self.dismiss(animated: true, completion: nil)
            
        }
        

        
        
        
    }

//
//  CollectionViewTableViewCelll.swift
//  netflix_pr
//
//  Created by 김민준 on 4/4/24.
//

import UIKit

class CollectionViewTableViewCell : UITableViewCell{
    var numberInSection : Int?
    static let identifier = "CollectionViewTableViewCell"
    // 식별자 요렇게도 지정 가능
    
// 콜렉션 뷰 만들기
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collecitonView = UICollectionView(frame: .zero, collectionViewLayout: layout )
        collecitonView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collecitonView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        contentView.addSubview(collectionView)
        // 콜렉션 뷰 델리게이트, 데이타 소스
        collectionView.delegate = self
        collectionView.dataSource =  self
        collectionView.backgroundColor = .black
//        collectionView.register(DemoCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func getSectionNumber(num : Int) {
        numberInSection = num
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
}


extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    // 셀 불러오기
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let target = MockData.modeling[numberInSection ?? 0][indexPath.item]
        print(target.image)
        cell.configureImage(imageName: target.image)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MockData.modeling[numberInSection ?? 0].count
    }
}

class CollectionViewCell : UICollectionViewCell {
    
    let image : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
       return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configureImage(imageName : String) {
        image.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
    }
    
    func setUI() {
        contentView.addSubview(image)
        NSLayoutConstraint.activate(
            [
                image.topAnchor.constraint(equalTo: contentView.topAnchor),
                image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ]
        )
    }
    
   
}



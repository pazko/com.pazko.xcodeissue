//
//  ViewController.swift
//  xcode_issue
//
//  Created by 박동혁 on 3/11/25.
//

import UIKit
import SnapKit
import Then
import Reusable

class MainViewController: UIViewController {
    
    private let flowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: flowLayout
    ).then {
        $0.dataSource = self
        $0.delegate = self
        $0.register(cellType: EmptyCell.self)
    }
    
    private var animator: UIViewPropertyAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        setupLayout()
    }
    
    private func setupUI() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}

// MARK: issue 모음
extension MainViewController {
    private func testOpenUrl(_ urlString: String) {
        if let url = URL(string: urlString) {
//            UIApplication.shared.open(url) // XCode16, iOS 18, deprecated func 인식 아래의 func 이용
            
            UIApplication.shared.open(url, options: [:])
            
            UIApplication.shared.open(url) { result in
                if result {
                    
                }
            }
        }
    }
    
    private func animatingCollection(index: Int) {
        animator = .init(duration: 0.5, curve: .linear) { [weak self] in
            guard let self = self else { return }
            
            // cell 너비가 화면 너비랑 같을때 애니메이션 시작시 이미지뷰 백화현상
//            collectionView.scrollToItem(
//                at: IndexPath(item: index, section: 0),
//                at: .centeredHorizontally,
//                animated: false
//            )
            
            // 우회방법
            collectionView.setContentOffset(
                .init(x: CGFloat(index) * collectionView.bounds.width - 0.3, y: 0),
                animated: false
            )
        }
        
        animator?.startAnimation()
        
        animator?.addCompletion { position in
            if case .end = position {
                
            }
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // let _ = collectionView.dequeueReusableCell(withReuseIdentifier: "EmptyCell", for: indexPath) as? EmptyCell // 재 사용하지 않는 dequeueCell 호출시 crash 발생 해당 func 외부 사용 금지 UITableView 동일 issue
        
        let reusableCell: EmptyCell = collectionView.dequeueReusableCell(for: indexPath) // 간편하게 reusable 사용권장
        return reusableCell
    }
}

extension MainViewController: UICollectionViewDelegate {
    
}


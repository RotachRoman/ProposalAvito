//
//  ProposalViewController.swift
//  ProposalAvito
//
//  Created by Rotach Roman on 07.01.2021.
//

import UIKit

final class ProposalViewController: UIViewController {
    
    var proposalManager: ProposalManager!
    var dataProvider: DataProvider!
    var collectionView: UICollectionView!
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let width = view.bounds.size.width
        layout.estimatedItemSize = CGSize(width: width, height: 10)
        return layout
    }()
    let headTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.numberOfLines = 0
        return label
    }()
    var cancelButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "CloseIconTemplate")
        button.setImage(image, for: .normal)
        button.isEnabled = false
        return button
    }()
    let chooseButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 1/255, green: 172/255, blue: 255/255, alpha: 1)
        button.addTarget(self, action: #selector(chooseAction), for: .touchUpInside)
        return button
    }()
    
    override func loadView() {
        super.loadView()
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        addSubviews()
        setupConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    
//        dataFileManager = NetworkService()
        
        guard let headProposal = proposalManager.headProposal() else {
            print("Head Proposal equeal nil")
            return
        }
        configure(headProposal: headProposal)
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        
        proposalManager = ProposalManager()
        
        dataProvider = DataProvider()
        dataProvider.proposalManager = proposalManager
        collectionView.delegate = dataProvider
        collectionView.dataSource = dataProvider
        collectionView.register(ProposalCell.self, forCellWithReuseIdentifier: String(describing: ProposalCell.self))
        
        proposalManager.parserDataWithFile(fileName: "result")
    }
    
    func configure(headProposal: HeadProposal) {
        self.headTitleLabel.text = headProposal.mainTitle
        self.chooseButton.setTitle(headProposal.titleActionButton, for: .normal)
    }
    
    @objc
    private func chooseAction() {
        var title: String
        let headProposal = proposalManager.headProposal()
        if proposalManager.chooseItem() != nil {
            title = proposalManager.chooseItem()!.title
        } else {
            title = headProposal!.actionTitle
        }
        let alertController = UIAlertController(title: title, message: .none, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Продолжить", style: .default, handler: .none)
        let cancelAction = UIAlertAction(title: "Вернуться", style: .cancel, handler: .none)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func setupConstraints(){
        let safe = view.safeAreaLayoutGuide
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.topAnchor.constraint(equalTo: safe.topAnchor, constant: 17).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: safe.leadingAnchor, constant: 12).isActive = true
        // No Test
        cancelButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        headTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        headTitleLabel.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 36).isActive = true
        headTitleLabel.leadingAnchor.constraint(equalTo: safe.leadingAnchor, constant: 16.5).isActive = true
        headTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: safe.trailingAnchor, constant: -16.5).isActive = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: headTitleLabel.bottomAnchor, constant: 33).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: safe.leadingAnchor, constant: 16.5).isActive = true
        collectionView.bottomAnchor.constraint(greaterThanOrEqualTo: chooseButton.topAnchor, constant: -18).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: safe.trailingAnchor, constant: -16.5).isActive = true
        
        chooseButton.translatesAutoresizingMaskIntoConstraints = false
        chooseButton.leadingAnchor.constraint(equalTo: safe.leadingAnchor, constant: 16).isActive = true
        chooseButton.bottomAnchor.constraint(equalTo: safe.bottomAnchor, constant: -16).isActive = true
        chooseButton.trailingAnchor.constraint(equalTo: safe.trailingAnchor, constant: -17).isActive = true
        // No Test
        chooseButton.heightAnchor.constraint(equalToConstant: 49).isActive = true
    }
    
    private func addSubviews(){
        self.view.backgroundColor = .white
        [headTitleLabel, cancelButton, collectionView, chooseButton].forEach { element in
            view.addSubview(element)
        }
    }
}

extension ProposalViewController {
    override var prefersStatusBarHidden: Bool {
        return true
    }
}


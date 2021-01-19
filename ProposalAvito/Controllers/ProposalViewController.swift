//
//  ProposalViewController.swift
//  ProposalAvito
//
//  Created by Rotach Roman on 07.01.2021.
//

import UIKit

class ProposalViewController: UIViewController {
    
    var dataProvider: DataProvider!
    let headTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.numberOfLines = 0
        return label
    }()
    var cancelImageView: UIImageView!
    var collectionView: UICollectionView!
    var dataFileManager: ParserJSONFileManager!
    
    let chooseButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 1/255, green: 172/255, blue: 255/255, alpha: 1)
        button.addTarget(self, action: #selector(chooseAction), for: .touchUpInside)
        return button
    }()
    var proposalManager: ProposalManager!
    
    override func loadView() {
        super.loadView()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        addCancelImage()
        
        addSubviews()
        setupConstraints()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        
        proposalManager = ProposalManager()
        
        dataProvider = DataProvider()
        dataProvider.proposalManager = proposalManager
        collectionView.delegate = dataProvider
        collectionView.dataSource = dataProvider
        collectionView.register(ProposalCell.self, forCellWithReuseIdentifier: String(describing: ProposalCell.self))
        
        proposalManager.parserDataWithFile(fileName: "result")
        dataFileManager = ParserJSONFileManager()
        guard let headProposal = proposalManager.headProposal()
        else {
            print("Head Proposal equeal nil")
            return
        }
        configure(headProposal: headProposal)
    }
    func configure(headProposal: HeadProposal) {
        self.headTitleLabel.text = headProposal.mainTitle
        self.chooseButton.setTitle(headProposal.titleActionButton, for: .normal)
    }
    
    @objc func chooseAction() {
        var title: String
        let headProposal = proposalManager.headProposal()
        if (proposalManager.chooseItem() != nil) {
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
    
    func addCancelImage() {
        let image = UIImage(named: "CloseIconTemplate")
        cancelImageView = UIImageView(image: image)
    }
    
    func setupConstraints(){
        let safe = view.safeAreaLayoutGuide
        
        cancelImageView.translatesAutoresizingMaskIntoConstraints = false
        cancelImageView.topAnchor.constraint(equalTo: safe.topAnchor, constant: 17).isActive = true
        cancelImageView.leadingAnchor.constraint(equalTo: safe.leadingAnchor, constant: 12).isActive = true
        // No Test
        cancelImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        cancelImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        headTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        headTitleLabel.topAnchor.constraint(equalTo: cancelImageView.bottomAnchor, constant: 38).isActive = true
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
    
    func addSubviews(){
        self.view.backgroundColor = .white
        view.addSubview(headTitleLabel)
        view.addSubview(cancelImageView)
        view.addSubview(collectionView)
        view.addSubview(chooseButton)
    }
}

extension ProposalViewController {
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

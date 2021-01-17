//
//  ProposalCell.swift
//  ProposalAvito
//
//  Created by Rotach Roman on 08.01.2021.
//

import UIKit

class ProposalCell: UICollectionViewCell {
    
    var markImageView: UIImageView = {
        let markImage = UIImage(named: "checkmark")
        let imageView = UIImageView(image: markImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        let attributedString = NSMutableAttributedString(string: "Your text")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2.8
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        label.attributedText = attributedString
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(iconImageView)
        contentView.addSubview(markImageView)
    }
    
    func setupConstraints() {
        let safe = self.contentView.safeAreaLayoutGuide
        
        iconImageView.topAnchor.constraint(equalTo: safe.topAnchor, constant: 17).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: safe.leadingAnchor, constant: 17).isActive = true
        //Hasn't Unit Test wight and height
        iconImageView.widthAnchor.constraint(equalToConstant: 55).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        markImageView.topAnchor.constraint(equalTo: safe.topAnchor, constant: 34).isActive = true
        markImageView.trailingAnchor.constraint(equalTo: safe.trailingAnchor, constant: -15).isActive = true
        //Hasn't Unit Test wight and height
        markImageView.widthAnchor.constraint(equalToConstant: 21).isActive = true
        markImageView.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: safe.topAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: markImageView.leadingAnchor, constant: -22).isActive = true
        ///
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: markImageView.leadingAnchor, constant: -22).isActive = true
        
        priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 14).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: safe.bottomAnchor, constant: -20).isActive = true
//        priceLabel.trailingAnchor.constraint(lessThanOrEqualTo: markImageView.leadingAnchor, constant: -22).isActive = true
        
        contentView.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 22).isActive = true
    }
    
    func configure(withProposal proposal: Proposal) {
        self.titleLabel.text = proposal.title
        self.descriptionLabel.text = proposal.description
        self.priceLabel.text = proposal.price
        self.markImageView.isHidden = !proposal.isSelect
        guard let imageUrl = proposal.icon?.the52X52 else { return }
        conversionURLToImage(urlString: imageUrl)
    }
    
    private var isHeightCalculated: Bool? = false
     override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
         //Exhibit A - We need to cache our calculation to prevent a crash.
         if !isHeightCalculated! {
             setNeedsLayout()
             layoutIfNeeded()
             let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
             var newFrame = layoutAttributes.frame
             newFrame.size.width = CGFloat(ceilf(Float(size.width)))
             layoutAttributes.frame = newFrame
             isHeightCalculated = true
         }
         return layoutAttributes
     }
 }

extension ProposalCell {
    func conversionURLToImage(urlString: String){
        guard let url = URL(string: urlString) else { return }
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, _, error) in
            if (error != nil){
                print("Error with url photo 52X52")
                return
            }
            
            if let data = data,
               let image = UIImage(data: data){
                DispatchQueue.main.async {
                    self.iconImageView.image = image
                }
            }
        }.resume()
    }
}

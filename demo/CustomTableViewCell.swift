//
//  CustomTableViewCell.swift
//  demo
//
//  Created by RNTBCI45 on 14/02/19.
//  Copyright © 2019 demo. All rights reserved.
//

import UIKit
import SDWebImage

class CustomTableViewCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let detailLabel = UILabel()
    let sdImageView = UIImageView()
    let stackViewLabels = UIStackView()
    let containerStackView = UIStackView()

    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        stackViewLabels.addArrangedSubview(nameLabel)
        stackViewLabels.addArrangedSubview(detailLabel)
        stackViewLabels.alignment = .fill
        stackViewLabels.distribution = .fill
        stackViewLabels.spacing = 5
        stackViewLabels.axis = .vertical
        
        containerStackView.addArrangedSubview(sdImageView)
        containerStackView.addArrangedSubview(stackViewLabels)
        containerStackView.axis = .horizontal
        containerStackView.spacing = 10
        contentView.addSubview(containerStackView)

        // configure titleLabel
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        containerStackView.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        containerStackView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        containerStackView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        nameLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        nameLabel.setContentHuggingPriority(.required, for: .vertical)

        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.numberOfLines = 0
        detailLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        detailLabel.setContentHuggingPriority(.required, for: .vertical)

        detailLabel.font = UIFont(name: "Avenir-Book", size: 12)
        detailLabel.textColor = UIColor.lightGray
        
        // Configure imageview
        sdImageView.translatesAutoresizingMaskIntoConstraints = false
        sdImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        sdImageView.contentMode = .scaleAspectFit

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = ""
        detailLabel.text = ""
        sdImageView.sd_cancelCurrentAnimationImagesLoad()
        sdImageView.sd_cancelCurrentImageLoad()
        sdImageView.image = nil
        sdImageView.frame.size = CGSize.init(width: sdImageView.frame.size.width, height: 60)
        self.frame.size = CGSize.init(width: self.frame.size.width, height: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

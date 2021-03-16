//
//  CustomTableViewCell.swift
//  WeatherApp
//
//  Created by Hellizar on 16.03.21.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {

    static var identifier = "CustomTableViewCell"

    //MARK: - GUI Variables
    private let weatherImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .red
        return view
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "21.00"
        return label
    }()

    private let conditionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "sunny"
        return label
    }()

    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "23"
        return label
    }()

    private let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        //stack.alignment = .fill
        //stack.distribution = .fillEqually
        stack.backgroundColor = .secondarySystemBackground
        return stack
    }()

    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(horizontalStack)
        horizontalStack.addArrangedSubviews([weatherImage,
                                             verticalStack,
                                             temperatureLabel])
        verticalStack.addArrangedSubviews([timeLabel, conditionLabel])
        selectionStyle = .blue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        configureConstraints()
    }

    private func configureConstraints() {
        horizontalStack.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }

        weatherImage.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.top.left.bottom.equalToSuperview()
        }

        verticalStack.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(weatherImage.snp.right)
            make.right.equalTo(temperatureLabel.snp.left)
        }

        temperatureLabel.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.width.height.equalTo(weatherImage)
        }
    }

    public func configure() {

    }
}

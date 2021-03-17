//
//  TodayViewController.swift
//  WeatherApp
//
//  Created by Hellizar on 16.03.21.
//

import UIKit
import SnapKit

class TodayViewController: UIViewController {

    //MARK: GUI Variables
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.textAlignment = .center
        return label
    }()

    private let colorLine: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "rainbow")
        view.contentMode = .scaleToFill
        return view
    }()

    private let grayLine: [UIImageView] = {
        var viewArray = [UIImageView]()
        for _ in 0...1 {
            let view = UIImageView()
            view.backgroundColor = .gray
            view.contentMode = .scaleToFill
            viewArray.append(view)
        }
        return viewArray
    }()

    private let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()

    private let topStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()

    private let midStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()

    private let secondMidStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }()

    private let horizontalMidStack: [UIStackView] = {
        var stacks = [UIStackView]()
        for _ in 0...1 {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.alignment = .fill
            stack.distribution = .fillEqually
            stacks.append(stack)
        }
        return stacks
    }()

    private let verticalStackWithImageAndLabel: [UIStackView] = {
        var stacks = [UIStackView]()
        for _ in 0...4 {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.alignment = .center
            stack.distribution = .equalCentering
            stack.spacing = 10
            stacks.append(stack)
        }
        return stacks
    }()

    private let littleImages: [UIImageView] = {
        var images = [UIImageView]()
        for _ in 0...4 {
            let imageView = UIImageView()
            imageView.image?.withTintColor(.systemYellow)
            images.append(imageView)
        }
        return images
    }()

    private let littleLabels: [UILabel] = {
        var labels = [UILabel]()
        for _ in 0...4 {
            let label = UILabel()
            label.text = "ahah"
            labels.append(label)
        }
        return labels
    }()

    private let shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("Share", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        return button
    }()

    private let bigImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "sun.max")
        view.tintColor = .systemYellow
        return view
    }()

    private let placeLabel: UILabel = {
        let label = UILabel()
        label.text = "London, UK"
        label.textAlignment = .center
        return label
    }()

    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "22°С | Sunny"
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()

    private let stackForOnline: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 30
        return stack
    }()

    private let online: [UIImageView] = {
        var views = [UIImageView]()
        let view1 = UIImageView()
        view1.image = UIImage(named: "online")
        views.append(view1)
        let view2 = UIImageView()
        views.append(view2)
        return views
    }()

    var presenter: TodayViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        initViews()
    }

    private func initViews() {
        view.addSubviews([headerLabel, colorLine, mainStack])
        mainStack.addArrangedSubviews([topStack, midStack, shareButton])
        topStack.addArrangedSubviews([bigImage, stackForOnline, temperatureLabel])
        stackForOnline.addArrangedSubviews([online[0], placeLabel, online[1]])
        midStack.addArrangedSubviews([grayLine[0], secondMidStack, grayLine[1]])
        secondMidStack.addArrangedSubviews([horizontalMidStack[0], horizontalMidStack[1]])
        horizontalMidStack[0].addArrangedSubviews([verticalStackWithImageAndLabel[0],
                                                   verticalStackWithImageAndLabel[1],
                                                   verticalStackWithImageAndLabel[2]])
        horizontalMidStack[1].addArrangedSubviews([verticalStackWithImageAndLabel[3],
                                                   verticalStackWithImageAndLabel[4]])

        for element in 0...4 {
            verticalStackWithImageAndLabel[element].addArrangedSubviews([littleImages[element],
                                                                 littleLabels[element]])
        }

        makeConstraints()
    }

    private func makeConstraints() {
        let myOffset: Int = 10

        headerLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(myOffset)
            make.height.equalTo(myOffset * 2)
            make.left.right.equalToSuperview()
        }

        colorLine.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(myOffset)
            make.left.right.equalToSuperview()
            make.height.equalTo(4)
        }

        mainStack.snp.makeConstraints { make in
            make.top.equalTo(colorLine.snp.bottom).offset(myOffset)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(myOffset)
        }

        topStack.snp.makeConstraints { make in
            make.height.equalTo(mainStack.snp.height).multipliedBy(0.5)
        }

        midStack.snp.makeConstraints { make in
            make.height.equalTo(mainStack.snp.height).multipliedBy(0.3)
        }

        grayLine[0].snp.makeConstraints { make in
            make.top.equalTo(midStack.snp.top).offset(myOffset)
            make.height.equalTo(2)
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width).multipliedBy(0.6)
        }

        grayLine[1].snp.makeConstraints { make in
            make.bottom.equalTo(midStack.snp.bottom)
            make.height.equalTo(2)
            make.width.equalTo(view.snp.width).multipliedBy(0.6)
        }

        secondMidStack.snp.makeConstraints { make in
            make.left.right.equalTo(midStack)
            make.top.equalTo(grayLine[0].snp.bottom)
            make.bottom.equalTo(grayLine[1].snp.top)
        }

        horizontalMidStack[0].snp.makeConstraints { make in
            make.top.equalTo(grayLine[0].snp.bottom).offset(myOffset)
            make.left.right.equalToSuperview()
        }

        horizontalMidStack[1].snp.makeConstraints { make in
            make.bottom.equalTo(grayLine[1].snp.top).offset(-myOffset)
            make.width.equalTo(horizontalMidStack[0].snp.width).multipliedBy(0.66)
            make.centerX.equalTo(view)
        }

        for element in 0...4 {
            littleImages[element].snp.makeConstraints { make in
                make.top.equalTo(verticalStackWithImageAndLabel[element].snp.top)
                make.bottom.equalTo(littleLabels[element].snp.top)
                make.width.equalTo(littleImages[element].snp.height)
            }
        }

        bigImage.snp.makeConstraints { make in
            make.top.equalTo(topStack).inset(myOffset*2)
            make.centerX.equalTo(topStack)
            make.width.height.equalTo(topStack.snp.height).multipliedBy(0.5)
        }
        stackForOnline.snp.makeConstraints { make in

            make.top.equalTo(bigImage.snp.bottom).offset(myOffset)
            make.height.equalTo(myOffset*4)
        }

        online[0].snp.makeConstraints { make in
            make.width.height.equalTo(15)
        }

        online[1].snp.makeConstraints { make in
            make.width.height.equalTo(15)
        }

        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(placeLabel.snp.bottom)
            make.bottom.equalTo(topStack.snp.bottom).inset(50)
            make.width.equalTo(topStack)
        }
    }
}

extension TodayViewController: TodayViewProtocol {
    func configureView(with model: Welcome) {
        bigImage.image = bigImage.donwload("\(model.list[0].weather[0].icon)")
        placeLabel.text = "\(model.city.name), \(model.city.country)"
        temperatureLabel.text = "\(model.list[0].main.temp)°С | \(model.list[0].weather[0].weatherDescription)"

        littleImages[0].image = UIImage(systemName: "cloud.rain")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
        littleImages[1].image = UIImage(systemName: "drop")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
        littleImages[2].image = UIImage(systemName: "lineweight")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
        littleImages[3].image = UIImage(systemName: "wind")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
        littleImages[4].image = UIImage(systemName: "circle")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)

        littleLabels[0].text = "\(model.list[0].main.humidity) %"
        littleLabels[1].text = "\(model.list[0].rain?.the3H ?? 0) mm"
        littleLabels[2].text = "\(model.list[0].main.pressure) hPa"
        littleLabels[3].text = "\(model.list[0].wind.speed) km/h"
        littleLabels[4].text = "\(model.list[0].wind.deg) °"
    }
}

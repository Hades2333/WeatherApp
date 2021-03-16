//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by Hellizar on 16.03.21.
//

import UIKit

class ForecastViewController: UIViewController {

    //MARK: GUI Variables
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Тут должен быть город"
        label.textAlignment = .center
        return label
    }()

    private let colorLine: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "rainbow")
        view.contentMode = .scaleToFill
        return view
    }()

    private let table: UITableView = {
        let table = UITableView()
        table.backgroundColor = .orange
        return table
    }()

    var presenter: ForecastViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        initViews()
    }

    private func initViews() {
        view.addSubviews([headerLabel, colorLine, table])
        makeConstraints()
    }

    private func makeConstraints() {
        headerLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.left.right.equalToSuperview()
        }

        colorLine.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(4)
        }

        table.snp.makeConstraints { make in
            make.top.equalTo(colorLine.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension ForecastViewController: ForecastViewProtocol {

}



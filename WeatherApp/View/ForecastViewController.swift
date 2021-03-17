//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by Hellizar on 16.03.21.
//

import UIKit

class ForecastViewController: UIViewController {

    struct ForTable {
        var image: UIImage
        var time: String
        var description: String
        var temperature: String
    }
    
    var tempModel = [ForTable]()

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
        table.backgroundColor = .secondarySystemBackground
        table.register(CustomTableViewCell.self,
                       forCellReuseIdentifier: CustomTableViewCell.identifier)
        return table
    }()

    var presenter: ForecastViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        initViews()
        configureTableView()
    }

    private func configureTableView() {
        table.dataSource = self
        table.delegate = self
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

extension ForecastViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tempModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            fatalError("custom cell not found")
        }
        cell.configure(with: tempModel[indexPath.row].image,
                       time: tempModel[indexPath.row].time,
                       description: tempModel[indexPath.row].description,
                       temperature: tempModel[indexPath.row].temperature)

        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
}

extension ForecastViewController: ForecastViewProtocol {
    func configureView(with model: Welcome) {

        //MARK: - Создать свой массив картинок
        var weatherImages = [UIImage]()
        for element in 0...39 {
            let myImage = UIImage.donwload("\(model.list[element].weather[0].icon)") ?? UIImage(systemName: "sun.max")
            weatherImages.append(myImage!)
        }

        //MARK: - Передать нужные данные из model в свою конструкцию
        for element in 0...39 {
            tempModel.append(ForTable(image: weatherImages[element],
                                time: "\(Date())",
                                description: "\(model.list[element].weather[0].weatherDescription)",
                                temperature: "\(model.list[element].main.temp)"))
        }

        //MARK: - Из своей конструкции поочереди засетать каждую ячейку таблицы
        //для этого сделать специальный конфигуратор
        //подумать над датой

        print(tempModel[2])

        //MARK: - Обновить таблицу
        table.reloadData()
    }
}


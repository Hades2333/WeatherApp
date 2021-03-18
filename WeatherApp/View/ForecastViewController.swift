//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by Hellizar on 16.03.21.
//

import UIKit

class ForecastViewController: UIViewController {
    
    //MARK: - Struct
    struct ForTable {
        var image: UIImage
        var time: String
        var description: String
        var temperature: String
    }
    
    //MARK: - Properties
    var tempModel = [ForTable]()
    var presenter: ForecastViewPresenterProtocol!
    
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
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        initViews()
        configureTableView()
    }
    
    //MARK: - Methods
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

//MARK: - UITableViewDataSource and UITableViewDelegate
extension ForecastViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard !tempModel.isEmpty else {
            return ""
        }
        if section == 0 {
            return "Today"
        } else {
            return calculateHeaders()[section]
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard !tempModel.isEmpty else {
            return 0
        }
        return countSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard !tempModel.isEmpty else {
            return 0
        }
        return calculateNumberOfRowPerSection()[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            fatalError("custom cell not found")
        }
        
        guard !tempModel.isEmpty else {
            return UITableViewCell()
        }
        
        let extra = calculateNumberOfRowPerSection()
        switch indexPath.section {
        case 0:
            cell.configure(with: tempModel[indexPath.row].image,
                           time: String.convert(date: tempModel[indexPath.row].time),
                           description: tempModel[indexPath.row].description,
                           temperature: tempModel[indexPath.row].temperature)
            return cell
        case 1:
            let extraRows = extra[0]
            cell.configure(with: tempModel[indexPath.row+extraRows].image,
                           time: String.convert(date: tempModel[indexPath.row+extraRows].time),
                           description: tempModel[indexPath.row+extraRows].description,
                           temperature: tempModel[indexPath.row+extraRows].temperature)
            return cell
        case 2:
            let extraRows = extra[1] + extra[0]
            cell.configure(with: tempModel[indexPath.row+extraRows].image,
                           time: String.convert(date: tempModel[indexPath.row+extraRows].time),
                           description: tempModel[indexPath.row+extraRows].description,
                           temperature: tempModel[indexPath.row+extraRows].temperature)
            return cell
        case 3:
            let extraRows = extra[2] + extra[1] + extra[0]
            cell.configure(with: tempModel[indexPath.row+extraRows].image,
                           time: String.convert(date: tempModel[indexPath.row+extraRows].time),
                           description: tempModel[indexPath.row+extraRows].description,
                           temperature: tempModel[indexPath.row+extraRows].temperature)
            return cell
        case 4:
            let extraRows = extra[3] + extra[2] + extra[1] + extra[0]
            cell.configure(with: tempModel[indexPath.row+extraRows].image,
                           time: String.convert(date: tempModel[indexPath.row+extraRows].time),
                           description: tempModel[indexPath.row+extraRows].description,
                           temperature: tempModel[indexPath.row+extraRows].temperature)
            return cell
        case 5:
            let extraRows = extra[4] + extra[3] + extra[2] + extra[1] + extra[0]
            cell.configure(with: tempModel[indexPath.row+extraRows].image,
                           time: String.convert(date: tempModel[indexPath.row+extraRows].time),
                           description: tempModel[indexPath.row+extraRows].description,
                           temperature: tempModel[indexPath.row+extraRows].temperature)
            return cell
        case 6:
            let extraRows = extra[5] + extra[4] + extra[3] + extra[2] + extra[1] + extra[0]
            cell.configure(with: tempModel[indexPath.row+extraRows].image,
                           time: String.convert(date: tempModel[indexPath.row+extraRows].time),
                           description: tempModel[indexPath.row+extraRows].description,
                           temperature: tempModel[indexPath.row+extraRows].temperature)
            return cell
        default:
            cell.configure(with: tempModel[indexPath.row].image,
                           time: String.convert(date: tempModel[indexPath.row].time),
                           description: tempModel[indexPath.row].description,
                           temperature: tempModel[indexPath.row].temperature)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
    
    func countSections() -> Int {
        var number = 1
        var date = String.convertToDay(date: tempModel[0].time)
        for element in 0...39 {
            let newDate = String.convertToDay(date: tempModel[element].time)
            if newDate == date {
            } else {
                number += 1
                date = newDate
            }
        }
        return number
    }
    
    func calculateHeaders() -> [String] {
        var array = [String]()
        array.append(String.convertToDay(date: tempModel[0].time))
        
        for element in 0...39 {
            let day = String.convertToDay(date: tempModel[element].time)
            if !array.contains(day) {
                array.append(day)
            }
        }
        return array
    }
    
    func calculateNumberOfRowPerSection() -> [Int] {
        var array = [Int]()
        
        var number = 0
        var comparableDay = String.convertToDay(date: tempModel[0].time)
        for element in 0...39 {
            let currentDay = String.convertToDay(date: tempModel[element].time)
            if element == 39, number != 0, currentDay == comparableDay {
                number += 1
                array.append(number)
            } else if currentDay == comparableDay {
                number += 1
            } else {
                array.append(number)
                number = 1
                comparableDay = currentDay
            }
        }
        return array
    }
}

//MARK: - ForecastViewProtocol
extension ForecastViewController: ForecastViewProtocol {
    func configureView(with model: Welcome) {
        
        self.headerLabel.text = "\(model.city.name)"
        
        var weatherImages = [UIImage]()
        for element in 0...39 {
            let myImage = UIImage.donwload("\(model.list[element].weather[0].icon)") ?? UIImage(systemName: "sun.max")
            weatherImages.append(myImage!)
        }
        
        for element in 0...39 {
            tempModel.append(ForTable(image: weatherImages[element],
                                      time: model.list[element].dtTxt,
                                      description: "\(model.list[element].weather[0].weatherDescription)",
                                      temperature: "\(model.list[element].main.temp)"))
        }
        table.reloadData()
    }
}


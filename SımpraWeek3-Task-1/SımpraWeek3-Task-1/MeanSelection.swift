//
//  MeanSelection.swift
//  SımpraWeek3-Task-1
//
//  Created by YILDIRIM on 22.12.2022.
//

import UIKit

protocol MeansSelectionDelegate {
    func didSelectMeans(name:String,imageName:String)
}

class MeansSelectionVC: UIViewController {
    
    let bicycleButton = UIButton()
    let motorcycleButton = UIButton()
    let carButton = UIButton()
    
    var delegate : MeansSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        
    }
    
    @objc func bicycleButtonTapped() {
        delegate?.didSelectMeans(name: "Bicycle", imageName: "bicycle")
        dismiss(animated: true)
    }
    
    @objc func motorcycleButtonTapped() {
        delegate?.didSelectMeans(name: "Motorcycle", imageName: "motorcycle")
        dismiss(animated: true)
    }
    
    @objc func carButtonTapped() {
        delegate?.didSelectMeans(name: "Car", imageName: "car")
        dismiss(animated: true)
    }
    
    func  setupUI() {
        view.addSubview(bicycleButton)
        view.addSubview(carButton)
        view.addSubview(motorcycleButton)
        view.backgroundColor = .systemBackground
        
        bicycleButton.translatesAutoresizingMaskIntoConstraints = false
        carButton.translatesAutoresizingMaskIntoConstraints = false
        motorcycleButton.translatesAutoresizingMaskIntoConstraints = false
        
        

        
        bicycleButton.configuration = .tinted()
        bicycleButton.configuration?.title = "Bicycle"
        bicycleButton.configuration?.image = UIImage(systemName: "bicycle.circle")
        bicycleButton.configuration?.imagePadding = 8
        bicycleButton.configuration?.baseForegroundColor = .systemBlue
        bicycleButton.configuration?.baseBackgroundColor = .systemBlue
        bicycleButton.addTarget(self, action: #selector(bicycleButtonTapped), for: .touchUpInside)
        
        carButton.configuration = .tinted()
        carButton.configuration?.title = "Car"
        carButton.configuration?.image = UIImage(systemName: "car.circle")
        carButton.configuration?.imagePadding = 8
        carButton.configuration?.baseForegroundColor = .systemTeal
        carButton.configuration?.baseBackgroundColor = .systemTeal
        carButton.addTarget(self, action: #selector(carButtonTapped), for: .touchUpInside)
        
        motorcycleButton.configuration = .tinted()
        motorcycleButton.configuration?.title = "Motorcycle"
        motorcycleButton.configuration?.image = UIImage(systemName: "figure.outdoor.cycle")
        motorcycleButton.configuration?.imagePadding = 8
        motorcycleButton.configuration?.baseForegroundColor = .systemIndigo
        motorcycleButton.configuration?.baseBackgroundColor = .systemIndigo
        motorcycleButton.addTarget(self, action: #selector(motorcycleButtonTapped), for: .touchUpInside)
        
        let padding: CGFloat = 20

        NSLayoutConstraint.activate([
            bicycleButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            bicycleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bicycleButton.heightAnchor.constraint(equalToConstant: 50),
            bicycleButton.widthAnchor.constraint(equalToConstant: 280),

            carButton.bottomAnchor.constraint(equalTo: bicycleButton.topAnchor, constant: -padding),
            carButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            carButton.heightAnchor.constraint(equalToConstant: 50),
            carButton.widthAnchor.constraint(equalToConstant: 280),

            motorcycleButton.topAnchor.constraint(equalTo: bicycleButton.bottomAnchor, constant: padding),
            motorcycleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            motorcycleButton.heightAnchor.constraint(equalToConstant: 50),
            motorcycleButton.widthAnchor.constraint(equalToConstant: 280),
        ])
    }
    
}


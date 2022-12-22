//
//  ViewController.swift
//  Sımpra-Week3-HW
//
//  Created by YILDIRIM on 22.12.2022.
//

import UIKit

class ViewController: UIViewController,MeansSelectionDelegate {
   

    let meansImageview = UIImageView()
    let meansLabel = UILabel()
    let chooseMeandsBtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    func didSelectMeans(name: String, imageName: String) {
        meansLabel.text = name
        meansImageview.image = UIImage(named: imageName)
    }
    
    @objc func presentMeansSelectionVC(){
        let destinationVC = MeansSelectionVC()
        destinationVC.delegate = self
        
        destinationVC.modalPresentationStyle = .pageSheet
        destinationVC.sheetPresentationController?.detents = [.medium()]
        destinationVC.sheetPresentationController?.prefersGrabberVisible = true
        present(destinationVC, animated: true)
    }

    func setupUI() {
        view.addSubview(meansImageview)
        view.addSubview(meansLabel)
        view.addSubview(chooseMeandsBtn)
        
        meansImageview.translatesAutoresizingMaskIntoConstraints = false
        meansLabel.translatesAutoresizingMaskIntoConstraints = false
        chooseMeandsBtn.translatesAutoresizingMaskIntoConstraints = false
        
        meansImageview.image = UIImage(named: "allMeans")
        meansImageview.contentMode = .scaleAspectFit
        
        meansLabel.text = "Personal Means of Transport"
        meansLabel.textAlignment = .center
        meansLabel.font = .systemFont(ofSize: 20, weight: .medium)
        meansLabel.textColor = .darkGray
        
        chooseMeandsBtn.configuration = .tinted()
        chooseMeandsBtn.configuration?.title = "Choose Mean"
        chooseMeandsBtn.configuration?.image = UIImage(systemName: "figure.walk.circle")
        chooseMeandsBtn.configuration?.imagePadding = 8
        chooseMeandsBtn.addTarget(self, action: #selector(presentMeansSelectionVC), for: .touchUpInside)
        
        let padding: CGFloat = 20

        NSLayoutConstraint.activate([
           meansImageview.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
           meansImageview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           meansImageview.heightAnchor.constraint(equalToConstant: 225),
           meansImageview.widthAnchor.constraint(equalToConstant: 300),

            meansLabel.topAnchor.constraint(equalTo: meansImageview.bottomAnchor, constant: padding+20),
            meansLabel.centerXAnchor.constraint(equalTo: meansImageview.centerXAnchor),
            meansLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            meansLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),

            chooseMeandsBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            chooseMeandsBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseMeandsBtn.heightAnchor.constraint(equalToConstant: 50),
            chooseMeandsBtn.widthAnchor.constraint(equalToConstant: 260)
        ])
    }
}


//
//  ViewController.swift
//  SpringAnim
//
//  Created by Владимир Беляев on 10.01.2021.
//

import Spring

class ViewController: UIViewController {

    // MARK: - Properties
    private let mainColor: UIColor = .systemIndigo
    private let model = AnimationModel()

    // MARK: - Subviews
    private lazy var cardView: SpringView = {
        let view = SpringView()
        view.backgroundColor = mainColor
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = mainColor
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.6), for: .highlighted)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(didStartButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        addSubviews()
        setupSubviews()
        updateUIFromModel()
    }

}

// MARK: - Private methods
extension ViewController {
    @objc private func didStartButtonPressed(sender: UIButton) {
        cardView.animation = model.currentAnimationName
        cardView.curve = model.curve
        cardView.duration = model.duration
        cardView.force = model.force
        
        cardView.animate()
        model.update()
        updateUIFromModel()
    }
    
    private func updateUIFromModel() {
        infoLabel.text = """
            Animation name: \(model.currentAnimationName)
            Curve: \(model.curve)
            Duration: \(String(format: "%.4f", model.duration))
            Force: \(String(format: "%.4f", model.force))
            """
        startButton.setTitle("Next \(model.nextAnimationName)", for: .normal)
    }
    
    private func addSubviews() {
        view.addSubview(cardView)
        view.addSubview(startButton)
        cardView.addSubview(infoLabel)
    }
    
    private func setupSubviews() {
        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            cardView.heightAnchor.constraint(greaterThanOrEqualToConstant: 200),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32),
            infoLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            infoLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            infoLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            infoLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20)
        ])
    }
}

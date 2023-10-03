//
//  HomeViewController.swift
//  SwiftUI And UIKit Demo
//
//  Created by Daryl Gialolo on 3/8/23.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    private var subscriptions: Set<AnyCancellable> = .init()
    private let viewModel: AppViewModel = .init()

    // MARK: - UI
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let resetButton = ResetButtonView(action: reset).uiView
        resetButton.backgroundColor = .clear
        stackView.addArrangedSubview(resetButton)
        
        setupBindings()
    }
    
    // MARK: - Events
    @IBAction func cheerUp(_ sender: UIButton) {
        // moodLabel.text = "😁"
        viewModel.cheerUp()
    }
    
    func reset() {
        // moodLabel.text = "😔"
        viewModel.reset()
    }
    
    func setupBindings() {
        viewModel.$isHappy
            .sink { [weak self] in self?.moodLabel.text = $0 ? "😁" : "😔" }
            .store(in: &subscriptions)
        
        viewModel.$moodTitle
            .sink { [weak self] in self?.titleLabel.text = $0 }
            .store(in: &subscriptions)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "toSettings",
            let navController = segue.destination as? UINavigationController,
            let topVC = navController.viewControllers.first,
            let vc = topVC as? SettingsViewController
        else {
            return
        }
        vc.delegate = self
        vc.initialTitle = titleLabel.text ?? ""
    }
    
}

protocol SaveSettingsDelegate: AnyObject {
    func didChangeSettings(title: String) -> Void
}

extension HomeViewController: SaveSettingsDelegate {
    
    func didChangeSettings(title: String) {
        // titleLabel.text = title
        viewModel.saveMoodTitle(title)
    }
}

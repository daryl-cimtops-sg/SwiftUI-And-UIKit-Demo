//
//  SettingsViewController.swift
//  SwiftUI And UIKit Demo
//
//  Created by Daryl Gialolo on 7/8/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - UI
    weak var delegate: SaveSettingsDelegate?
    var initialTitle: String?
    @IBOutlet weak var titleTextField: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = initialTitle ?? ""
    }
    
    // MARK: - Events
    @IBAction func save(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text else {
            return
        }
        delegate?.didChangeSettings(title: title)
        dismiss(animated: true)
    }
}

//
//  SettingsScreen.swift
//  Rick & Morty
//
//  Created by Alisher Manatbek on 04.06.2023.
//

import UIKit
import SnapKit

class SettingsScreen: UIViewController {
    
    private let backroundColor = UIColor(named: "backgroundColor")
    private let bigTextColor = UIColor(named: "textColor")
    private let smallTextColor = UIColor(named: "miniTextColor")
    private let deviderColor = UIColor(named: "deviderColor")
    private let window = SceneDelegate.window
    private let fontName = "ProximaVara-Roman_Bold"
    

    
    
    
   
    private lazy var status1: UILabel = {
        let label = UILabel()
        let text = "Appearance"
        label.text = text.uppercased()
        label.font = UIFont(name: fontName, size: 10)
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.357, green: 0.412, blue: 0.459, alpha: 1)
        return label
    }()
    
    private lazy var colorPalette: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "paintpalette")
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var darkMode: UILabel = {
        let label = UILabel()
        label.text = "Dark mode"
        label.font = UIFont(name: fontName, size: 16)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    private lazy var darkModeDescription: UILabel = {
        let label = UILabel()
        label.text = "Follow the system settings"
        label.font = UIFont(name: fontName, size: 14)
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.431, green: 0.475, blue: 0.549, alpha: 0.6)
        return label
    }()
    
    private lazy var dropDownButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action:#selector(isTappedDropDownButton), for: .touchUpInside)
        return button
    }()
    
    
    @objc func isTappedDropDownButton(_ sender: Any){
        let alert = UIAlertController(title: "Dark mode", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)

        let on = UIAlertAction(title: "Turn on", style: UIAlertAction.Style.default, handler:{ UIAlertAction in self.darkModeDescription.text = "Turn on"
            self.window?.overrideUserInterfaceStyle = .dark
        })
        on.setValue(bigTextColor, forKey: "titleTextColor")
        alert.addAction(on)
        let off = UIAlertAction(title: "Turn off", style: UIAlertAction.Style.default, handler:{ UIAlertAction in self.darkModeDescription.text = "Turn off"
            self.window?.overrideUserInterfaceStyle = .light
        })
        off.setValue(bigTextColor, forKey: "titleTextColor")
        alert.addAction(off)
        let system = UIAlertAction(title: "Follow the system settings", style: UIAlertAction.Style.default, handler:{ UIAlertAction in self.darkModeDescription.text = "Follow the system settings"
            self.window?.overrideUserInterfaceStyle = .unspecified
        })
        system.setValue(bigTextColor, forKey: "titleTextColor")
        alert.addAction(system)
        self.present(alert, animated: true)

    }
    
    
    private lazy var devider2: UIView = {
        let view = UIView()
        view.backgroundColor = deviderColor
        return view
    }()
    
    private lazy var devider3: UIView = {
        let view = UIView()
        view.backgroundColor = deviderColor
        return view
    }()
    
    private lazy var status3: UILabel = {
        let label = UILabel()
        let text = "Version of app"
        label.text = text.uppercased()
        label.font = UIFont(name: fontName, size: 10)
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.357, green: 0.412, blue: 0.459, alpha: 1)
        return label
    }()
    
    private lazy var appVersion: UILabel = {
        let label = UILabel()
        label.text = "Nour  v1.0.0"
        label.font = UIFont(name: fontName, size: 16)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        makeConstraints()
        setUpColors()
    }
}
//MARK: - Setup View and Constraints
private extension SettingsScreen{
    
    func setUpColors(){
        view.backgroundColor = backroundColor
        
        darkMode.textColor = bigTextColor
        darkModeDescription.textColor = smallTextColor
        devider2.backgroundColor = deviderColor
        devider3.backgroundColor = deviderColor
        status1.textColor = smallTextColor
        status3.textColor = smallTextColor
        colorPalette.tintColor = bigTextColor
        dropDownButton.tintColor = bigTextColor
        appVersion.textColor = bigTextColor
    }
    func setUpViews(){

        view.addSubview(status1)
        view.addSubview(colorPalette)
        view.addSubview(darkMode)
        view.addSubview(darkModeDescription)
        view.addSubview(dropDownButton)
        view.addSubview(devider3)
        view.addSubview(status3)
        view.addSubview(appVersion)
    }
    func makeConstraints() {
        
        status1.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(16)
        }
        colorPalette.snp.makeConstraints { make in
            make.top.equalTo(status1.snp.bottom).inset(-28)
            make.leading.equalToSuperview().inset(20)
            make.width.height.equalTo(36)
        }
        darkMode.snp.makeConstraints { make in
            make.top.equalTo(status1.snp.bottom).inset(-24)
            make.leading.equalTo(colorPalette.snp.trailing).inset(-16)
            make.height.equalTo(24)
        }
        darkModeDescription.snp.makeConstraints { make in
            make.top.equalTo(darkMode.snp.bottom)
            make.leading.equalTo(colorPalette.snp.trailing).inset(-16)
            make.height.equalTo(20)
        }
        dropDownButton.snp.makeConstraints { make in
            make.centerY.equalTo(colorPalette.snp.centerY)
            make.trailing.equalToSuperview().inset(20)
        }
        devider3.snp.makeConstraints { make in
            make.top.equalTo(dropDownButton.snp.bottom).inset(-36)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(1)
        }
        status3.snp.makeConstraints { make in
            make.top.equalTo(devider3.snp.bottom).inset(-36)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(16)
        }
        appVersion.snp.makeConstraints { make in
            make.top.equalTo(status3.snp.bottom).inset(-24)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
}


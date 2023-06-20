//
//  CounterScreen.swift
//  Nour
//
//  Created by Alisher Manatbek on 20.06.2023.
//

import UIKit
import AudioToolbox
import AVFoundation

protocol CounterDelegate {
    func updateDataBase(count: Int, key: String)
}

class CounterScreen: UIViewController {

    private let id: Int
    private var count: Int
    private let dhikrSound: String
    private let delegate: DhikrScreen
    private var player: AVAudioPlayer?
    private let dynamicColor = UIColor(named: "Dynamic-Color")
    private let playImage = UIImage(systemName: "play.circle")
    private let pauseImage = UIImage(systemName: "pause.circle")
    private let arabicFont = UIFont(name: "KFGQPCUthmanTahaNaskh", size: 40.0)
    
    private lazy var playerView: UIView = {
        let view = UIView()

        view.layer.cornerRadius = 12.0
        view.backgroundColor = dynamicColor
    
        return view
    }()
    
    private lazy var alert: UIAlertController = {
        let alert = UIAlertController (title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(
            .init(title: "Reset counter", style: .default) { _ in
                self.count = 0
                DispatchQueue.main.async {
                    self.counterButton.setTitle(String(self.count), for: .normal)
                }
            }
        )
        
        alert.addAction(.init(title: "Cancel", style: .cancel))
        
        return alert
    }()
    
    lazy var dhikrLabel: UILabel = {
        let label = UILabel()
    
        label.font = arabicFont
        label.textColor = UIColor.label
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var slider: UISlider = {
        let slider = UISlider()
        
        if let player = player {
            slider.maximumValue = Float(player.duration)
        }
        
        slider.minimumTrackTintColor = UIColor.label
        slider.thumbTintColor = UIColor.label
        slider.addTarget(self, action: #selector(changeActionTime), for: .valueChanged)

        return slider
    }()
    
    private lazy var counterButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("\(count)", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        button.backgroundColor = dynamicColor
        
        if let titleLabel = button.titleLabel {
            titleLabel.font = UIFont(name: "Helvetica", size: 35)
        }
        
        button.addTarget(self, action: #selector(counterButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 12.0
        
        return button
    }()
    
    private lazy var playButton: ResizableImageButton = {
        let button = ResizableImageButton()
        
        button.setImage(playImage?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = UIColor.label
        button.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var dhikrView: UIView = {
        let view = UIView()

        view.layer.cornerRadius = 12
        view.backgroundColor = dynamicColor
        
        return view
    }()
    
    init(delegate: DhikrScreen, count: Int, dhikrSound: String, id: Int) {
        self.id = id
        self.count = count
        self.delegate = delegate
        self.dhikrSound = dhikrSound
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Counter"
        view.backgroundColor = .systemBackground
        
        guard let url = Bundle.main.url(forResource: dhikrSound, withExtension: "m4a") else { return }
        
        player = try? AVAudioPlayer(contentsOf: url)
        
        guard let player = player else { return }
        
        player.delegate = self
        
        view.addSubview(counterButton)
        configureCounterButton()
        
        view.addSubview(playerView)
        configurePlayerView()
        
        view.addSubview(dhikrView)
        configureDhikrView()
    
        Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
    }
    
    func configureDhikrView() {
        dhikrView.snp.makeConstraints {
            $0.width.left.right.equalTo(playerView)
            $0.bottom.equalTo(playerView.snp.top).offset(-10.0)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        dhikrView.addSubview(dhikrLabel)
        dhikrLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(10.0)
            $0.centerY.equalToSuperview()
        }
    }
    
    @objc func playButtonPressed(_ sender: UIButton) {
        guard let player = player else { return }
        
        if (player.isPlaying == true) {
            player.stop()
            sender.setImage(playImage, for: .normal)
        } else {
            sender.setImage(pauseImage, for: .normal)
            player.prepareToPlay()
            player.play()
        }
    }
    
    func configurePlayerView() {
        playerView.snp.makeConstraints {
            $0.width.left.right.equalTo(counterButton)
            $0.bottom.equalTo(counterButton.snp.top).offset(-10.0)
            $0.height.equalTo(50.0)
        }
        
        playerView.addSubview(playButton)
        configurePlayButton()
        
        playerView.addSubview(slider)
        configureSlider()
    }
    
    func configurePlayButton() {
        playButton.snp.makeConstraints {
            $0.width.height.equalTo(30.0)
            $0.centerY.equalToSuperview()
            $0.left.equalTo(10.0)
        }
    }
    
    func configureSlider() {
        slider.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(playButton.snp.right).offset(10.0)
            $0.right.equalToSuperview().offset(-10)
        }
    }
    
    func configureCounterButton() {
        counterButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(15.0)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10.0)
            $0.height.equalTo(220.0)
        }
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
        
        counterButton.addGestureRecognizer(longPress)
    }
    
    @objc func longPress(_ guesture: UILongPressGestureRecognizer) {
        if guesture.state == UIGestureRecognizer.State.began {
            if (count == 0) {
                return
            }
            present(alert, animated: true)
        }
    }
    
    @objc func counterButtonPressed(_ sender: UIButton) {
        count += 1
        if (count % 33 == 0) { AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {} }
        
        DispatchQueue.main.async {
            sender.setTitle("\(self.count)", for: .normal)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        guard let player = player else { return }
        
        if (player.isPlaying == true) {
            playButton.setImage(playImage, for: .normal)
            player.stop()
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
                
        delegate.updateDataBase(count: count, key: "\(id)")
    }
    
    @objc func updateSlider() {
        guard let player = player else { return }
        
        slider.value = Float(player.currentTime)
    }
    
    @objc func changeActionTime(_ sender: UISlider) {
        guard let player = player else { return }
        
        player.currentTime = TimeInterval(slider.value)
    }
    
}

// MARK: - AVAudioPlayerDelegate

extension CounterScreen: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playButton.setImage(playImage, for: .normal)
    }
}

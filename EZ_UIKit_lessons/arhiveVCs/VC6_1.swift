
import UIKit
import AVFoundation

class VC6_1: UIViewController {
    var playButton : UIButton!
    var pauseButton : UIButton!
    var player = AVAudioPlayer()
    var slider : UISlider!
    var volumeSlider : UISlider!
    var timeLabel : UILabel!
    var volumeLabel : UILabel!
    var forvardButton : UIButton!
    var backButton : UIButton!

    
    var timer = Timer()
    
    var isPlaying = false
    override func viewDidLoad() {
        super.viewDidLoad()
firstFuncForVC()
        creatingSongList()
        
//        do {
//            if let audioPath = Bundle.main.path(forResource: "Nezhnost", ofType: "mp3"){
//            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
// //           slider.maximumValue = Float(player.duration)
//            }
//        } catch
//            print("error")
//        }
        do {
            try player = AVAudioPlayer(contentsOf: songList[currentSong].url!)
            
           //🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻// this allows to play music in backgrownd
            player.prepareToPlay()
            let audioSession = AVAudioSession.sharedInstance()
            do{
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            }
            catch{
                print("problems with session")
            }
            //🔹🔹🔹🔹🔹🔹🔹🔹🔹}
            
        } catch {
            print("Can't set the next song")
        }






        setPlayButton()
        setPauseButton()
        setSlider()
        setVolumeSlider()
        setLabel()
        setTimeLabel()
        setTitleLabel()
        scheduledTimerWithTimeInterval()
        forvardButton = newCurrentButtonFUNC(title: "Forvard", width: w * 0.3, height: h * 0.1, x: w * 0.75, y: h * 0.3)
        backButton = newCurrentButtonFUNC(title: "Back", width: w * 0.3, height: h * 0.1, x: w * 0.25, y: h * 0.3)

        forvardButton.backgroundColor = .green
        backButton.backgroundColor = .yellow

//        self.player.play()
    
    }
    
    func setPlayButton(){
        
        currentButton = UIButton()
        
        currentButton.frame = CGRect(x: view.bounds.width * 0.25, y: view.bounds.height * 0.85, width: view.bounds.width * 0.45, height: view.bounds.height * 0.1)
        currentButton.center = CGPoint(x: view.bounds.width * 0.25, y: view.bounds.height * 0.85)
        currentButton.setTitle("Play/Pause", for: .normal)
        currentButton.backgroundColor = .magenta
        currentButton.setTitleColor(UIColor.white, for: .normal)
        currentButton.titleLabel?.adjustsFontSizeToFitWidth = true
        currentButton.addTarget(self, action: #selector(VC6_1.playButtonPressed(sender:)), for: UIControlEvents.touchUpInside)
        playButton = currentButton
        view.addSubview(playButton)
    }
    @objc func playButtonPressed(sender: UIButton){
        if isPlaying{
        self.player.pause()
    
         isPlaying = false
        }
        else{
        self.player.play()
        isPlaying = true
        }
        
    }
    func setPauseButton(){
        
        currentButton = UIButton()
        
        currentButton.frame = CGRect(x: view.bounds.width * 0.25, y: view.bounds.height * 0.85, width: view.bounds.width * 0.45, height: view.bounds.height * 0.1)
        currentButton.center = CGPoint(x: view.bounds.width * 0.75, y: view.bounds.height * 0.85)
        currentButton.setTitle("Stop", for: .normal)
        currentButton.backgroundColor = UIColor.magenta
        currentButton.setTitleColor(UIColor.white, for: .normal)
        currentButton.titleLabel?.adjustsFontSizeToFitWidth = true
        currentButton.addTarget(self, action: #selector(VC6_1.pauseButtonPressed(sender:)), for: UIControlEvents.touchUpInside)
        pauseButton = currentButton
        view.addSubview(pauseButton)
    }
    @objc func pauseButtonPressed(sender: UIButton){
        self.player.stop()
        slider.value = 0
        isPlaying = false
        player.currentTime = 0
        
    }

    func setSlider(){
     slider = UISlider()
        slider.frame = CGRect(x: 0, y: 0, width: view.bounds.width * 0.8, height: view.bounds.height * 0.1)
        slider.center = CGPoint(x: view.bounds.width * 0.5, y: view.bounds.height * 0.7)
        slider.minimumValue = 0.0
        slider.maximumValue = Float(player.duration)
        slider.addTarget(self, action: #selector(VC6_1.changeSliderValue(sender:)), for: .valueChanged)
     
        view.addSubview(slider)
        
    }
    @objc func changeSliderValue(sender: UISlider){
        if sender == slider{
            player.currentTime = TimeInterval(sender.value)
            let minutes = Int(player.currentTime) / 60
            let seconds = Int(player.currentTime) % 60
            timeLabel.text = "min: \(minutes) sec: \(seconds)"
//            if sender.value == 0 && !player.is{
//                nextSong()
//                player.play()
//            }
        }
    }
    
    func setVolumeSlider(){
        volumeSlider = UISlider()
        volumeSlider.frame = CGRect(x: 0, y: 0, width: view.bounds.width * 0.8, height: view.bounds.height * 0.1)
        volumeSlider.center = CGPoint(x: view.bounds.width * 0.5, y: view.bounds.height * 0.5)
        volumeSlider.minimumValue = 0.0
        volumeSlider.maximumValue = 1.0
        volumeSlider.addTarget(self, action: #selector(VC6_1.changeVolumeSliderValue(sender:)), for: .valueChanged)



        view.addSubview(volumeSlider)

    }
    @objc func changeVolumeSliderValue(sender: UISlider){
        if sender == volumeSlider{

            self.player.volume = self.volumeSlider.value
            print(volumeSlider.value)
        }
    }
    
    func setLabel() {
        currentLabel = UILabel()

            currentLabel.text = "Volume"
        
        currentLabel.textAlignment = .center
        currentLabel.frame = CGRect(x: view.bounds.width * 0.25, y: view.bounds.height * 0.05, width: view.bounds.width * 0.5, height: view.bounds.height * 0.1)
        currentLabel.center = CGPoint(x: view.bounds.width * 0.5, y: view.bounds.height * 0.45)
        currentLabel.adjustsFontSizeToFitWidth = true
        currentLabel.minimumScaleFactor = 0.5
        volumeLabel = currentLabel
        view.addSubview(volumeLabel)
    }
    
    func setTitleLabel() {
        currentLabel = UILabel()
        
        currentLabel.text = "Song name"
        
        currentLabel.textAlignment = .center
        currentLabel.frame = CGRect(x: view.bounds.width * 0.25, y: view.bounds.height * 0.05, width: view.bounds.width * 0.5, height: view.bounds.height * 0.1)
        currentLabel.center = CGPoint(x: view.bounds.width * 0.5, y: view.bounds.height * 0.15)
        currentLabel.adjustsFontSizeToFitWidth = true
        currentLabel.minimumScaleFactor = 0.5
        titleLabel = currentLabel
        view.addSubview(titleLabel)
    }
    
    func setTimeLabel() {
        currentLabel = UILabel()
        
        currentLabel.text = "0"
        
        currentLabel.textAlignment = .center
        currentLabel.frame = CGRect(x: view.bounds.width * 0.25, y: view.bounds.height * 0.05, width: view.bounds.width * 0.5, height: view.bounds.height * 0.1)
        currentLabel.center = CGPoint(x: view.bounds.width * 0.5, y: view.bounds.height * 0.65)
        currentLabel.adjustsFontSizeToFitWidth = true
        currentLabel.minimumScaleFactor = 0.5
        timeLabel = currentLabel
        view.addSubview(timeLabel)
    }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(VC6_1.updateSlider), userInfo: nil, repeats: true)
    }

    @objc func updateSlider(){
     
        slider.value = Float(player.currentTime)
        let minutes = Int(player.currentTime) / 60
        let seconds = Int(player.currentTime) % 60
        timeLabel.text = "min: \(minutes) sec: \(seconds)"
        
        if !player.isPlaying && isPlaying{
            nextSong()
        }
    }
    
  
    func newCurrentButtonFUNC(title: String, width: CGFloat, height: CGFloat, x: CGFloat, y: CGFloat, fun: String = "", backgroundColor: UIColor = .orange, titleColor: UIColor = .black ) -> UIButton{

        currentButton = UIButton()

        currentButton.frame = CGRect(x: 0, y: 0, width: width, height: height)
        currentButton.center = CGPoint(x: x, y: y)
        currentButton.setTitle(title, for: .normal)
        currentButton.backgroundColor = backgroundColor
        currentButton.setTitleColor(titleColor, for: .normal)
        currentButton.titleLabel?.adjustsFontSizeToFitWidth = true
        currentButton.addTarget(self, action: #selector(sharedButtonsFunc(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(currentButton)
        return currentButton
    }

    func nextSong(){
        currentSong += 1
        if currentSong >= songList.count{
            currentSong = 0
        }
        do {
            try player = AVAudioPlayer(contentsOf: songList[currentSong].url!)
        } catch {
            print("Can't set the next song")
        }
        player.play()
        titleLabel.text = String(describing: songList[currentSong].url!)
    }
    
    @objc func sharedButtonsFunc(sender: UIButton) -> Void {
        print(sender.titleLabel?.text ?? "no title")
        if sender.titleLabel?.text == "Forvard"{
            nextSong()
        }
        if sender.titleLabel?.text == "Back"{
            currentSong -= 1
            if currentSong == -1{
                currentSong =  songList.count - 1
            }
            do {
                try player = AVAudioPlayer(contentsOf: songList[currentSong].url!)
            } catch {
                print("Can't set the next song")
            }
            player.play()
            titleLabel.text = String(describing: songList[currentSong].url!)

        }
        
    }
    func creatingSongList() {
        let folderURL = Bundle.main.paths(forResourcesOfType: "mp3", inDirectory: "music")
        //     print(folderURL)
        for song in folderURL {
            let songPath = URL(fileURLWithPath: song)
            let avplayerItem = AVPlayerItem(url: songPath)
            let itemOfSongList = Song(withAVPlayerItem: avplayerItem, url: songPath)
            songList.append(itemOfSongList)
        }
        
    }

   

}





import AVKit
import SwiftUI

struct Video: View {
    @State var avPlayer: AVPlayer
    @State var looper: AVPlayerLooper

    init(named: String, bundle: Bundle = .main) {
        let url = bundle.url(forResource: named, withExtension: "mov")!
        let player = AVQueuePlayer()
        player.isMuted = true

        let playerItem = AVPlayerItem(url: url)
        looper = AVPlayerLooper(player: player, templateItem: playerItem)
        avPlayer = player
    }

    var body: some View {
        VideoPlayer(player: avPlayer)
            .onAppear {
                avPlayer.play()
            }
    }
}

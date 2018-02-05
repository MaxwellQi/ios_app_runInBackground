//
//  ViewController.m
//  Background_Music
//
//  Created by qi on 05/02/2018.
//  Copyright © 2018 tvu. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property (nonatomic,strong) AVPlayer *avPlayer;

@end

@implementation ViewController

- (AVPlayer *)avPlayer
{
    if (!_avPlayer) {
        
        AVPlayerItem *playerItem = [self getPlayItem:1];
        _avPlayer = [AVPlayer playerWithPlayerItem:playerItem];
        
         [self addNotification];
    }
    return _avPlayer;
}

- (void)addNotification
{
    //给AVPlayerItem添加播放完成通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.avPlayer.currentItem];
}

- (AVPlayerItem *)getPlayItem:(int)videoIndex
{
    NSURL *url = [[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"IMG_2362" ofType:@"mp4"]];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
    return playerItem;
}

- (void)playbackFinished:(NSNotification *)notification
{
    [self.avPlayer seekToTime:CMTimeMake(0, 1)];  // 视频播放完成以后，从新设置到起点
    NSLog(@"视频播放完成");
    [self.avPlayer play];
   
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.avPlayer seekToTime:CMTimeMake(0, 1.0)];
    [self.avPlayer play];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

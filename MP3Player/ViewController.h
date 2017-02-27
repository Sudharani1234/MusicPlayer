//
//  ViewController.h
//  MP3Player
//
//  Created by Vijay on 20/02/17.
//  Copyright © 2017 Sudha. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *img;


- (IBAction)playAudio:(id)sender;

- (IBAction)pauseAudio:(id)sender;

- (IBAction)prevAudio:(id)sender;
- (IBAction)nextAudio:(id)sender;
- (IBAction)volumeChange:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
- (IBAction)songSlider:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *sliderSong;
@property (weak, nonatomic) IBOutlet UILabel *startTime;
@property (weak, nonatomic) IBOutlet UILabel *overTime;

@property (weak, nonatomic) IBOutlet UIButton *playPauseOutlet;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;
@property (weak, nonatomic) IBOutlet UIButton *nextOutlet;
@property (weak, nonatomic) IBOutlet UIButton *prevOutlet;
@property (weak, nonatomic) IBOutlet UIImageView *hideAndShowImage;

@property (strong,nonatomic) NSTimer *timer;
@end


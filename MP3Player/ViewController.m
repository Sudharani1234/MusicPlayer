//
//  ViewController.m
//  MP3Player
//
//  Created by Vijay on 20/02/17.
//  Copyright © 2017 Sudha. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){

    
    AVAudioPlayer *audioPlayer;
    
    BOOL isplaying;
    int  index;
    NSArray *names;
    NSArray *images;
    NSArray *songarray;
    UILabel*label;
    
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  
    
    [self rotateImageView];
    
    
    self.hideAndShowImage.hidden = YES;
    
    

        [self.playPauseOutlet setImage:[UIImage imageNamed:@"Play.png"] forState:UIControlStateNormal];
    
    // Do any additional setup after loading the view, typically from a nib.
   names = @[@"01 - Love You Zindagi (128 Kbps) - DownloadMing.SE",@"The Humma",@"Go Pagal",@"Kaabil Hoon (Sad Version)",@"Dheere Dheere (Mr-Jatt.com)",@"Kaun Tujhe (Mr-Jatt.com)",@"The Breakup Song SongsMp3.Net"];
    images = @[@"dear Zindagi.jpg",@"ok jaanu.jpg",@"jolly LLB2.jpg",@"kabil.jpg",@"sonamhriti.jpg",@"kaun-tujhe.jpg",@"breakup song.jpg"];
    songarray= @[@"Love You Zindagi",@"Humma Humma",@"Go Pagal",@"Kaabil Hoon",@"Dheere Dheere",@"Kaun Tujhe",@"The Breakup Song"];
    index = 0;
    
    
    self.sliderSong.value = 0;
    self.startTime.text = @"0.0";
    self.overTime.text = @"0.0";
    
    [self playMyAudio];
   // self.timeLabel.text =@"0.0" ;
//self.timeLabelFull.text = @"0.0";
    
     self.nameLabel.text = [songarray objectAtIndex:index];
    
    self.sliderSong.minimumValue = 0.0;
        self.sliderSong.maximumValue = audioPlayer.duration;
    //
    //
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];

    self.img.layer.cornerRadius = self.img.frame.size.width / 2;
//    self.img.layer.cornerRadius = 110;

    self.img.clipsToBounds = YES;
    self.hideAndShowImage.layer.cornerRadius = self.img.frame.size.width / 2;
//    self.hideAndShowImage.layer.cornerRadius = 110;

    self.hideAndShowImage.clipsToBounds = YES;
    
   
    label=[[UILabel alloc]init];
    label.textColor = [UIColor blueColor];
    label.text = [songarray objectAtIndex:index];
   label.frame=CGRectMake(375, 310, 300, 30);
    
    
    
    [self.view addSubview:label];
    [UIView beginAnimations:@" " context:nil];
    [UIView setAnimationDuration:20.0];
    label.frame=CGRectMake(375, 310, 300, 30);
    
    [UIView commitAnimations];
    
    _nameLabel.text= [songarray objectAtIndex:index];
    label.frame=CGRectMake(375, 310, 300, 30);
    [self.view addSubview:label];
    [UIView animateWithDuration:5.0 delay:0.0 options: UIViewAnimationOptionRepeat
                     animations:^{
                         label.frame=CGRectMake(-100, 310, 300, 30);
                     }completion:^(BOOL finished){
                     }];
    
    
    
    
  
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)playAudio:(id)sender {
   // [self playMyAudio];
  
    if (isplaying == NO) {
        //[self playMyAudio:index];
        [audioPlayer play];
        isplaying = YES;
          self.img.hidden  = NO;
        self.hideAndShowImage.hidden = YES;
        
        [self.playPauseOutlet setImage:[UIImage imageNamed:@"Pause.png"] forState:UIControlStateNormal];
    }else{
        [audioPlayer pause];
        isplaying = NO;
        [self.playPauseOutlet setImage:[UIImage imageNamed:@"Play.png"] forState:UIControlStateNormal];
        
        self.img.hidden  = YES;
        self.hideAndShowImage.hidden = NO;
         self.hideAndShowImage.image = [UIImage imageNamed:[images objectAtIndex:index]];
        label.text= [songarray objectAtIndex:index];
    }
    
//
//   //     [audioPlayer pause];
//   [self startFromBegining];

}

- (IBAction)pauseAudio:(id)sender {
    [audioPlayer pause];
    
}

#pragma mark - Prev Next Songs

- (IBAction)prevAudio:(id)sender {
    
    index--;
    if(index <0){
    
        index = (int)names.count-1;
    }
     [self playMyAudio];
    
     self.nameLabel.text = [songarray objectAtIndex:index];
    label.text= [songarray objectAtIndex:index];
   [self.prevOutlet setImage:[UIImage imageNamed:@"Prev.png"] forState:UIControlStateNormal];
    [audioPlayer play];
   

  
}

- (IBAction)nextAudio:(id)sender {
    
    index++;
    
    if(index == names.count){
    
        index = 0;
    }
     [self playMyAudio];
    [audioPlayer play];
     self.nameLabel.text = [songarray objectAtIndex:index];
    label.text= [songarray objectAtIndex:index];
   [self.nextOutlet setImage:[UIImage imageNamed:@"next.png"] forState:UIControlStateNormal];

    
      
}





- (IBAction)volumeChange:(id)sender {
    
    audioPlayer.volume = self.volumeSlider.value;
}



-(void)playMyAudio{
    NSString *path = [[NSBundle mainBundle]
                      pathForResource:[NSString stringWithFormat:@"%@",[names objectAtIndex:index]] ofType:@"mp3"];
    
    
    
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:
                   [NSURL fileURLWithPath:path] error:NULL];
  //  [audioPlayer play];
    
    self.img.image = [UIImage imageNamed:[images objectAtIndex:index]];
     self.hideAndShowImage.image = [UIImage imageNamed:[images objectAtIndex:index]];
    self.sliderSong.value = audioPlayer.currentTime;
   
    [self.sliderSong setValue:audioPlayer.currentTime animated:YES];
    
    [audioPlayer prepareToPlay];
    isplaying = NO;

}



-(void)startFromBegining{
    audioPlayer.currentTime = 0;
    [audioPlayer play];
}

#pragma mark - Timer
-(NSString *)timeFormat:(float)value {
    float minutes = floor(value/60);
    float seconds = value-(minutes)*60;
   
    NSString *time =[NSString stringWithFormat:@"%0.00f:%0.00f",minutes,seconds];
    return time;
    
}

-(void)updateTimer:(NSTimer *)timer{
    self.sliderSong.value = audioPlayer.currentTime;
    self.startTime.text = [NSString stringWithFormat:@"%@",[self timeFormat:audioPlayer.currentTime]];
    self.overTime.text = [NSString stringWithFormat:@"-%@",[self timeFormat:audioPlayer.duration-audioPlayer.currentTime]];
    [self.sliderSong setValue:audioPlayer.currentTime animated:YES];
}




- (IBAction)songSlider:(id)sender {
     //audioplayer.currentTime = self.sliderSong.value;
    audioPlayer.currentTime = self.sliderSong.value;
}


- (void)rotateImageView{
    [UIView animateWithDuration:4.0f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        [self.img setTransform:CGAffineTransformRotate(self.img.transform, M_PI_2)];
    }completion:^(BOOL finished){
        if (finished) {
            [self rotateImageView];         }
    }];
}
@end

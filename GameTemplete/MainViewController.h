//
//  MainViewController.h
//  GameTemplete
//
//  Created by Andrew Garrahan on 7/14/13.
//  Copyright (c) 2013 Andrew Garrahan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <audioToolbox/AudioServices.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <QuartzCore/QuartzCore.h>

@interface MainViewController : UIViewController{
    UIView *bottoms;
    UIButton *fire;
    UIImage *firer;
    CADisplayLink *displayLink;
    NSMutableArray *BulletArray;
}


@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) NSInteger score;

- (void) move: (CADisplayLink *) displayLink;

@end


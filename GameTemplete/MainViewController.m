//
//  MainViewController.m
//  GameTemplete
//
//  Created by Andrew Garrahan on 7/14/13.
//  Copyright (c) 2013 Andrew Garrahan. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "Box.h"
#import "MainViewController.h"
#import "Utility.h"


#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height

@interface MainViewController (){
    
    NSMutableArray * items;
    Box * specialBox;
    Box * hero;
    //Box *fire;
    NSTimer * spawnBox;
        int score;

    
    
    
}

@end



@implementation MainViewController

- (void)viewDidLoad
{
    
    items = [[NSMutableArray alloc]init];
    
    specialBox = [[Box alloc]initMakeMeABox];
    
    specialBox.deltaX = -5.0;
    specialBox.deltaY = 0.5;
    specialBox.backgroundColor = [UIColor redColor];
    [self.view addSubview:specialBox];
    
    [items addObject:specialBox];
    
    spawnBox = [NSTimer scheduledTimerWithTimeInterval:1.0f/0.60
                                                target:self
                                              selector:@selector(spawnABox)
                                              userInfo:nil
                                               repeats:YES];
    
    hero = [[Box alloc]initMakeMeABox];
    hero.frame = CGRectMake(0, 465, 320, 15);
    hero.backgroundColor = [UIColor blackColor];
    [self.view addSubview:hero];
    
    CADisplayLink * displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(stepWorld)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    
    //---------------------------------------
    
    
    fire = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    fire.frame = CGRectMake(150, 452, 41, 15);
    fire.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cannon.png"]];
    [self.view addSubview: fire];
    

    //---------------------------------------
    
    BulletArray = [[NSMutableArray alloc] init];
    [NSTimer scheduledTimerWithTimeInterval:1.0 / 60.0 target:self selector:@selector(step) userInfo:nil repeats:YES];
    
    
}

-(void)spawnABox{
    
    
    Box * temp = [[Box alloc]initMakeMeABox];
    
    int radX = [Utility randomNumberBetweenZeroAnd:SCREEN_WIDTH];
    int radY = SCREEN_HEIGHT* 0;
    
    temp.center = CGPointMake(radX, radY);
    
    temp.deltaX = 0;
    temp.deltaY = 0.5 + rand() % 5;
    
    
    [self.view addSubview:temp];
    [items addObject:temp];
    

}

-(void)stepWorld{
    
    score = 0;
    
    for (int i = 0; i <[items count]; i++){
        Box * temp = [items objectAtIndex:i];
        temp.center = CGPointMake(temp.center.x + temp.deltaX, temp.center.y + temp.deltaY);
        if (temp.center.y > SCREEN_HEIGHT) {
            temp.deltaY *= 1;
        }
        else if (temp.center.y < 0){
            temp.deltaY *= 1;
        }
        
        if (CGRectIntersectsRect(temp.frame, hero.frame)) {
            //temp.backgroundColor = [UIColor greenColor];
            score++;
            //[items new]
        }
        

    }
}



-(void)step
{
    for(int i = 0; i < [BulletArray count]; i++)
    {
        UIImageView *CurrentBullet = (UIImageView *)[BulletArray objectAtIndex:i]; //get the current pellet
        CurrentBullet.center = CGPointMake(CurrentBullet.center.x, CurrentBullet.center.y - 1); //move the pellet
        
        if(CurrentBullet.center.y >= 0) //check if the pellet is outside the screen
        {
            //[CurrentBullet removeFromSuperView];
            [BulletArray removeObjectAtIndex:i];
        }
        
    }
}



-(void)setupGame {
    
    // Step 1 - Initialize our variables starting values
    score = 0;
    
    // Step 2 - Set the labels initial values
    _scoreLabel.text = [NSString stringWithFormat:@"%i", score];
    
    // Step 3 - Setup the timer too
//userInfo:[nil repeats:YES];
}

    -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
    {
//--BEGIN SHOOTING ANIMATION OPTION 1------------------------------------------------------------------------------

        /*
        UITouch *touch = [[event allTouches] anyObject];
        CGPoint location = [touch locationInView:touch.view];
        if(CGRectContainsPoint(self.view.frame, location))
        {
            //UIImageView *Bullet = [[UIImageView alloc] initWithFrame:CGRectMake(320 / 2, 480 / 2, 5, 5)];
            UIImageView *Bullet = [[UIImageView alloc] initWithFrame:CGRectMake(20, 465, 10, 26)];
            //[Bullet setBackgroundColor:[UIColor blackColor]];
            [Bullet setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"missle.png"]]];
            [self.view addSubview:Bullet];
            [BulletArray addObject:Bullet];
        }*/
//--END SHOOTING ANIMATION OPTION 1------------------------------------------------------------------------------
//--BEGIN SHOOTING ANIMATION OPTION 2------------------------------------------------------------------------------
        
        UIImage *missleImage = [UIImage imageNamed:@"missle.png"];
        UIImageView *missle = [[UIImageView alloc] initWithImage:missleImage];
        [missle setFrame:CGRectMake(150, 452, 35, 35)];
        
        [self.view addSubview:missle];
        
        // Step 2 - Use the in-built animation methods by Apple to animate our pea
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationCurveEaseIn animations:^{
            
            [missle setFrame:CGRectMake(149, 47, 10, 26)];
            
        } completion:^(BOOL finished) {
            
            // Step 3 - Change the pea image when the animation completes
            //[missle setFrame:CGRectMake(134, 40, 66, 50)];
            //[missle setImage:[UIImage imageNamed:@"blow.png"]];
            
            // To Do : Increment the score
             score++;
             _scoreLabel.text = [NSString stringWithFormat:@"%i", score];
            
        }];
        
//--END SHOOTING ANIMATION OPTION 2------------------------------------------------------------------------------

     
        
    }








@end

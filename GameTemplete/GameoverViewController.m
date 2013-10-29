//
//  GameoverViewController.m
//  GameTemplete
//
//  Created by Andrew Garrahan on 7/14/13.
//  Copyright (c) 2013 Andrew Garrahan. All rights reserved.
//

#import "GameoverViewController.h"
#import "MainViewController.h"

@interface GameoverViewController ()

@end

@implementation GameoverViewController
@synthesize scoreLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{

    //[super viewDidLoad];
	// Do any additional setup after loading the view.
	NSString *string = @"Your final score is %i", *score;
    UIFont *font = [UIFont systemFontOfSize: 16];
    CGRect f = CGRectMake(100, 100, 200, 40);
    label = [[UILabel alloc] initWithFrame: f];
    label.backgroundColor = [UIColor yellowColor];
    label.font = font;
    label.text = string;
    [self.view addSubview: label];
  

    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  TitleViewController.m
//  GameTemplete
//
//  Created by Andrew Garrahan on 7/14/13.
//  Copyright (c) 2013 Andrew Garrahan. All rights reserved.
//

#import "TitleViewController.h"

@interface TitleViewController (){
        UIImageView * myAnimatedView;
}

@end

@implementation TitleViewController

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
    
    // Set up an Array of images
    NSArray * myImages = [NSArray arrayWithObjects:
                          [UIImage imageNamed:@"img1.png"],
                          [UIImage imageNamed:@"img2.png"],
                          [UIImage imageNamed:@"img3.png"],
                          [UIImage imageNamed:@"img4.png"], nil];
                          //[UIImage imageNamed:@"img5.png"],
                          //[UIImage imageNamed:@"img6.png"],
                          //[UIImage imageNamed:@"img7.png"],
                          //[UIImage imageNamed:@"img8.png"], nil];
    
    myAnimatedView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 325, 110, 80)];
    myAnimatedView.animationImages = myImages;
    myAnimatedView.animationDuration = 0.35;
    [self.view addSubview:myAnimatedView];
    
    
    [myAnimatedView startAnimating];
    
    
UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 25, 225, 150)];
imgView.image = [UIImage imageNamed:@"gametitle.png"];
    [self.view addSubview:imgView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

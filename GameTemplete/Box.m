#import "Box.h"

@implementation Box


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initMakeMeABox{
    
    CGRect frame = CGRectMake(0, 0, 20, 20);
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //self.backgroundColor = [UIColor blueColor];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"meteor1.png"]];
        
        _deltaX = 0.2;
        _deltaY = 0.5;
    }
    return self;
}

@end

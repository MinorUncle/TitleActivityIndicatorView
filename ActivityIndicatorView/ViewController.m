//
//  ViewController.m
//  ActivityIndicatorView
//
//  Created by tongguan on 16/3/8.
//  Copyright © 2016年 tongguan. All rights reserved.
//

#import "ViewController.h"
#import "TitleActivityIndicatorView.h"
#import "POP.h"
typedef enum CustomButtonAlignmentType{
    CustomButtonAlignmentTypeVertical =0,
    CustomButtonAlignmentTypeHorizontal
}CustomButtonAlignmentType;
@interface UIButtonA :UIButton

@property (nonatomic,assign)CustomButtonAlignmentType contentAlignment;

@end

@implementation UIButtonA
-(void)layoutSubviews {
    [super layoutSubviews];
    
    if (_contentAlignment == CustomButtonAlignmentTypeVertical) {
        // Center image
        CGPoint center = self.imageView.center;
        center.x = self.frame.size.width/2;
        center.y = self.imageView.frame.size.height/2;
        self.imageView.center = center;
        
        //Center text
        CGRect newFrame = [self titleLabel].frame;
        newFrame.origin.x = 0;
        newFrame.origin.y = self.imageView.frame.size.height + 5;
        newFrame.size.width = self.frame.size.width;
        
        self.titleLabel.frame = newFrame;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
}
-(void)setContentAlignment:(CustomButtonAlignmentType)contentAlignment{
    _contentAlignment = contentAlignment;
    [self setNeedsDisplay];
}
@end
@interface ViewController ()
{
    TitleActivityIndicatorView * view;
    UIButtonA* button;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    view = [[TitleActivityIndicatorView alloc]initWithFrame:CGRectZero];
    view.backgroundColor = [UIColor redColor];
    view.center = self.view.center;


    [self.view addSubview:view];
    [view startAnimatingWithMessage:@"heool"];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

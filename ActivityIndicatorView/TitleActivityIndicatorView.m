//
//  TitleActivityIndicatorView.m
//  play
//
//  Created by tongguan on 16/3/8.
//  Copyright © 2016年 tongguan. All rights reserved.
//

#import "TitleActivityIndicatorView.h"
@interface TitleActivityIndicatorView()
{
    
}
@property(nonatomic,strong) UIActivityIndicatorView* activity;
//@property(nonatomic,weak) UIView* superV;

@end
@implementation TitleActivityIndicatorView
-(instancetype)initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style{
    self = [super init];
    if (self) {
        _activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:style];
        [self addSubview:_activity];
        [self addSubview:self.titleLable];
        self.titleLable.font = [UIFont systemFontOfSize:14];

    }
    return self;
}
-(UIActivityIndicatorView*)activity{
    if (_activity == nil) {
        _activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [self addSubview:_activity];
        [self addSubview:self.titleLable];
        self.titleLable.font = [UIFont systemFontOfSize:14];
    }
    return _activity;
}

-(void)setFrame:(CGRect)frame{
    CGRect rect = CGRectMake(0, 0, 20, 20);
    if (self.activity.activityIndicatorViewStyle == UIActivityIndicatorViewStyleWhiteLarge) {
        rect = CGRectMake(0, 0, 37, 37);
    }
    
    rect.origin.y = 0;
    rect.origin.x = (frame.size.width - rect.size.width)*0.5;
    CGSize size = [@"h" sizeWithAttributes:@{NSFontAttributeName:self.titleLable.font}];
    self.titleLable.frame = CGRectMake(0, rect.size.height, rect.size.width, size.height);
    rect.size.height += size.height;
    frame.size = rect.size;
    
    [super setFrame:frame];
    
}

-(UILabel *)titleLable{
    if (_titleLable == nil) {
        _titleLable = [[UILabel alloc]init];
        _titleLable.font = [UIFont systemFontOfSize:11];
        _titleLable.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLable;
}
-(void)setHidesWhenNoneMesage:(BOOL)hidesWhenNoneMesage{
    _hidesWhenNoneMesage = hidesWhenNoneMesage;
    if (_hidesWhenNoneMesage &&  ([self.titleLable.text isEqualToString:@""] && self.titleLable.text == nil)) {
        self.alpha = 1.0;
    }
}
//-(void)willMoveToSuperview:(UIView *)newSuperview{
//    [super willMoveToSuperview:newSuperview];
//    self.superV = newSuperview;
//}

-(void)startAnimatingWithMessage:(NSString *)message{
    self.titleLable.text = message;
    if (message != nil && ![message isEqualToString:@""]) {
        CGSize size = [message sizeWithAttributes:@{NSFontAttributeName:self.titleLable.font}];
        CGRect rect = self.titleLable.frame;
        rect.size = size;
        rect.origin.x = (self.frame.size.width - rect.size.width)*0.5;
        self.titleLable.frame = rect;
    }
    self.alpha = 1.0;
    [self.activity startAnimating];
    
    NSLog(@"%@",[NSValue valueWithCGRect:self.activity.frame]);

}
-(void)stopAnimatingWithMessage:(NSString *)message{
    
    self.titleLable.text = message;
    if (message != nil && ![message isEqualToString:@""]) {
        CGSize size = [message sizeWithAttributes:@{NSFontAttributeName:self.titleLable.font}];
        CGRect rect = self.titleLable.frame;
        rect.size = size;
        rect.origin.x = (self.frame.size.width - rect.size.width)*0.5;
        self.titleLable.frame = rect;
        self.alpha = 1.0;
    }else{
        self.alpha = 0.0;

    }
    [self.activity stopAnimating];
}

-(void)dealloc{
}
@end

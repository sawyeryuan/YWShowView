//
//  YWLoadingView.m
//  xqx
//
//  Created by dahuoshi on 15/06/2017.
//  Copyright © 2017 beidougx.com. All rights reserved.
//

#import "YWLoadingView.h"
#import "UIView+YYAdd.h"

@interface YWLoadingView()

@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

@end

@implementation YWLoadingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+ (instancetype)showAtView:(UIView *)view withTitle:(NSString *)title {
    
    YWLoadingView *loadView = [[YWLoadingView alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    [view addSubview:loadView];
    return loadView;
}


+ (instancetype)showWithTitle:(NSString *)title {
    
    YWLoadingView *loadView = [[YWLoadingView alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    [loadView setupViewsWithTitle:title];
    return loadView;
}


- (void)setupViewsWithTitle:(NSString *)title {
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicatorView.hidesWhenStopped         = YES;
    indicatorView.frame                    = CGRectMake(0, 0, 30, 30);
    indicatorView.centerY                  = self.height/2;
    [indicatorView startAnimating];
    self.indicatorView                     = indicatorView;
    [self addSubview:indicatorView];
    
    UILabel *tipLbl                        = [[UILabel alloc]initWithFrame:CGRectMake(indicatorView.right, 0, 80, 30)];
    tipLbl.text                            = title;
    tipLbl.centerY                         =indicatorView.centerY;
    tipLbl.backgroundColor = [UIColor clearColor];
    tipLbl.textColor          = [UIColor whiteColor];
    tipLbl.textAlignment      = NSTextAlignmentLeft;
//    tipLbl.font = [UIFont systemFontOfSize:18];
//    tipLbl.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:18];
    tipLbl.font = [UIFont boldSystemFontOfSize:18];
    [self addSubview:tipLbl];

     
}
@end

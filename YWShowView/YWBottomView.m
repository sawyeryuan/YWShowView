//
//  YWBottomView.m
//  xqx
//
//  Created by dahuoshi on 11/05/2017.
//  Copyright © 2017 beidougx.com. All rights reserved.
//

#import "YWBottomView.h"
#import "UIView+YYAdd.h"

#define kScreen_width   ([UIScreen mainScreen].bounds.size.width)
#define kScreen_height  ([UIScreen mainScreen].bounds.size.height)

@interface YWBottomView()

@property (nonatomic, strong) UIView *blackView;

@end

@implementation YWBottomView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */


+ (instancetype)bottomView:(UIView *)view {
    YWBottomView *baseview = [[[self class] alloc]initWithFrame:view.bounds];
    [baseview addSubview:view];
    baseview.backgroundColor = [UIColor whiteColor];
    return baseview;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
        return self;
    }
    return nil;
}
//
- (void)setupView {
    
    UIView *blackView = [UIView new];
    self.blackView    = blackView;
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha     = 0.f;
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureAction:)];
    [self addGestureRecognizer:panGesture];
    
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction:)];
    [self.blackView addGestureRecognizer:tapGesture];
}

#pragma -mark Pan Gesture

- (void)panGestureAction:(UIPanGestureRecognizer *)pan {
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        {
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            CGPoint point = [pan translationInView:pan.view];
            CGFloat offset = point.y;
            if (offset<0) {
                break;
            }
            self.top += offset;//不断变化
            [pan setTranslation:CGPointMake(0, 0) inView:pan.view];
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            if (self.bottom>=kScreen_height+40) {
                //退出屏幕
                [UIView animateWithDuration:0.2 animations:^{
                    self.top = kScreen_height;
                    self.blackView.alpha  = 0.0;
                } completion:^(BOOL finished) {
                    [self.blackView removeFromSuperview];
                    [self removeFromSuperview];
                    if (finished) {
                        if ([self.delegate respondsToSelector:@selector(YWBottomViewDidRemoveFromWindow)]) {
                            [self.delegate YWBottomViewDidRemoveFromWindow];
                        }
                    }
                }];
            }else{
                //重回屏幕
                [UIView animateWithDuration:0.2 animations:^{
                    self.bottom = kScreen_height;
                }];
            }
            
            break;
        }
            
        default:
            break;
    }
    
}


- (void)tapGestureAction:(UITapGestureRecognizer *)tap {
    [self remove];
}

#pragma -mark animate show

- (void)showBottomViewAnimate:(BOOL)animate Withcompletion:(completionBlock)completion {
    self.top = kScreen_height;
    UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
    self.blackView.frame      = keywindow.bounds;
    [keywindow addSubview:self.blackView];
    [keywindow addSubview:self];
    if (animate) {
       [UIView animateWithDuration:0.3 animations:^{
           self.bottom = kScreen_height;
           self.blackView.alpha  = 0.3;
       } completion:^(BOOL finished) {
           if (completion) {
               completion();
           }
           if ([self.delegate respondsToSelector:@selector(YWBottomViewDidShowOnWindow)]) {
               [self.delegate YWBottomViewDidShowOnWindow];
           }
       }];
    }else{
        self.bottom = kScreen_height;
        self.blackView.alpha  = 0.3;
        if (completion) {
            completion();
        }
        if ([self.delegate respondsToSelector:@selector(YWBottomViewDidShowOnWindow)]) {
            [self.delegate YWBottomViewDidShowOnWindow];
        }
    }
}

- (void)showWithcompletion:(completionBlock)completion {
    
    [self showBottomViewAnimate:YES Withcompletion:completion];
}

- (void)show{
    
    [self showBottomViewAnimate:YES Withcompletion:nil];
}

- (void)removeViewAnimate:(BOOL)animate completion:(completionBlock)completion{
    
    if (animate) {
        [UIView animateWithDuration:0.3 animations:^{
            self.top = kScreen_height;
            self.blackView.alpha  = 0.0;
        } completion:^(BOOL finished) {
            [self.blackView removeFromSuperview];
            [self removeFromSuperview];
            if (completion) {
                completion();
            }
            if ([self.delegate respondsToSelector:@selector(YWBottomViewDidRemoveFromWindow)]) {
                [self.delegate YWBottomViewDidRemoveFromWindow];
            }
        }];
    }else{
        self.top = kScreen_height;
        self.blackView.alpha  = 0.0;
        [self.blackView removeFromSuperview];
        [self removeFromSuperview];
        if (completion) {
            completion();
        }
        if ([self.delegate respondsToSelector:@selector(YWBottomViewDidRemoveFromWindow)]) {
            [self.delegate YWBottomViewDidRemoveFromWindow];
        }
    }

}


- (void)removeWithcompletion:(completionBlock)completion {
    
    [self removeViewAnimate:YES completion:completion];
}

- (void)remove{
    
    [self removeViewAnimate:YES completion:nil];
}

@end

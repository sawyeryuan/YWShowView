//
//  YWBottomView.h
//  xqx
//
//  Created by dahuoshi on 11/05/2017.
//  Copyright © 2017 beidougx.com. All rights reserved.
//

#import "YWBaseView.h"

typedef void(^completionBlock)();


@protocol YWBottomViewDelegate <NSObject>

- (void)YWBottomViewDidShowOnWindow;

- (void)YWBottomViewDidRemoveFromWindow;


@end

@interface  YWBottomView: YWBaseView

@property (nonatomic, strong) id<YWBottomViewDelegate>delegate;



+ (instancetype)bottomView:(UIView *)view;

- (void)showBottomViewAnimate:(BOOL)animate Withcompletion:(completionBlock)completion;

- (void)showWithcompletion:(completionBlock)completion;

- (void)show;


- (void)removeViewAnimate:(BOOL)animate completion:(completionBlock)completion;

- (void)removeWithcompletion:(completionBlock)completion;

- (void)remove;
@end

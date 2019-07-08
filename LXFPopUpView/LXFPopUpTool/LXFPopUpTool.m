//
//  LXFPopUpView.m
//  LXFPopUpView
//
//  Created by 凌煊峰 on 2019/7/8.
//  Copyright © 2019 凌煊峰. All rights reserved.
//

#import "LXFPopUpTool.h"
#import "Masonry.h"

@interface LXFPopUpTool() <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *popUpView;

@end

@implementation LXFPopUpTool

+ (instancetype)sharedInstance {
    static LXFPopUpTool *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

#pragma mark - Pop Up View function

- (void)popUpWithView:(UIView *)view withAnimation:(BOOL)animation withCanTapBgCancel:(Boolean)canTapBgCancel {
    
    [self removePopUpView];
    
    // 背景view
    UIView *bgView = [[UIView alloc] init];
    self.popUpView = bgView;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:bgView];
    bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    if (canTapBgCancel) {
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removePopUpView)];
        __weak typeof(self) weakSelf = self;
        tapGestureRecognizer.delegate = weakSelf;
        [bgView addGestureRecognizer:tapGestureRecognizer];
    }
    
    // 嵌入view
    [bgView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(view.bounds.size.width);
        make.height.mas_equalTo(view.bounds.size.height);
        make.center.mas_equalTo(bgView);
    }];
    
    // 出场动画
    bgView.alpha = 0;
    view.alpha = 0;
    view.transform = CGAffineTransformScale(view.transform, 0.1, 0.1);
    [UIView animateWithDuration:animation?0.3f:0.0f animations:^{
        view.transform = CGAffineTransformIdentity;
        bgView.alpha = 1;
        view.alpha = 1;
    }];

}

- (void)removePopUpView {
    [self.popUpView removeFromSuperview];
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (touch.view == self.popUpView) {
        return YES;
    }
    return NO;
}


@end

//
//  LXFPopUpView.h
//  LXFPopUpView
//
//  Created by 凌煊峰 on 2019/7/8.
//  Copyright © 2019 凌煊峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXFPopUpTool : NSObject

+ (instancetype)sharedInstance;

- (void)popUpWithView:(UIView *)view withAnimation:(BOOL)animation withCanTapBgCancel:(Boolean)canTapBgCancel;
- (void)removePopUpView;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

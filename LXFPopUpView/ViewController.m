//
//  ViewController.m
//  LXFPopUpView
//
//  Created by 凌煊峰 on 2019/7/8.
//  Copyright © 2019 凌煊峰. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "LXFPopUpTool.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *popUpView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)popUpViewBtnFunc:(id)sender {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    view.backgroundColor = [UIColor redColor];
    
    [[LXFPopUpTool sharedInstance] popUpWithView:view withAnimation:NO withCanTapBgCancel:YES];
}

@end

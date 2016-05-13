//
//  HMTwoViewController.m
//  黑马微博
//
//  Created by apple on 14-7-3.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "MQTwoViewController.h"
#import "MQThreeViewController.h"
#import "JTNavigationController.h"
#import "UIViewController+JTNavigationExtension.h"
#import "JTViewController.h"

@interface MQTwoViewController ()
- (IBAction)jumpThree;

@end

@implementation MQTwoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
 self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(didTapNextButton)];
//    self.jt_fullScreenPopGestureEnabled = YES;
    NSLog(@"kkkkkk");
}

- (void)didTapNextButton {
    JTViewController *viewController = [[JTViewController alloc] init];
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)jumpThree {
    JTViewController *vc = [[JTViewController alloc] init];
    vc.title = @"ThreeVC";
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}
@end


//
//  HMDiscoverViewController.m
//  黑马微博
//
//  Created by apple on 14-7-3.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMDiscoverViewController.h"
#import "HMSearchBar.h"
#import "UIViewController+JTNavigationExtension.h"

@interface HMDiscoverViewController ()

@end

@implementation HMDiscoverViewController


- (instancetype)initWithStyle:(UITableViewStyle)style  {

    return [[UIStoryboard storyboardWithName:@"HMDiscoverViewController" bundle:nil] instantiateInitialViewController];


}
- (void)viewDidLoad
{
    [super viewDidLoad];
//    
//    HMSearchBar *searchBar = [HMSearchBar searchBar];
//    searchBar.width = 300;
//    searchBar.height = 30;
//    self.navigationItem.titleView = searchBar;
}





@end

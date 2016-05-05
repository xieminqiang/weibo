//
//  MQNewfeatureViewController.m
//  微博测试
//
//  Created by 谢明强 on 15/10/31.
//  Copyright © 2015年 MQ. All rights reserved.
//

#import "MQNewfeatureViewController.h"
#import "MQTabBarViewController.h"
#define MQImagecount 4
@interface MQNewfeatureViewController ()<UIScrollViewDelegate>
@property (nonatomic , weak) UIPageControl *pagecontrol;
@end

@implementation MQNewfeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addScrollview];
    [self addPagecontrol];
}
- (void)addScrollview {
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    CGFloat imageW = scrollView.width;
    CGFloat imageH = scrollView.height;
    for (int i =0; i<MQImagecount; i++) {
        UIImageView *imageview = [[UIImageView alloc] init];
        imageview.x = imageW*i;
        imageview.y = 0;
        imageview.width = imageW;
        imageview.height = imageH;
        NSString *name = [NSString stringWithFormat:@"new_feature_%d",i+1];
        imageview.image = [UIImage imageNamed:name];

        [scrollView addSubview:imageview];

  if (i==MQImagecount-1) {
      [self setuplastButton:(imageview)];

    }

    }

  
        scrollView.contentSize = CGSizeMake(imageW*MQImagecount, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;

}

- (void)setuplastButton:(UIImageView *)imageview{
    imageview.userInteractionEnabled = YES;
    [self setupstartButton:imageview];
    [self setupshareButton:imageview];
}

- (void)setupshareButton:(UIImageView *)imageview {

    UIButton *sharebutton = [[UIButton alloc] init];

    [sharebutton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [sharebutton setTitle:@"给大家分享" forState:(UIControlStateNormal)];
    [sharebutton setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:(UIControlStateNormal)];

    [sharebutton setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:(UIControlStateSelected)];
    sharebutton.size = CGSizeMake(150, 35);
    sharebutton.centerX = self.view.width * 0.5;
    sharebutton.centerY = self.view.height * 0.7;
    
    [imageview addSubview:sharebutton];
    [sharebutton addTarget:self action:@selector(share:) forControlEvents:(UIControlEventTouchUpInside)];

}
- (void)setupstartButton:(UIImageView *)imageview {
    UIButton *startbutton = [[UIButton alloc] init];

    [startbutton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:(UIControlStateNormal)];
    [startbutton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:(UIControlStateHighlighted)];
    [startbutton setTitle: @"开始微博" forState:(UIControlStateNormal)];
    [startbutton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    startbutton.size = startbutton.currentBackgroundImage.size;
    startbutton.centerX = self.view.width * 0.5;
    startbutton.centerY = self.view.height *0.77;
    [imageview addSubview:startbutton];
    [startbutton addTarget:self action:@selector(start) forControlEvents:(UIControlEventTouchUpInside)];


}
- (void)start {

    MQTabBarViewController *nv = [[MQTabBarViewController alloc] init];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = nv
    ;
}
- (void)share:(UIButton *)sharebutton {

    sharebutton.selected = !sharebutton.selected;


}

- ( void)addPagecontrol {
    UIPageControl *page = [[UIPageControl alloc] init];
    page.centerX = self.view.width*0.5;
    page.centerY = self.view.height - 30;
    page.numberOfPages = MQImagecount;
    page.pageIndicatorTintColor = [UIColor grayColor];
    page.currentPageIndicatorTintColor = [UIColor redColor];
    [self.view addSubview:page];
    self.pagecontrol = page;


}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    int doublepage = scrollView.contentOffset.x/scrollView.width;

    int page = (int)(doublepage +0.5);
    self.pagecontrol.currentPage = page;
}
@end

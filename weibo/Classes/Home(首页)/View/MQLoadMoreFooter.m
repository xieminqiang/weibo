//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo
//

#import "MQLoadMoreFooter.h"

@interface MQLoadMoreFooter()
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;
@end

@implementation MQLoadMoreFooter

+ (instancetype)footer
{
    return [[[NSBundle mainBundle] loadNibNamed:@"MQLoadMoreFooter" owner:nil options:nil] lastObject];
}

- (void)beginRefreshing
{
    self.statusLabel.text = @"正在拼命加载更多数据...";
    [self.loadingView startAnimating];
    self.refreshing = YES;
}

- (void)endRefreshing
{
    self.statusLabel.text = @"上拉可以加载更多数据";
    [self.loadingView stopAnimating];
    self.refreshing = NO;
}


@end

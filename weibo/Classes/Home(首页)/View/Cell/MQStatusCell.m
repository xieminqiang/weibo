//
//高仿微博
//作者：强子哥哥
//https://github.com/xieminqiang/weibo.
//

#import "MQStatusCell.h"
#import "MQStatusDetailView.h"
#import "MQStatusToolbar.h"
#import "MQStatusFrame.h"

@interface MQStatusCell()
@property (nonatomic, weak) MQStatusDetailView *detailView;
@property (nonatomic, weak) MQStatusToolbar *toolbar;
@end

@implementation MQStatusCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    MQStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MQStatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) { // 初始化子控件
        // 1.添加微博具体内容
        MQStatusDetailView *detailView = [[MQStatusDetailView alloc] init];
        [self.contentView addSubview:detailView];
        self.detailView = detailView;
        
        // 2.添加工具条
        MQStatusToolbar *toolbar = [[MQStatusToolbar alloc] init];
        [self.contentView addSubview:toolbar];
        self.toolbar = toolbar;
        
        // 3.cell的设置
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setStatusFrame:(MQStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    // 1.微博具体内容的frame数据
    self.detailView.detailFrame = statusFrame.detailFrame;
    
    // 2.底部工具条的frame数据
    self.toolbar.frame = statusFrame.toolbarFrame;
    self.toolbar.status = statusFrame.status;
}
@end
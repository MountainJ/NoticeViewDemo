//
//  KKNoticeView.m
//  KKOL
//
//  Created by JayZY on 17/3/27.
//  Copyright © 2017年 KKZX. All rights reserved.
//

#import "KKNoticeView.h"



#define NOTICE_TIME_INTERVAL  4.0

@interface KKNoticeView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;

@property (nonatomic,strong) NSTimer *timer;

@end


@implementation KKNoticeView

- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)noticeDataSource
{
    if (self = [super initWithFrame:frame]) {
        [self addChildView];
    }
    return self;

}


- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    return  [self initWithFrame:frame dataSource:nil];
}

- (void)addChildView
{
    
    //数据源数据
//    [self.dataSource addObject:@"不要忽视体检报告，它隐藏着很多身体的秘密！"];
////    [self.dataSource addObject:@"2不要忽视体检报告，它隐藏秘密！"];
////    [self.dataSource addObject:@"3不要忽视体检报告"];
//    //数据插入最后一条数据在最前面
//    [self.dataSource insertObject:@"3不要忽视体检报告" atIndex:0];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.scrollEnabled = NO;
    self.tableView.bounces = NO;

    [self addSubview:self.tableView];
    
    
   
    
}




#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.dataSource.count == 0) {
        return 0;
    }
    return self.dataSource.count + 2;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.bounds.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"kkcelldi";
    KKNoticeCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[KKNoticeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.backgroundColor = [UIColor redColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *dict = [self.dataSource objectAtIndex:indexPath.row];
    [cell setNoticeTitle:dict[@"TPBT"]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.row == self.dataSource.count + 1) {
        return;
    }
    id obj   = [self.dataSource objectAtIndex:indexPath.row];
    if (self.delegate && [self.delegate respondsToSelector:@selector(KKNoticeView:clickedObj:)]) {
        [self.delegate KKNoticeView:self clickedObj:obj];
    }
    
}

- (void)startNoticeWithDataSource:(NSArray *)dataArr
{
    if (!dataArr.count) {
        return;
    }
    [self.dataSource removeAllObjects];
    [self.dataSource addObjectsFromArray:dataArr];
    id obj = [self.dataSource lastObject];
    [self.dataSource insertObject:obj atIndex:0];
    [self.tableView reloadData];

    [self.tableView setContentOffset:CGPointMake(self.tableView.frame.size.height, 0) animated:NO];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]atScrollPosition:UITableViewScrollPositionTop animated:NO];
    
    if (self.dataSource.count > 2) {
        self.timer =  [NSTimer scheduledTimerWithTimeInterval:NOTICE_TIME_INTERVAL target:self selector:@selector(scrollToNext) userInfo:nil repeats:YES];
    }

}

- (void)scrollToNext
{
    UITableViewCell * visiCell = [[self.tableView visibleCells] objectAtIndex:0];
    NSIndexPath * visiIndex = [self.tableView indexPathForCell:visiCell];
    if (visiIndex.row == self.dataSource.count - 1) {
        [self.tableView setContentOffset:CGPointMake(0, 0) animated:NO];
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }else{
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:visiIndex.row+1 inSection:0]atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
    
}


- (void)dealloc
{
    if ([self.timer isValid]) {
        [self.timer invalidate];
    }
}

@end

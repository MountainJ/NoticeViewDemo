//
//  ViewController.m
//  KKNoticeDemo
//
//  Created by JayZY on 17/4/5.
//  Copyright © 2017年 MK INC. All rights reserved.
//

#import "ViewController.h"

#import "KKNoticeView.h"



@interface ViewController ()<KKNoticeViewDelegate>

@property (nonatomic,strong) KKNoticeView *noticeView;
@property (nonatomic,strong) NSMutableArray *noticeTitles;


@end

@implementation ViewController


- (NSMutableArray *)noticeTitles
{
    if (!_noticeTitles) {
        _noticeTitles = [NSMutableArray array];
    }
    return _noticeTitles;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
         self.noticeView = [[KKNoticeView alloc] initWithFrame:CGRectMake(0, 200, AppScreenWidth, 50)];
    self.noticeView.backgroundColor = [UIColor lightGrayColor];
    self.noticeView.delegate = self;
    [self.view addSubview:self.noticeView];
    
    [self.noticeTitles addObject:@{@"TPBT":@"1.测试第一条上",@"":@""}];
    [self.noticeTitles addObject:@{@"TPBT":@"2.测试第二条中",@"":@""}];
    [self.noticeTitles addObject:@{@"TPBT":@"3.测试第三条下",@"":@""}];

    [self.noticeView startNoticeWithDataSource:self.noticeTitles];

}

- (void)KKNoticeView:(KKNoticeView *)clicked clickedObj:(id)obj
{
    NSLog(@"%@",obj);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

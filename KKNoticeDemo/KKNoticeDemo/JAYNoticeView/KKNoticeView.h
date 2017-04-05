//
//  KKNoticeView.h
//  KKOL
//
//  Created by JayZY on 17/3/27.
//  Copyright © 2017年 KKZX. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KKNoticeCell.h"

@class KKNoticeView;

@protocol KKNoticeViewDelegate <NSObject>

- (void)KKNoticeView:(KKNoticeView *)clicked clickedObj:(id)obj;

@end

@interface KKNoticeView : UIView

@property (nonatomic,weak) id<KKNoticeViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)noticeDataSource;

- (void)startNoticeWithDataSource:(NSArray *)dataArr;


@end

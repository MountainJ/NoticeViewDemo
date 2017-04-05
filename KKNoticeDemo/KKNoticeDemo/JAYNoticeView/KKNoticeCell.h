//
//  KKNoticeCell.h
//  KKOL
//
//  Created by JayZY on 17/3/27.
//  Copyright © 2017年 KKZX. All rights reserved.
//

#import <UIKit/UIKit.h>

//适配屏幕比例
#define KKFitScreen(widthOrHeight)     (ceilf([UIScreen mainScreen].bounds.size.width / 375.0f  * ((widthOrHeight) / 2) * 2) / 2.0f)
//屏幕尺寸
#define AppScreenHeight             [[UIScreen mainScreen] bounds].size.height
#define AppScreenWidth              [[UIScreen mainScreen] bounds].size.width


#define NOTICE_LABEL_FONT   [UIFont systemFontOfSize:KKFitScreen(26.0)]

@interface KKNoticeCell : UITableViewCell


- (void)setNoticeTitle:(NSString *)noticeTitle;

@end

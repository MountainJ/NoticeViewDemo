//
//  KKNoticeCell.m
//  KKOL
//
//  Created by JayZY on 17/3/27.
//  Copyright © 2017年 KKZX. All rights reserved.
//

#import "KKNoticeCell.h"

@interface KKNoticeCell ()

@property (nonatomic,weak) UILabel *noticeLabel;

@end

@implementation KKNoticeCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    
        [self addChildView];
    }
    return  self;

}

- (void)addChildView
{
    
//    CGFloat cellHeight = KKFitScreen(60.0);
 
    CGFloat cellHeight = self.bounds.size.height;

    CGSize sizeWidth = [self labelChangeSize:CGSizeMake(MAXFLOAT, KKFitScreen(30.0)) Attribute:@{NSFontAttributeName:NOTICE_LABEL_FONT} labelText:@"公告"];
    UILabel * tipsLabel = [self labelWithFrame:CGRectMake(KKFitScreen(30.0),cellHeight *0.5 -KKFitScreen(30.0) *0.5 , sizeWidth.width + KKFitScreen(10.0), KKFitScreen(30.0)) backGroundColor:[UIColor clearColor] textColor:[UIColor whiteColor] textFont:NOTICE_LABEL_FONT addToView:self.contentView labelText:@"公告"];
    tipsLabel.textAlignment = NSTextAlignmentCenter;
    tipsLabel.layer.cornerRadius = KKFitScreen(8.0);
    tipsLabel.layer.masksToBounds = YES;
    tipsLabel.layer.borderWidth = KKFitScreen(2.0);
    tipsLabel.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor;
    //
    UIImageView *rightArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_white"]];
    rightArrow.contentMode = UIViewContentModeScaleAspectFit;
    rightArrow.frame = CGRectMake(AppScreenWidth - KKFitScreen(20.0) -KKFitScreen(24.0), cellHeight *0.5 -KKFitScreen(24.0) *0.5, KKFitScreen(24.0), KKFitScreen(24.0));
    [self.contentView addSubview:rightArrow];
    //
    CGFloat x = CGRectGetMaxX(tipsLabel.frame) +KKFitScreen(20.0);
    UILabel * noticeTile = [self labelWithFrame:CGRectMake(x,0 , CGRectGetMinX(rightArrow.frame) - (x),cellHeight) backGroundColor:[UIColor clearColor] textColor:[UIColor whiteColor] textFont:NOTICE_LABEL_FONT addToView:self.contentView labelText:@""];
    self.noticeLabel = noticeTile;
}

- (void)setNoticeTitle:(NSString *)noticeTitle
{
    if (!noticeTitle) {
        return;
    }
    self.noticeLabel.text = noticeTitle;
}


/**
 *  计算文本宽高
 */
- (CGSize)labelChangeSize:(CGSize)originSize Attribute:(NSDictionary *)attributes labelText:(NSString *)text
{
    if (!text && [text length] == 0) {
        return CGSizeZero;
    }
    return   [text boundingRectWithSize:originSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    
}

-  (UILabel *)labelWithFrame:(CGRect)frame  backGroundColor:(UIColor *)backGroundColor  textColor:(UIColor *)textColor textFont:(UIFont *)font addToView:(UIView *)targetView labelText:(NSString *)labelText
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = backGroundColor;
    label.textColor = textColor;
    label.font = font;
    label.text = labelText;
    [targetView addSubview:label];
    return label;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

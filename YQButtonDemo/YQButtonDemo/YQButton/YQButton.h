//
//  YQButton.h
//  YQButton
//
//  Created by 杨清 on 2017/6/13.
//  Copyright © 2017年 QuinceyYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YQButton : UIButton

@property (nonatomic, copy) void (^tapAction)(YQButton *sender);

/**
 * 图片在上
 */
- (instancetype)initWithFrame:(CGRect)frame imageAtTop:(CGFloat)topOffset space:(CGFloat)space;

/**
 * 图片在下
 */
- (instancetype)initWithFrame:(CGRect)frame imageAtBottom:(CGFloat)topOffset space:(CGFloat)space;

/**
 * 图片在左边，标题靠左，标题长度有限制
 */
- (instancetype)initWithFrame:(CGRect)frame imageAtLeft:(CGFloat)leftOffset space:(CGFloat)space rightOffset:(CGFloat)rightOffset;

/**
 * 图片在左边，标题自适应
 */
- (instancetype)initWithFrame:(CGRect)frame imageAtLeft:(CGFloat)leftOffset space:(CGFloat)space;

/**
 * 图片在右边，标题靠左，标题长度有限制
 */
- (instancetype)initWithFrame:(CGRect)frame imageAtRight:(CGFloat)leftOffset space:(CGFloat)space rightOffset:(CGFloat)rightOffset;

/**
 * 图片在右边，标题自适应，且标题靠近图片
 */
- (instancetype)initWithFrame:(CGRect)frame imageAtRight:(CGFloat)rightOffset space:(CGFloat)space;

/**
 * 自定义图片和标题位置
 */
- (instancetype)initWithFrame:(CGRect)frame imageFrame:(CGRect)imageFrame titleFrame:(CGRect)titleFrame;


/**
 * 图片和标题整体居中，且图片在左，标题在右
 */
- (instancetype)initWithFrame:(CGRect)frame contentAtCenterWithSpace:(CGFloat)space;


@end

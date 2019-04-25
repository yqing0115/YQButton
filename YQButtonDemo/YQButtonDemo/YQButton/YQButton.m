//
//  YQButton.m
//  YQButton
//
//  Created by 杨清 on 2017/6/13.
//  Copyright © 2017年 Soargift. All rights reserved.
//

#import "YQButton.h"

#undef NSLog //yqing add for debug
#ifdef DEBUG
#define NSLog(format,args...)    NSLog(@"\n[yqing]<%@ %s line%d>" format"\n", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __PRETTY_FUNCTION__, __LINE__,##args)
#define printf(fmt,args...)   printf("\n[yqing]<%@ %s line%d>" fmt"\n", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __PRETTY_FUNCTION__, __LINE__, ##args)
#else
#define NSLog(fmt,args...)    {}
#define printf(fmt,args...)   {}
#endif

typedef NS_ENUM(NSUInteger, YQButtonType) {
    YQButtonTypeDefault,
    YQButtonTypeImageAtTop,
    YQButtonTypeImageAtBottom,
    YQButtonTypeImageAtLeft,///<图片在左边，标题靠左，标题长度有限制
    YQButtonTypeImageAtLeftSelfAdaption, ///<图片在左边，标题自适应
    YQButtonTypeImageAtRight,///<图片在右边，标题靠左，标题长度有限制
    YQButtonTypeImageAtRightSelfAdaption, ///<图片在右边，标题自适应，且标题靠近图片
    YQButtonTypeContentAtCenter,
    YQButtonTypeCustomFrame
};

@implementation YQButton
{
    YQButtonType _yqButtonType;
    CGFloat _topOffset;
    CGFloat _space;
    CGFloat _leftOffset;
    CGFloat _rightOffset;
    
    CGRect _imageFrame;
    CGRect _titleFrame;
}

#pragma mark - init methods
/**
 * 图片在上
 */
- (instancetype)initWithFrame:(CGRect)frame imageAtTop:(CGFloat)topOffset space:(CGFloat)space
{
    self = [super initWithFrame:frame];
    if (self) {
        _yqButtonType = YQButtonTypeImageAtTop;
        _topOffset = topOffset;
        _space = space;
    }
    
    return self;
}

/**
 * 图片在下
 */
- (instancetype)initWithFrame:(CGRect)frame imageAtBottom:(CGFloat)topOffset space:(CGFloat)space
{
    self = [super initWithFrame:frame];
    if (self) {
        _yqButtonType = YQButtonTypeImageAtBottom;
        _topOffset = topOffset;
        _space = space;
    }
    
    return self;
}


/**
 * 图片在左边，标题靠左，标题长度有限制
 */
- (instancetype)initWithFrame:(CGRect)frame imageAtLeft:(CGFloat)leftOffset space:(CGFloat)space rightOffset:(CGFloat)rightOffset
{
    self = [super initWithFrame:frame];
    if (self) {
        _yqButtonType = YQButtonTypeImageAtLeft;
        _leftOffset = leftOffset;
        _space = space;
        _rightOffset = rightOffset;
    }
    
    return self;
}

/**
 * 图片在左边，标题自适应
 */
- (instancetype)initWithFrame:(CGRect)frame imageAtLeft:(CGFloat)leftOffset space:(CGFloat)space
{
    self = [super initWithFrame:frame];
    if (self) {
        _yqButtonType = YQButtonTypeImageAtLeftSelfAdaption;
        _leftOffset = leftOffset;
        _space = space;
    }
    
    return self;
}



/**
 * 图片在右边，标题靠左，标题长度有限制
 */
- (instancetype)initWithFrame:(CGRect)frame imageAtRight:(CGFloat)leftOffset space:(CGFloat)space rightOffset:(CGFloat)rightOffset
{
    self = [super initWithFrame:frame];
    if (self) {
        _yqButtonType = YQButtonTypeImageAtRight;
        _leftOffset = leftOffset;
        _space = space;
        _rightOffset = rightOffset;
    }
    
    return self;
}

/**
 * 图片在右边，标题自适应，且标题靠近图片
 */
- (instancetype)initWithFrame:(CGRect)frame imageAtRight:(CGFloat)rightOffset space:(CGFloat)space
{
    self = [super initWithFrame:frame];
    if (self) {
        _yqButtonType = YQButtonTypeImageAtRightSelfAdaption;
        _space = space;
        _rightOffset = rightOffset;
    }
    
    return self;
}


/**
 * 自定义图片和标题位置
 */
- (instancetype)initWithFrame:(CGRect)frame imageFrame:(CGRect)imageFrame titleFrame:(CGRect)titleFrame
{
    self = [super initWithFrame:frame];
    if (self) {
        _yqButtonType = YQButtonTypeCustomFrame;
        _imageFrame = imageFrame;
        _titleFrame = titleFrame;
    }
    
    return self;
}


/**
 * 图片和标题整体居中，且图片在左，标题在右
 */
- (instancetype)initWithFrame:(CGRect)frame contentAtCenterWithSpace:(CGFloat)space
{
    self = [super initWithFrame:frame];
    if (self) {
        _yqButtonType = YQButtonTypeContentAtCenter;
        _space = space;
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        self.contentVerticalAlignment   = UIControlContentVerticalAlignmentCenter;
    }
    
    return self;
}



#pragma mark -
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.imageView==nil || self.titleLabel==nil || _yqButtonType==YQButtonTypeDefault) {
        return;
    }
    else {
    
        NSLog(@"");
        CGSize imgSize = self.imageView.bounds.size;
        CGSize titleSize = self.titleLabel.bounds.size;
        CGRect newImageFrame = self.imageView.frame;
        CGRect newTitleLabelFrame = self.titleLabel.frame;
        
        switch (_yqButtonType) {
            case YQButtonTypeImageAtTop:
            {
                newImageFrame = CGRectMake(self.frame.size.width/2-imgSize.width/2, _topOffset, imgSize.width, imgSize.height);
                self.imageView.frame = newImageFrame;
                
                self.titleLabel.textAlignment = NSTextAlignmentCenter;
                newTitleLabelFrame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame)+_space, self.frame.size.width, titleSize.height);
                self.titleLabel.frame = newTitleLabelFrame;
            }
                break;
                
            case YQButtonTypeImageAtBottom:
            {
                self.titleLabel.textAlignment = NSTextAlignmentCenter;
                newTitleLabelFrame = CGRectMake(0, _topOffset, self.frame.size.width, titleSize.height);
                self.titleLabel.frame = newTitleLabelFrame;

                newImageFrame = CGRectMake(self.frame.size.width/2-imgSize.width/2, CGRectGetMaxY(self.titleLabel.frame)+_space, imgSize.width, imgSize.height);
                self.imageView.frame = newImageFrame;
                
            }
                break;
                
            case YQButtonTypeImageAtLeft:
            {
                if (self.frame.size.width-_leftOffset-_space-_rightOffset-imgSize.width<=0) {
                    NSLog(@"Error : self width is short");
                    return;
                }
                newImageFrame = CGRectMake(_leftOffset, self.frame.size.height/2-imgSize.height/2, imgSize.width, imgSize.height);
                self.imageView.frame = newImageFrame;
                
                self.titleLabel.textAlignment = NSTextAlignmentLeft;
                newTitleLabelFrame = CGRectMake(CGRectGetMaxX(self.imageView.frame)+_space, self.frame.size.height/2-titleSize.height/2, self.frame.size.width-(CGRectGetMaxX(self.imageView.frame)+_space)-_rightOffset, titleSize.height);
                self.titleLabel.frame = newTitleLabelFrame;
            }
                break;
                
            case YQButtonTypeImageAtLeftSelfAdaption:
            {
                if (self.frame.size.width-_leftOffset-_space-_rightOffset-imgSize.width<=0) {
                    NSLog(@"Error : self width is short");
                    return;
                }
                newImageFrame = CGRectMake(_leftOffset, self.frame.size.height/2-imgSize.height/2, imgSize.width, imgSize.height);
                self.imageView.frame = newImageFrame;
                
                self.titleLabel.textAlignment = NSTextAlignmentLeft;
                newTitleLabelFrame = CGRectMake(CGRectGetMaxX(self.imageView.frame)+_space, self.frame.size.height/2-titleSize.height/2, titleSize.width, titleSize.height);
                self.titleLabel.frame = newTitleLabelFrame;
            }
                break;
                
            case YQButtonTypeImageAtRight:
            {
                if (self.frame.size.width-_leftOffset-_space-_rightOffset-imgSize.width<=0) {
                    NSLog(@"Error : self width is short");
                    return;
                }
                self.titleLabel.textAlignment = NSTextAlignmentLeft;
                CGFloat titleW = self.frame.size.width-_leftOffset-_space-imgSize.width-_rightOffset;
                newTitleLabelFrame = CGRectMake(_leftOffset, self.frame.size.height/2-titleSize.height/2, titleW, titleSize.height);
                self.titleLabel.frame = newTitleLabelFrame;
                
                newImageFrame = CGRectMake(CGRectGetMaxX(self.titleLabel.frame)+_space, self.frame.size.height/2-imgSize.height/2, imgSize.width, imgSize.height);
                self.imageView.frame = newImageFrame;            
            }
                break;
                
            case YQButtonTypeImageAtRightSelfAdaption:
            {
                if (self.frame.size.width-_space-_rightOffset-imgSize.width<=0) {
                    NSLog(@"Error : self width is short");
                    return;
                }
                newImageFrame = CGRectMake(self.frame.size.width-_rightOffset-imgSize.width, self.frame.size.height/2-imgSize.height/2, imgSize.width, imgSize.height);
                self.imageView.frame = newImageFrame;

                newTitleLabelFrame = CGRectMake(self.frame.size.width-_rightOffset-imgSize.width-_space-titleSize.width, self.frame.size.height/2-titleSize.height/2, titleSize.width, titleSize.height);
                self.titleLabel.frame = newTitleLabelFrame;
            }
                break;
                
            case YQButtonTypeContentAtCenter:
            {
                NSLog();
                //有两次进入，所以_space/4
                if (self.titleLabel.frame.origin.x-CGRectGetMaxX(self.imageView.frame) < _space) {
                    self.imageView.frame = CGRectMake(self.imageView.frame.origin.x-_space/4, self.imageView.frame.origin.y, self.imageView.frame.size.width, self.imageView.frame.size.height);
                    
                    self.titleLabel.frame = CGRectMake(self.titleLabel.frame.origin.x+_space/4, self.titleLabel.frame.origin.y, self.titleLabel.frame.size.width, self.titleLabel.frame.size.height);
                }
            }
                break;
                
            case YQButtonTypeCustomFrame:
            {
                if (CGRectContainsRect(self.bounds, _imageFrame) && CGRectContainsRect(self.bounds, _titleFrame)) {
                    self.imageView.contentMode = UIViewContentModeCenter;
                    self.imageView.frame = _imageFrame;
                    self.titleLabel.frame = _titleFrame;
                }
                else {
                    NSLog(@"Error : frame error");
                }
            }
                break;
                
            default:
                break;
        }
        
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - setter

- (void)setTapAction:(void (^)(YQButton *))tapAction {
    _tapAction = tapAction;
    if (_tapAction) {
        [self removeTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark -
- (void)tapButton:(YQButton *)sender {
    if (self.tapAction) {
        self.tapAction(sender);
    }
}

@end

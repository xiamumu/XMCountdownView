//
//  KPTimeDownView.h
//  KuaiPin
//
//  Created by 21_xm on 16/5/12.
//  Copyright © 2016年 21_xm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMCountdownView : UIImageView

/**  倒计时时间戳，如无设置，显示0 */
@property (nonatomic, copy) NSString *countDownTime;
/**  倒计时间隔,默认是1秒 */
@property (nonatomic, assign) NSUInteger interval;
/**  数字区的背景图片 */
@property (nonatomic, strong) UIImage *subNumBackgroundImage;
/**  数字区的数字颜色，默认是白色 */
@property (nonatomic, strong) UIColor *subNumColor;
/**  数字区的数字的大小，默认大小30 */
@property (nonatomic, strong) UIFont *subNumFont;
/**  时、分、秒的文字颜色，默认是grayColor */
@property (nonatomic, strong) UIColor *titleColor;
/**  时、分、秒的字体大小，默认大小17 */
@property (nonatomic, strong) UIFont *titleFont;

/** 倒计时总体背景图片 */
@property (nonatomic, strong) UIImage *backgroundImage;

/**  数字区的数字的高度，默认是背景图片的高度 */
@property (nonatomic, assign) CGFloat subNumHeight;
/**  数字区的数字的宽度，默认是背景图片的宽度 */
@property (nonatomic, assign) CGFloat subNumWidth;
/**  更换显示时分秒文字（可更换成其他文字,只识别前三个）*/
@property (nonatomic, strong) NSArray *titles;
@end

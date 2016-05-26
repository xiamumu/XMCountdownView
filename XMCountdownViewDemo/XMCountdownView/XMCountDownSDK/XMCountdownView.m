//
//  KPTimeDownView.m
//  KuaiPin
//
//  Created by 21_xm on 16/5/12.
//  Copyright © 2016年 21_xm. All rights reserved.
//

#import "XMCountdownView.h"

#define DayNumCount 3
#define HourNumCount 2
#define MinuteNumCount 2

#pragma mark - KPSingleTimeLabel
@interface XMSingleNumLabel : UIButton

@property (nonatomic, copy) NSString *time;
/**  数字区的背景图片 */
@property (nonatomic, strong) UIImage *backgroundImage;
/**  数字区的数字颜色 */
@property (nonatomic, strong) UIColor *backgroundColor;
/**  数字区的数字的大小 */
@property (nonatomic, assign) UIFont *font;
@end

@implementation XMSingleNumLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:[UIImage imageNamed:@"timeLabel_bg"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:30];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.userInteractionEnabled = NO;
        
    }
    return self;
}

- (void)setTime:(NSString *)time
{
    _time = [time copy];
    [self setTitle:time forState:UIControlStateNormal];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    _backgroundImage = backgroundImage;
    [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
}
- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    _backgroundColor = backgroundColor;
    [self setTitleColor:backgroundColor forState:UIControlStateNormal];
}
- (void)setFont:(UIFont *)font
{
    _font = font;
    self.titleLabel.font = font;
}

@end
#pragma mark - KPTimeDownView
@interface XMCountdownView ()

@property (nonatomic, strong) NSMutableArray *dayNumLabs;
@property (nonatomic, strong) NSMutableArray *hourNumLabs;
@property (nonatomic, strong) NSMutableArray *minuteNumLabs;

@property (nonatomic, strong) NSMutableArray *dayCharS;
@property (nonatomic, strong) NSMutableArray *hourCharS;
@property (nonatomic, strong) NSMutableArray *minuteCharS;

@property (nonatomic, assign) NSInteger day;
@property (nonatomic, assign) NSInteger hour;
@property (nonatomic, assign) NSInteger minute;

@property (nonatomic, weak) UILabel *dayLab;
@property (nonatomic, weak) UILabel *hourLab;
@property (nonatomic, weak) UILabel *minuteLab;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation XMCountdownView
#pragma mark - 懒加载
- (NSMutableArray *)dayNumLabs
{
    if (_dayNumLabs == nil) {
        _dayNumLabs = [NSMutableArray array];
    }
    return _dayNumLabs;
}
- (NSMutableArray *)hourNumLabs
{
    if (_hourNumLabs == nil) {
        _hourNumLabs = [NSMutableArray array];
    }
    return _hourNumLabs;
}
- (NSMutableArray *)minuteNumLabs
{
    if (_minuteNumLabs == nil) {
        _minuteNumLabs = [NSMutableArray array];
    }
    return _minuteNumLabs;
}
- (NSMutableArray *)dayCharS
{
    if (_dayCharS == nil) {
        _dayCharS = [[NSMutableArray alloc] init];
    }
    return _dayCharS;
}
- (NSMutableArray *)hourCharS
{
    if (_hourCharS == nil) {
        _hourCharS = [[NSMutableArray alloc] init];
    }
    return _hourCharS;
}
- (NSMutableArray *)minuteCharS
{
    if (_minuteCharS == nil) {
        _minuteCharS = [[NSMutableArray alloc] init];
    }
    return _minuteCharS;
}
#pragma mark - UI
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        for (int i = 0; i < DayNumCount ; i++) {
            XMSingleNumLabel *numLab = [[XMSingleNumLabel alloc] init];
            [self addSubview:numLab];
            [self.dayNumLabs addObject:numLab];
        }
        for (int i = 0; i < HourNumCount ; i++) {
            XMSingleNumLabel *numLab = [[XMSingleNumLabel alloc] init];
            [self addSubview:numLab];
            [self.hourNumLabs addObject:numLab];
        }
        
        for (int i = 0; i < MinuteNumCount ; i++) {
            XMSingleNumLabel *numLab = [[XMSingleNumLabel alloc] init];
            [self addSubview:numLab];
            [self.minuteNumLabs addObject:numLab];
        }
        
        
        UILabel *dayLab = [self addLabelWithTitle:@"天" bgColor:[UIColor grayColor] font:[UIFont systemFontOfSize:17]];
        self.dayLab = dayLab;
        UILabel *hourLab = [self addLabelWithTitle:@"时" bgColor:[UIColor grayColor] font:[UIFont systemFontOfSize:17]];
        self.hourLab = hourLab;
        UILabel *minuteLab = [self addLabelWithTitle:@"分" bgColor:[UIColor grayColor] font:[UIFont systemFontOfSize:17]];
        self.minuteLab = minuteLab;
    }
    return self;
}

- (void)setSubNumBackgroundImage:(UIImage *)subNumBackgroundImage
{
    _subNumBackgroundImage = subNumBackgroundImage;
    for (XMSingleNumLabel *lable in self.dayNumLabs) {
        lable.backgroundImage = subNumBackgroundImage;
    }
    for (XMSingleNumLabel *lable in self.hourNumLabs) {
        lable.backgroundImage = subNumBackgroundImage;
    }
    for (XMSingleNumLabel *lable in self.minuteNumLabs) {
        lable.backgroundImage = subNumBackgroundImage;
    }
}
- (void)setSubNumColor:(UIColor *)subNumColor
{
    _subNumColor = subNumColor;
    for (XMSingleNumLabel *lable in self.dayNumLabs) {
        lable.backgroundColor = subNumColor;
    }
    for (XMSingleNumLabel *lable in self.hourNumLabs) {
        lable.backgroundColor = subNumColor;
    }
    for (XMSingleNumLabel *lable in self.minuteNumLabs) {
        lable.backgroundColor = subNumColor;
    }
}
- (void)setSubNumFont:(UIFont *)subNumFont
{
    _subNumFont = subNumFont;
    for (XMSingleNumLabel *lable in self.dayNumLabs) {
        lable.font = subNumFont;
    }
    for (XMSingleNumLabel *lable in self.hourNumLabs) {
        lable.font = subNumFont;
    }
    for (XMSingleNumLabel *lable in self.minuteNumLabs) {
        lable.font = subNumFont;
    }
    
}
- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    self.dayLab.textColor = titleColor;
    self.hourLab.textColor = titleColor;
    self.minuteLab.textColor = titleColor;
}
- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    self.dayLab.font = titleFont;
    self.hourLab.font = titleFont;
    self.minuteLab.font = titleFont;
}
- (void)setTitles:(NSArray *)titles
{
    _titles = titles;
    self.dayLab.text = titles[0];
    self.hourLab.text = titles[1];
    self.minuteLab.text = titles[2];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    _backgroundImage = backgroundImage;
    self.image = backgroundImage;
}

// 根据时间戳实现倒计时
- (void)setCountDownTime:(NSString *)countDownTime
{
    _countDownTime = countDownTime;
    
    // 假定时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
//    NSDate *endDay = [formatter dateFromString:@"2016-05-12 18:00:00"];
    
    NSDate *today = [NSDate date];
    NSDate *endDay = [NSDate dateWithTimeIntervalSince1970:countDownTime.integerValue];
    NSLog(@"%@=====%@======%@", today, endDay, countDownTime);

    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute fromDate:today toDate:endDay options:0];
    self.day = [components day];
    self.hour = [components hour];
    self.minute = [components minute];
    
    [self setTimeToNumLabWithDay:self.day hour:self.hour minute:self.minute];
    
    // 添加定时器
    NSUInteger interval = self.interval;
    if (self.interval == 0) {
        interval = 1;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(countDownTimeAction:) userInfo:nil repeats:YES];
    [self.timer fire];
}
- (void)setTimeToNumLabWithDay:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute
{
    [self.dayCharS removeAllObjects];
    [self.hourCharS removeAllObjects];
    [self.minuteCharS removeAllObjects];
    NSString *dayChar = [NSString stringWithFormat:@"%03ld", day];
    NSString *hourChar = [NSString stringWithFormat:@"%02ld", hour];
    NSString *minuteChar = [NSString stringWithFormat:@"%02ld", minute];
    
    NSString *dayFirstChar = [dayChar substringWithRange:NSMakeRange(0, 1)];
    NSString *daySecondChar = [dayChar substringWithRange:NSMakeRange(1, 1)];
    NSString *dayThirdChar = [dayChar substringWithRange:NSMakeRange(2, 1)];
    [self.dayCharS addObject:dayFirstChar];
    [self.dayCharS addObject:daySecondChar];
    [self.dayCharS addObject:dayThirdChar];
    
    NSString *hourFirstChar = [hourChar substringWithRange:NSMakeRange(0, 1)];
    NSString *hourSecondChar = [hourChar substringWithRange:NSMakeRange(1, 1)];
    [self.hourCharS addObject:hourFirstChar];
    [self.hourCharS addObject:hourSecondChar];
    
    NSString *minuteFirstChar = [minuteChar substringWithRange:NSMakeRange(0, 1)];
    NSString *minuteSecondChar = [minuteChar substringWithRange:NSMakeRange(1, 1)];
    [self.minuteCharS addObject:minuteFirstChar];
    [self.minuteCharS addObject:minuteSecondChar];
    
    
    for (int i = 0; i < DayNumCount ; i++) {
        XMSingleNumLabel *numLab = self.dayNumLabs[i];
        numLab.time = self.dayCharS[i];
    }
    for (int i = 0; i < HourNumCount ; i++) {
        XMSingleNumLabel *numLab = self.hourNumLabs[i];
        numLab.time = self.hourCharS[i];
    }
    for (int i = 0; i < MinuteNumCount ; i++) {
        XMSingleNumLabel *numLab = self.minuteNumLabs[i];
        numLab.time = self.minuteCharS[i];
    }
}
- (void)countDownTimeAction:(NSTimeInterval *)timeInterval
{
    self.minute--;
    if (self.minute == 0) {
        self.minute = 59;
        self.hour--;
        if (self.hour == 0) {
            self.hour = 23;
            self.day--;
        }
    }
    if (self.day < 0 || self.hour < 0 || self.minute < 0) {
        [self.timer invalidate];
        self.timer = nil;
        [self setTimeToNumLabWithDay:0 hour:0 minute:0];
    }else {
        [self setTimeToNumLabWithDay:self.day hour:self.hour minute:self.minute];
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UIImage *numImage = [UIImage imageNamed:@"timeLabel_bg"];
    CGFloat margin = 3;
    CGFloat numLabW = self.subNumWidth;
    if (self.subNumWidth == 0) {
        numLabW = numImage.size.width;
    }
    CGFloat numLabH = self.subNumHeight;
    if (self.subNumHeight == 0) {
        numLabW = numImage.size.width;
    }
    
    CGFloat dayLabW = [self.dayLab.text sizeWithAttributes:@{NSFontAttributeName: self.dayLab.font}].width;
    CGFloat hourLabW = [self.hourLab.text sizeWithAttributes:@{NSFontAttributeName: self.hourLab.font}].width;
    CGFloat minuteLabW = [self.minuteLab.text sizeWithAttributes:@{NSFontAttributeName: self.minuteLab.font}].width;
    CGFloat timeW =  MAX(minuteLabW, MAX(dayLabW, hourLabW));

    CGFloat timeH = numLabH;
    
    CGFloat MaxX = 0;
    for (int i = 0; i < DayNumCount ; i++) {
        XMSingleNumLabel *numLab = self.dayNumLabs[i];
        numLab.frame = CGRectMake(MaxX, 0, numLabW, numLabH);
        MaxX = CGRectGetMaxX(numLab.frame) + margin;
    }
    
    self.dayLab.frame = CGRectMake(MaxX, 0, timeW, timeH);
    MaxX = CGRectGetMaxX(self.dayLab.frame) + margin;
    
    for (int i = 0; i < HourNumCount ; i++) {
        XMSingleNumLabel *numLab = self.hourNumLabs[i];
        numLab.frame = CGRectMake(MaxX, 0, numLabW, numLabH);
        MaxX = CGRectGetMaxX(numLab.frame) + margin;
    }
    
    self.hourLab.frame = CGRectMake(MaxX, 0, timeW, timeH);
    MaxX = CGRectGetMaxX(self.hourLab.frame) + margin;
    
    for (int i = 0; i < MinuteNumCount ; i++) {
        XMSingleNumLabel *numLab = self.minuteNumLabs[i];
        numLab.frame = CGRectMake(MaxX, 0, numLabW, numLabH);
        MaxX = CGRectGetMaxX(numLab.frame) + margin;
    }
    
    self.minuteLab.frame = CGRectMake(MaxX, 0, timeW, timeH);
    MaxX = CGRectGetMaxX(self.minuteLab.frame);
    
    CGFloat X = self.frame.origin.x;
    CGFloat Y = self.frame.origin.y;
    
    self.frame = CGRectMake(X, Y, MaxX, numLabH);
    
}
- (UILabel *)addLabelWithTitle:(NSString *)title bgColor:(UIColor *)color font:(UIFont *)font
{
    UILabel *lab = [[UILabel alloc] init];
    lab.text = title;
    lab.textColor = color;
    lab.font = font;
    lab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:lab];
    return lab;
}

- (void)dealloc
{
    [self.timer invalidate];
    self.timer = nil;
}
@end





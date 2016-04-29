//
//  Utils.m
//  ttxc
//
//  Created by kael on 6/12/15.
//  Copyright (c) 2015 gzlz. All rights reserved.
//

#import "Utils.h"
//#import <AliyunOSSiOS/OSSService.h>
#import "RIButtonItem.h"
#import "UIAlertView+Blocks.h"
#import "MBProgressHUD.h"
#import "GlobalData.h"

@implementation Utils
//+ (NSString *)hmac_sha1:(NSString *)key
//                   text:(NSString *)text
//{
//
//  const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
//  const char *cData = [text cStringUsingEncoding:NSUTF8StringEncoding];
//
//  char cHMAC[CC_SHA1_DIGEST_LENGTH];
//
//  CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
//
//  NSData *HMAC =
//      [[NSData alloc] initWithBytes:cHMAC length:CC_SHA1_DIGEST_LENGTH];
//  NSString *hash = [[GTMBase64 stringByEncodingData:HMAC] escapedURLString];
//  return hash;
//}

//+ (id)sharedOssService:(OSSBizType)type {
//  static id<ALBBOSSServiceProtocol> ossService = nil;
//  static dispatch_once_t predicate;
//  dispatch_once(&predicate, ^{
//    ossService = [ALBBOSSServiceProvider getService];
//    [ossService setGlobalDefaultBucketHostId:OSS_HOST_ID];
//    if (type == PictureService) {
//      [ossService setGlobalDefaultBucketHostId:OSS_PICTURE_HOST_ID];
//    }
//    [ossService setAuthenticationType:ORIGIN_AKSK];
//    [ossService setGenerateToken:^(NSString *method, NSString *md5,
//                                   NSString *type, NSString *date,
//                                   NSString *xoss, NSString *resource) {
//      NSString *signature = nil;
//      NSString *content =
//          [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@%@", method, md5,
//          type,
//                                     date, xoss, resource];
//      signature =
//          [OSSTool calBase64Sha1WithData:content withKey:OSS_ACCESS_SECRET];
//      signature =
//          [NSString stringWithFormat:@"OSS %@:%@", OSS_ACCESS_KEY, signature];
//      return signature;
//    }];
//  });
//  return ossService;
//}

+ (int)getRandomNumber:(NSInteger)from to:(NSInteger)to {
    return (int)(from + (arc4random() % (to - from + 1)));
}

+ (CGFloat)convertPsPx2Pt:(CGFloat)pixel {
    //按照非retina方式设置字号,设计图是retina,所以需要除以2
    CGFloat proportion = 2.0;
    CGFloat fontSize = pixel / 96.0 * 72.0 / proportion;
    return fontSize;
}

+ (int)currentDevice {
    CGSize iPhone4Size = CGSizeMake(640, 960);
    CGSize iPhone5Size = CGSizeMake(640, 1136);
    CGSize iPhone6Size = CGSizeMake(750, 1334);
    CGSize iPhone6pSize = CGSizeMake(1242, 2208);
    CGSize screensize = [UIScreen mainScreen].currentMode.size;
    if (CGSizeEqualToSize(iPhone5Size, screensize)) {
        return iPhone5;
    } else if (CGSizeEqualToSize(iPhone4Size, screensize)) {
        return iPhone4;
    } else if (CGSizeEqualToSize(iPhone6Size, screensize)) {
        return iPhone6;
    } else if (CGSizeEqualToSize(iPhone6pSize, screensize)) {
        return iPhone6p;
    }
    return iPhone4;
}

+ (void)printAllFonts {
    NSArray *fontFamilies = [UIFont familyNames];
    for (NSString *fontFamily in fontFamilies) {
        NSArray *fontNames = [UIFont fontNamesForFamilyName:fontFamily];
        NSLog(@"%@: %@", fontFamily, fontNames);
    }
}

#pragma 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *)telNumber {
    NSString *pattern = @"^1+[3578]+\\d{9}";
    NSPredicate *pred =
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
}

#pragma 正则匹配用户密码6 - 18位数字和字母组合
+ (BOOL)checkPassword:(NSString *)password {
    //  NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    //  NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    NSString *pattern = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *pred =
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
}

#pragma 正则匹配用户姓名, 20位的中文或英文
+ (BOOL)checkUserName:(NSString *)userName {
    NSString *pattern = @"^[a-zA-Z\u4E00-\u9FA5]{1,20}";
    NSPredicate *pred =
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:userName];
    return isMatch;
}

#pragma 正则匹配用户身份证号15或18位
+ (BOOL)checkUserIdCard:(NSString *)idCard {
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    NSPredicate *pred =
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;
}

#pragma 正则匹员工号, 12位的数字
+ (BOOL)checkEmployeeNumber:(NSString *)number {
    NSString *pattern = @"^[0-9]{12}";
    
    NSPredicate *pred =
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:number];
    return isMatch;
}

#pragma 正则匹配URL
+ (BOOL)checkURL:(NSString *)url {
    NSString *pattern = @"^[0-9A-Za-z]{1,50}";
    NSPredicate *pred =
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:url];
    return isMatch;
}

+ (BOOL)checkInteger:(NSString *)inString {
    NSString *pattern = @"^[1-9]\\d*$";
    NSPredicate *pred =
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:inString];
    return isMatch;
}

+ (NSDate *)string2Date:(NSString *)dateString
           formatterStr:(NSString *)formatterStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (!formatterStr || [@"" isEqualToString:formatterStr]) {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    } else {
        [formatter setDateFormat:formatterStr];
    }
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}


+ (NSString *)stringFromDate:(NSDate *)date
                formatterStr:(NSString *)formatterStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (!formatterStr || [@"" isEqualToString:formatterStr]) {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    } else {
        [formatter setDateFormat:formatterStr];
    }
    return [formatter stringFromDate:date];
}


+ (NSString *)dateStringShorter:(NSString *)dateStr
                   formatterStr:(NSString *)formatterStr {
    NSDate *date = [Utils string2Date:dateStr formatterStr:formatterStr];
    BOOL isToady = [Utils isToday:date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    //当前显示时分
    NSDateComponents *components = [calendar components:unit fromDate:date];
    if (isToady) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:DATE_FORMAT_HM];
        return [dateFormatter stringFromDate:date];
        //    return [NSString stringWithFormat:@"%li:%li", (long)components.hour,
        //                                      (long)components.minute];
    }
    //非当天显示年月日
    else {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:DATE_FORMAT_YMD1];
        return [dateFormatter stringFromDate:date];
        //    return [NSString stringWithFormat:@"%li/%li/%li", components.year %
        //    1000,
        //                                      (long)components.month,
        //                                      (long)components.day];
    }
    return nil;
}


+ (NSString *)dateStringShorter:(NSString *)dateStr
                    inFormatter:(NSString *)inFormatter
                   outFormatter:(NSString *)outFormatter {
    NSDate *date = [Utils string2Date:dateStr formatterStr:inFormatter];
    return [Utils stringFromDate:date formatterStr:outFormatter];
}

+ (BOOL)isToday:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:date];
    return (selfCmps.year ==
            nowCmps
            .year) && //直接分别用当前对象和现在的时间进行比较，比较的属性就是年月日
    (selfCmps.month == nowCmps.month) &&
    (selfCmps.day == nowCmps.day);
}


- (BOOL)isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour {
    NSDate *date8 = [self getCustomDateWithHour:8];
    NSDate *date23 = [self getCustomDateWithHour:23];
    
    NSDate *currentDate = [NSDate date];
    
    if ([currentDate compare:date8] == NSOrderedDescending &&
        [currentDate compare:date23] == NSOrderedAscending) {
        NSLog(@"该时间在 %li:00-%li:00 之间！", fromHour, toHour);
        return YES;
    }
    return NO;
}

/**
 * @brief 生成当天的某个点（返回的是伦敦时间，可直接与当前时间[NSDate
 * date]比较）
 * @param hour 如hour为“8”，就是上午8:00（本地时间）
 */
- (NSDate *)getCustomDateWithHour:(NSInteger)hour {
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:currentDate];
    currentDate = [currentDate dateByAddingTimeInterval:interval];
    NSCalendar *currentCalendar =
    [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |
    NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit |
    NSSecondCalendarUnit;
    
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    
    //设置当天的某个点
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    
    NSCalendar *resultCalendar =
    [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    return [resultCalendar dateFromComponents:resultComps];
}

+ (void)uploadImageAsync:(NSData *)data
                bucketId:(NSString *)bucketId
                     key:(NSString *)key
                filePath:(NSString *)filePath
                fileType:(NSString *)fileType
                 success:(success)success
                 failure:(failure)failure
          uploadProgress:(nullable uploadProgress)uploadProgress {
    [Utils uploadImageSync:data
                  bucketId:bucketId
                       key:key
                  filePath:filePath
                  fileType:fileType
                   success:success
                   failure:failure
            uploadProgress:uploadProgress];
}

//简单的弹出框
+ (void)alertMessage:(NSString *)message title:(NSString *)title {
    [self alertMessage:nil
               message:message
                lTitle:title
                rTitle:nil
               lAction:nil
               rAction:nil];
}


//弹出选择的alert框
+ (void)alertMessage:(NSString *)title
             message:(NSString *)message
              lTitle:(NSString *)lTitle
              rTitle:(NSString *)rTtitle
             lAction:(ButtonEvent)lAction
             rAction:(ButtonEvent)rAction {
    
    RIButtonItem *lButton = nil;
    RIButtonItem *rButton = nil;
    if (title.length == 0) {
        title = @"";
    }
    if (message.length == 0) {
        message = @"";
    }
    if (lTitle.length == 0) {
        lTitle = nil;
    } else {
        lButton = [[RIButtonItem alloc] init];
        lButton.label = lTitle;
        if (lAction) {
            lButton.action = lAction;
        }
    }
    if (rTtitle.length == 0) {
        rTtitle = nil;
    } else {
        rButton = [[RIButtonItem alloc] init];
        rButton.label = rTtitle;
        if (rAction) {
            rButton.action = rAction;
        }
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                           cancelButtonItem:lButton
                                           otherButtonItems:rButton, nil];
    [alert show];
}



+ (BOOL)checkInput:(CheckInputType)textType input:(NSString *)text {
    NSString *regex;
    switch (textType) {
        case 1: {
            regex = @"^\\w{2,16}$";
            break;
        }
        case 2: {
            regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
            break;
        }
        case 3: {
            regex = @"\\w{6,16}";
            break;
        }
        case 4: {
            regex = @"1\\d{10}";
            break;
        }
        default:
            break;
    }
    NSPredicate *regTest =
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [regTest evaluateWithObject:text];
    //    return YES;
}

+ (void)showMessage:(UIView *)view message:(NSString *)message {
    [Utils showMessage:view message:message afterDelay:2];
}

+ (void)showMessage:(UIView *)view
            message:(NSString *)message
         afterDelay:(NSTimeInterval)afterDelay {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelFont = FONT14;
    hud.labelText = message;
    //  hud.detailsLabelText = message;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:afterDelay];
}

+ (void)showMessageMultiLine:(UIView *)view message:(NSString *)message {
    [Utils showMessageMultiLine:view message:message afterDelay:2];
}

+ (void)showMessageMultiLine:(UIView *)view
                     message:(NSString *)message
                  afterDelay:(NSTimeInterval)afterDelay {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelFont = FONT14;
    hud.detailsLabelFont = FONT14;
    hud.detailsLabelText = message;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:afterDelay];
}

+ (NSDate *)getCurrentHourHalf {
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components =
    [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit |
     NSDayCalendarUnit | NSHourCalendarUnit |
     NSMinuteCalendarUnit | NSSecondCalendarUnit
                fromDate:now];
    if (components.minute < 30) {
        [components setMinute:30];
    } else {
        [components setHour:components.hour + 1];
        [components setMinute:0];
    }
    [components setSecond:0];
    //  [components setTimeZone:[NSTimeZone localTimeZone]];
    NSDate *half = [calendar dateFromComponents:components];
    return half;
}

+ (NSDate *)getLocalDate:(NSDate *)date {
    //添加本地时间偏移
    NSTimeZone *timezone = [NSTimeZone systemTimeZone];
    NSInteger interval = [timezone secondsFromGMT];
    return [date dateByAddingTimeInterval:interval];
}

+ (BOOL)isBlank:(NSString *)source {
    if (source == nil || source == NULL ||
        [source isKindOfClass:[NSNull class]] ||
        [[source stringByTrimmingCharactersInSet:
          [NSCharacterSet whitespaceAndNewlineCharacterSet]] length] ==
        0) {
        
        return YES;
    }
    return NO;
}

+ (NSString *)lunarForSolar:(NSDate *)solarDate {
    //天干名称
    NSArray *cTianGan =
    [NSArray arrayWithObjects:@"甲", @"乙", @"丙", @"丁", @"戊", @"己",
     @"庚", @"辛", @"壬", @"癸", nil];
    
    //地支名称
    NSArray *cDiZhi = [NSArray
                       arrayWithObjects:@"子", @"丑", @"寅", @"卯", @"辰", @"巳", @"午",
                       @"未", @"申", @"酉", @"戌", @"亥", nil];
    
    //属相名称
    NSArray *cShuXiang = [NSArray
                          arrayWithObjects:@"鼠", @"牛", @"虎", @"兔", @"龙", @"蛇", @"马",
                          @"羊", @"猴", @"鸡", @"狗", @"猪", nil];
    
    //农历日期名
    NSArray *cDayName = [NSArray
                         arrayWithObjects:@"*", @"初一", @"初二", @"初三", @"初四",
                         @"初五", @"初六", @"初七", @"初八", @"初九",
                         @"初十", @"十一", @"十二", @"十三", @"十四",
                         @"十五", @"十六", @"十七", @"十八", @"十九",
                         @"二十", @"廿一", @"廿二", @"廿三", @"廿四",
                         @"廿五", @"廿六", @"廿七", @"廿八", @"廿九",
                         @"三十", nil];
    
    //农历月份名
    NSArray *cMonName = [NSArray
                         arrayWithObjects:@"*", @"正", @"二", @"三", @"四", @"五", @"六",
                         @"七", @"八", @"九", @"十", @"十一", @"腊", nil];
    
    //公历每月前面的天数
    const int wMonthAdd[12] = {0,   31,  59,  90,  120, 151,
        181, 212, 243, 273, 304, 334};
    
    //农历数据
    const int wNongliData[100] = {
        2635,   333387, 1701,   1748,   267701, 694,    2391,   133423, 1175,
        396438, 3402,   3749,   331177, 1453,   694,    201326, 2350,   465197,
        3221,   3402,   400202, 2901,   1386,   267611, 605,    2349,   137515,
        2709,   464533, 1738,   2901,   330421, 1242,   2651,   199255, 1323,
        529706, 3733,   1706,   398762, 2741,   1206,   267438, 2647,   1318,
        204070, 3477,   461653, 1386,   2413,   330077, 1197,   2637,   268877,
        3365,   531109, 2900,   2922,   398042, 2395,   1179,   267415, 2635,
        661067, 1701,   1748,   398772, 2742,   2391,   330031, 1175,   1611,
        200010, 3749,   527717, 1452,   2742,   332397, 2350,   3222,   268949,
        3402,   3493,   133973, 1386,   464219, 605,    2349,   334123, 2709,
        2890,   267946, 2773,   592565, 1210,   2651,   395863, 1323,   2707,
        265877};
    
    static int wCurYear, wCurMonth, wCurDay;
    static int nTheDate, nIsEnd, m, k, n, i, nBit;
    
    //取当前公历年、月、日
    NSDateComponents *components = [[NSCalendar currentCalendar]
                                    components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit
                                    fromDate:solarDate];
    wCurYear = [components year];
    wCurMonth = [components month];
    wCurDay = [components day];
    
    //计算到初始时间1921年2月8日的天数：1921-2-8(正月初一)
    nTheDate = (wCurYear - 1921) * 365 + (wCurYear - 1921) / 4 + wCurDay +
    wMonthAdd[wCurMonth - 1] - 38;
    if ((!(wCurYear % 4)) && (wCurMonth > 2))
        nTheDate = nTheDate + 1;
    
    //计算农历天干、地支、月、日
    nIsEnd = 0;
    m = 0;
    while (nIsEnd != 1) {
        if (wNongliData[m] < 4095)
            k = 11;
        else
            k = 12;
        n = k;
        while (n >= 0) {
            //获取wNongliData(m)的第n个二进制位的值
            nBit = wNongliData[m];
            for (i = 1; i < n + 1; i++)
                nBit = nBit / 2;
            
            nBit = nBit % 2;
            
            if (nTheDate <= (29 + nBit)) {
                nIsEnd = 1;
                break;
            }
            
            nTheDate = nTheDate - 29 - nBit;
            n = n - 1;
        }
        if (nIsEnd)
            break;
        m = m + 1;
    }
    wCurYear = 1921 + m;
    wCurMonth = k - n + 1;
    wCurDay = nTheDate;
    if (k == 12) {
        if (wCurMonth == wNongliData[m] / 65536 + 1)
            wCurMonth = 1 - wCurMonth;
        else if (wCurMonth > wNongliData[m] / 65536 + 1)
            wCurMonth = wCurMonth - 1;
    }
    
    //生成农历天干、地支、属相
    NSString *szShuXiang =
    (NSString *)[cShuXiang objectAtIndex:((wCurYear - 4) % 60) % 12];
    NSString *szNongli = [NSString
                          stringWithFormat:@"%@(%@%@)年", szShuXiang,
                          (NSString *)
                          [cTianGan objectAtIndex:((wCurYear - 4) % 60) % 10],
                          (NSString *)
                          [cDiZhi objectAtIndex:((wCurYear - 4) % 60) % 12]];
    
    //生成农历月、日
    NSString *szNongliDay;
    if (wCurMonth < 1) {
        szNongliDay = [NSString
                       stringWithFormat:@"闰%@",
                       (NSString *)[cMonName objectAtIndex:-1 * wCurMonth]];
    } else {
        szNongliDay = (NSString *)[cMonName objectAtIndex:wCurMonth];
    }
    
    NSString *lunarDate =
    [NSString stringWithFormat:@"%@ %@月 %@", szNongli, szNongliDay,
     (NSString *)[cDayName objectAtIndex:wCurDay]];
    
    //    return lunarDate;
    NSString *lunarDayName = (NSString *)[cDayName objectAtIndex:wCurDay];
    return lunarDayName;
}

+ (NSString *)getDictDescFromDicts:(NSString *)dictTypeCode
                      dictItemCode:(NSString *)dictCode {
    if (!dictTypeCode || !dictCode) {
        return nil;
    } else {
        NSDictionary *dictItems = [[GlobalData sharedGlobalData]
                                   readDictsFromUserDefaultByType:dictTypeCode];
        for (NSString *key in dictItems) {
            if ([key isEqualToString:dictCode]) {
                return dictItems[key];
            }
        }
        return nil;
    }
}

+ (NSArray *)getDictsByType:(NSString *)dictTypeCode {
    if (dictTypeCode) {
    }
    return nil;
}

+ (NSDictionary *)getHotCity {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [GlobalData sharedGlobalData].hotCityDictionary =
    [userDefaults objectForKey:UD_HOT_CITY_KEY];
    //从GlobalData初始化区域数据
    NSDictionary *hotCityDictionary =
    [GlobalData sharedGlobalData].hotCityDictionary;
    return hotCityDictionary;
}

+ (NSData *)toJSONData:(id)theData {
    NSError *error = nil;
    NSData *jsonData =
    [NSJSONSerialization dataWithJSONObject:theData
                                    options:NSJSONWritingPrettyPrinted
                                      error:&error];
    if ([jsonData length] > 0 && error == nil) {
        return jsonData;
    }
    return nil;
}

+ (MBProgressHUD *)showMessageWithHud:(UIView *)view
                              message:(NSString *)message {
    return [Utils showMessageWithHud:view
                                mode:MBProgressHUDModeText
                             message:message];
}

+ (MBProgressHUD *)showMessageWithHud:(UIView *)view
                                 mode:(MBProgressHUDMode)mode
                              message:(NSString *)message {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // Configure for text only and offset down
    hud.mode = mode;
    hud.labelFont = FONT14;
    hud.labelText = message;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

//+(NSString *)firstLetterOfString:(NSString *)source{
////    const  char *cString2 = [source UTF8String];
//    const char *cString2 = [source UTF8String];
//    CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0,
//    CFSTR(cString2));
//    CFStringTransform(string, NULL, kCFStringTransformMandarinLatin, NO);
//    CFStringTransform(string, NULL, kCFStringTransformStripDiacritics, NO);
//    NSLog(@"%@", string);
////    CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0,
/// CFSTR(cString2));
////    CFStringTransform(string, NULL, kCFStringTransformMandarinLatin, NO);
////    NSLog(@"%@", string);
//}

+ (NSString *)typeForImageData:(NSData *)data {
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"image/jpeg";
        case 0x89:
            return @"image/png";
        case 0x47:
            return @"image/gif";
        case 0x49:
        case 0x4D:
            return @"image/tiff";
    }
    return nil;
}

+ (UIColor *)getAvatarColor {
    NSArray *colors = @[
                        RGB(33, 213, 155),
                        RGB(69, 199, 249),
                        RGB(160, 112, 255),
                        RGB(251, 87, 155)
                        ];
    NSInteger index = [Utils getRandomNumber:0 to:3];
    return colors[index];
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                         options:NSJSONReadingMutableContainers
                                                           error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dict;
}


+ (NSString*)dictionaryToJson:(NSDictionary *)dict{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+(BOOL)isLogin{
    NSString *token=[[GlobalData sharedGlobalData]readAccessTokenFromUserDefault];
    if([Utils isBlank:token]){
        return NO;
    }
    return YES;
}
+(BOOL)isCoach{
    if(![Utils isLogin]){
        return NO;
    }
    NSString *userType=[[GlobalData sharedGlobalData]readUserFromUserDefault].userType;
    if([USER_TYPE_COACH isEqualToString:userType]){
        return YES;
    }
    return NO;
}

+(BOOL)isStudent{
    if(![Utils isLogin]){
        return NO;
    }
    NSString *userType=[[GlobalData sharedGlobalData]readUserFromUserDefault].userType;
    if([USER_TYPE_STUDENT isEqualToString:userType]){
        return YES;
    }
    return NO;
}
@end

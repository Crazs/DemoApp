//
//  CRMedia.h
//  CRHelperLib
//
//  Created by 周文涛 on 2019/12/2.
//  Copyright © 2019年 Crazs. All rights reserved.
//

#import "CRBaseModel.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CRMediaType) {
    CRMediaTypeFile     = 0,        ///文件类型
    CRMediaTypeImage    = 1,        ///图片类型
    CRMediaTypeVideo    = 2,        ///视频类型
    CRMediaTypeAudio    = 3,        ///音频类型
};


/*!
 @brief     媒体类型
 */
@interface CRMedia : CRBaseModel<NSSecureCoding>

/*!
 @brief     实名认证情况
 */
@property (nonatomic, assign) CRMediaType mediaType;

/*!
 @brief     本地路径
 */
@property (nonatomic, copy) NSString * localPath;

/*!
 @brief     网络路径
 */
@property (nonatomic, copy) NSString * urlPath;

/*!
 @brief     后缀名
 */
@property (nonatomic, copy) NSString * suffix;


@end



/*!
 @brief     文件
 */
@interface CRMediaFile : CRMedia

/*!
 @brief     文件data
 */
@property (nonatomic, strong) NSData * data;

@end



/*!
 @brief     图片
 */
@interface CRMediaImage : CRMedia

/*!
 @brief     文件data
 */
@property (nonatomic, strong) UIImage * image;

/*!
 @brief     图片宽度
 */
@property (nonatomic, assign) CGFloat * width;

/*!
 @brief     图片高度
 */
@property (nonatomic, assign) CGFloat * height;


@end

/*!
 @brief     视频
 */
@interface CRMediaVideo : CRMedia

/*!
 @brief     封面图片，分辨率信息
 */
@property (nonatomic, strong) CRMediaImage * coverImage;

/*!
 @brief     时长
 */
@property (nonatomic, assign) NSTimeInterval timeInterval;

@end

/*!
 @brief     声音
 */
@interface CRMediaAudio : CRMedia

/*!
 @brief     时长
 */
@property (nonatomic, assign) NSTimeInterval timeInterval;


@end



NS_ASSUME_NONNULL_END

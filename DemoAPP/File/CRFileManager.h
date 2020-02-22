//
//  CRFileManager.h
//  CRHelperLib
//
//  Created by 周文涛 on 2019/12/2.
//  Copyright © 2019年 Crazs. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @brief     查找方式
 */
typedef NS_OPTIONS(NSInteger, CRFileQuaryOption) {
    CRFileQuaryOptionsUUID        =   1 << 0,     //本地查询uuid
    CRFileQuaryOptionsURLLocal    =   1 << 1,     //本地查询url
    CRFileQuaryOptionsURLNet      =   1 << 2,     //去向服务器请求
    CRFileQuaryOptionsALL         =   0xFF        //依次查询
};

/*!
 @brief     图片类型
 */
typedef NS_ENUM(NSInteger, CRImageType){
    CRImageTypeORIGIN              = 1 << 0,        ///原图
    CRImageTypeTHUMB               = 1 << 1,        ///缩略图
    CRImageTypeLARGE               = 1 << 2,        ///预览图、大图
};





NS_ASSUME_NONNULL_BEGIN
/*!
 @breif     文件管理器
 */
@interface CRFileManager : NSObject

@end

NS_ASSUME_NONNULL_END

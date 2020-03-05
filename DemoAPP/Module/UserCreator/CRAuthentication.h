//
//  CRAuthentication.h
//  CRHelperLib
//
//  Created by 周文涛 on 2019/12/2.
//  Copyright © 2019年 Crazs. All rights reserved.
//

#import "CRMedia.h"

NS_ASSUME_NONNULL_BEGIN

/*!
 @brief     实名认证情况
 */
@interface CRAuthentication : BaseModel<NSSecureCoding>

/*!
 @brief     是否已经实名认证
 */
@property (nonatomic, assign, getter=isAuthenticate) BOOL authenticate;

/*!
 @brief     姓名
 */
@property (nonatomic, copy) NSString * name;

/*!
 @brief     身份证号
 */
@property (nonatomic, copy) NSString * nationalID;

/*!
 @brief     正面身份证照片
 */
@property (nonatomic, strong) CRMediaImage * cardFrontImg;

/*!
 @brief     反面身份证照片
 */
@property (nonatomic, strong) CRMediaImage * cardBehindImg;

/*!
 @brief     手持身份证照片
 */
@property (nonatomic, strong) CRMediaImage * cardPortraitImg;




@end

NS_ASSUME_NONNULL_END

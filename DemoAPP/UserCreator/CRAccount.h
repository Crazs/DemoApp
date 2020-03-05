//
//  CRAccount.h
//  CRHelperLib
//
//  Created by 周文涛 on 2019/12/2.
//  Copyright © 2019年 Crazs. All rights reserved.
//

#import "CRMedia.h"
#import "CRAuthentication.h"

NS_ASSUME_NONNULL_BEGIN

/*!
 @brief     账户信息
 */
@interface CRAccount : BaseModel<NSSecureCoding>

/*!
 @brief     用户名
 */
@property (nonatomic, copy) NSString * name;

/*!
 @brief     密码
 */
@property (nonatomic, copy) NSString * password;


/*!
 @brief     昵称
 */
@property (nonatomic, copy) NSString * nickname;
/*!
 @brief     头像
 */
@property (nonatomic, strong) CRMediaImage * header;
/*!
 @brief     用户简介
 */
@property (nonatomic, copy) NSString * brief;

/*!
 @brief     手机号码
 */
@property (nonatomic, copy) NSString * phone;

/*!
 @brief     邮箱
 */
@property (nonatomic, copy) NSString * Email;


/*!
 @brief     角色，可以有多种角色
 */
@property (nonatomic, strong) NSSet * roles;


/*!
 @brief     实名认证情况
 */
@property (nonatomic, strong) CRAuthentication * authenticator;



@end

NS_ASSUME_NONNULL_END

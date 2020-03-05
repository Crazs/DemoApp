//
//  CRUserStatus.h
//  CRHelperLib
//
//  Created by 周文涛 on 2019/12/2.
//  Copyright © 2019年 Crazs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRAccount.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString *const CRUserLoginNotification;             //用户登录成功的通知key
extern NSString *const CRUserLogoutNotification;            //用户退出登录的通知key
extern NSString *const CRUserTokenExpiredNotification;      //用户的token过期通知


@interface CRUserStatus : NSObject<NSSecureCoding>

/*!
 @brief     是否登录
 */
@property (nonatomic, assign, getter=isLogin) BOOL login;

/*!
 @brief     登录token信息
 */
@property (nonatomic, copy) NSString  * token;

/*!
 @brief     当前账户
 */
@property (nonatomic, strong) CRAccount  * localAccount;


/*!
 @brief     用户单例
 */
+ (instancetype)shareUser;



/*!
 @brief     读取当前用户状态
 */
- (void)loadUserStatus;

/*!
 @brief     存储当前用户状态
 */
- (void)storageUserStatus;

/*!
 @brief     登录账户
 */
- (void)loginAccount:(CRAccount *)account
               token:(NSString *)token;


/*!
 @brief     登出账户
 */
- (void)logoutAccount;

/*!
 @brief     清除账户信息
 */
- (void)cleanUserIdenfitier:(NSString *)identirier;


/*!
 @brief     获取所有账户信息列表，多账户模式
 */
- (NSArray *)allAccounts;

/*!
 @brief     清除状态，测试专用
 */
- (void)cleanStatus;

@end

NS_ASSUME_NONNULL_END

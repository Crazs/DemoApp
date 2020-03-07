//
//  CRMediaContainEditCustom.h
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/6.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import "CRMediaContainEdit.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString *const CRMediaContainEditMedaiType;     //支持的媒体类型
extern NSString *const CRMediaContainEditMedaiCount;    //支持的媒体类型数量


@interface CRMediaContainEditCustom : CRMediaContainEdit

/**
 @brief 设置支持的类型，支持类型的数量
 */
@property (nonatomic, strong, readonly) NSSet * mediaConfig;
/**
 @brief 类型互斥，默认为YES，YES只支持一种类型，NO支持多种类型
 */
@property (nonatomic, assign) BOOL isMediaTypeMutex;
/**
 @brief 数量互斥,默认为YES，YES时最大数量为支持类型的最大数量，NO时为总数量。但最大数量不超过maxCount
 */
@property (nonatomic, assign) BOOL isMediaCountMutex;
/**
 @brief 在没有达到媒体l最大数量之前，显示添加按钮
 */
@property (nonatomic, assign) BOOL isShowAdd;

@end

NS_ASSUME_NONNULL_END

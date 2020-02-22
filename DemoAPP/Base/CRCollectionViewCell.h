//
//  CRCollectionViewCell.h
//  CRHelperLib
//
//  Created by 周文涛 on 2019/12/2.
//  Copyright © 2019年 Crazs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/*!
 @brief     基础的collection Cell
 */
@interface CRCollectionViewCell : UICollectionViewCell

/*!
 @brief     关联的model
 */
@property (nonatomic, strong) id model;


@end

NS_ASSUME_NONNULL_END

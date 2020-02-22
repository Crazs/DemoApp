//
//  CRTableViewCell.h
//  CRHelperLib
//
//  Created by 周文涛 on 2019/12/2.
//  Copyright © 2019年 Crazs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/*!
 @brief     基础的tableView Cell
 *修改选中样式为UITableViewCellSelectionStyleNone
 */
@interface CRTableViewCell : UITableViewCell

/*!
 @brief     关联的model
 */
@property (nonatomic, strong) id model;


@end

NS_ASSUME_NONNULL_END

//
//  AccessoryBar.h
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/8.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccessoryButtonItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface AccessoryBar : UIView

@property (nonatomic, assign) CRButtonImageTextAlign itemAlign;
/**
 整体布局的padding，默认 {0,15,0,15}
 */
@property (nonatomic, assign) UIEdgeInsets * padding;
/**
 item的margin 默认{0,15,0,15}
 */
@property (nonatomic, assign) UIEdgeInsets * itemMargin;

- (void)setItems:(NSArray *)items;
- (void)reloadData;
- (void)reloadItem:(AccessoryButtonItem *)item;

- (void)createSubView;

@end

NS_ASSUME_NONNULL_END

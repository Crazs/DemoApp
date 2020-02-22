//
//  CRViewController.h
//  CRHelperLib
//
//  Created by 周文涛 on 2019/12/2.
//  Copyright © 2019年 Crazs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 @breif     基础的ViewController，封装了一些常用的方法
 默认不支持旋转
 */
@interface CRViewController : UIViewController

/**
 @brief     是否展示NavigationBar，默认为yes
 */
@property (nonatomic, assign) BOOL isShowNavBar;

@end

NS_ASSUME_NONNULL_END

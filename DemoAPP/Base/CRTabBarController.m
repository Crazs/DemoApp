//
//  CRTabBarController.m
//  CRHelperLib
//
//  Created by 周文涛 on 2019/12/28.
//

#import "CRTabBarController.h"

@interface CRTabBarController ()

@end

@implementation CRTabBarController

- (BOOL)shouldAutorotate{
    return [self.selectedViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [self.selectedViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}


@end

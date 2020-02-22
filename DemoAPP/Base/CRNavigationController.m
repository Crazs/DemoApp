//
//  CRNavigationController.m
//  CRHelperLib
//
//  Created by 周文涛 on 2019/12/28.
//

#import "CRNavigationController.h"

@interface CRNavigationController ()

@end

@implementation CRNavigationController

- (BOOL)shouldAutorotate {
    return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.topViewController.supportedInterfaceOrientations;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return self.topViewController.preferredInterfaceOrientationForPresentation;
}
@end

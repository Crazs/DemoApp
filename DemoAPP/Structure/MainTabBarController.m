//
//  MainTabBarController.m
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/5.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "MeViewController.h"
#import <CRBaseLib/BaseNavigationController.h>

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSubView];
}

- (void)createSubView{
    HomeViewController * homeVC = [[HomeViewController alloc] init];
    BaseNavigationController * homeNav = [[BaseNavigationController alloc]initWithRootViewController:homeVC];
    
    MeViewController * meVC = [[MeViewController alloc] init];
    BaseNavigationController * meNav = [[BaseNavigationController alloc] initWithRootViewController:meVC];

    self.viewControllers = @[homeNav,meNav];
    //设置tabbarbutton
    homeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"home"] selectedImage:[UIImage imageNamed:@"home_light"]];
    meNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"me"] selectedImage:[UIImage imageNamed:@"me_light"]];
 
    NSArray * arr = @[homeNav,meNav];
    [arr enumerateObjectsUsingBlock:^(BaseNavigationController *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: Color_White} forState:UIControlStateNormal];
        [obj.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: Color_Blue} forState:UIControlStateSelected];
    }];
    
//    if (@available(iOS 10.0, *)) {
//        self.tabBar.unselectedItemTintColor = Color_White;
//    } else {
//    }
    self.tabBar.backgroundColor = Color_333;
}

#pragma mark - HTTP

#pragma mark - Delegate

#pragma mark - Public

#pragma mark - Private

#pragma mark - Setter

#pragma mark - Getter



@end

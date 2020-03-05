//
//  CRSecondWindowController.m
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/5.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import "CRSecondWindowController.h"

@interface CRSecondWindowController ()

@end

@implementation CRSecondWindowController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSubView];
    [self createNavigationBar];
}

#pragma mark - HTTP

#pragma mark - Delegate

#pragma mark - Public

#pragma mark - Private

- (void)createNavigationBar{
    UIBarButtonItem * showBtn = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(closeTempWindow)];
    self.navigationItem.rightBarButtonItem = showBtn;
}

- (void)createSubView{

    UIButton * btn = [self customButtonWithTitle:@"显示"];
    [self.view addSubview:btn];
    btn.center = CGPointMake(self.view.halfWidth, self.view.halfWidth);
    [btn addTarget:self action:@selector(showTempWindow) forControlEvents:UIControlEventTouchUpInside];
    
    [self makeSubViewsLayout];
}

- (void)makeSubViewsLayout{
    
}

- (void)showTempWindow{
    [self.tempWindow makeKeyAndVisible];
    self.tempWindow.hidden = NO;
}

- (void)closeTempWindow{
    [self.tempWindow resignKeyWindow];
    self.tempWindow.hidden = YES;
}

#pragma mark - Setter

#pragma mark - Getter

- (UIWindow *)tempWindow{
    if (_tempWindow) {
        return _tempWindow;
    }
    if (@available(iOS 13.0, *)) {
        UIWindowScene * windowScene =
        (UIWindowScene *)[[UIApplication sharedApplication].connectedScenes anyObject];
        _tempWindow = [[UIWindow alloc] initWithWindowScene:windowScene];
        _tempWindow.frame = CGRectMake(0, 120, self.view.width, ScreenHeight - 120);
    } else {
        _tempWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0, 120, self.view.width, ScreenHeight - 120)];
    }
    _tempWindow.backgroundColor = [UIColor colorWithWhite:0 alpha:0.85];
    
    UIButton * btn = [self customButtonWithTitle:@"关闭"];
    btn.center = CGPointMake(_tempWindow.halfWidth, _tempWindow.halfHeight);
    [_tempWindow addSubview:btn];
    [btn addTarget:self action:@selector(closeTempWindow) forControlEvents:UIControlEventTouchUpInside];
    
    return _tempWindow;
}

- (UIButton *)customButtonWithTitle:(NSString *)title{
    UIButton * btn = [UIButton createTextButton:title fontSize:24 titleColor:Color_Magenta];
    btn.bounds = CGRectMake(0, 0, 100, 100);
    btn.layer.cornerRadius = 50;
    btn.backgroundColor = Color_Black;
    return btn;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

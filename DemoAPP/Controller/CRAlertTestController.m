//
//  CRAlertTestController.m
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/13.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import "CRAlertTestController.h"

#define D_selName   @"showAlert"
#define D_selCount  4

@interface CRAlertTestController ()
@property (nonatomic, strong) UILabel * msgLabel;
@end

@implementation CRAlertTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.msgLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, self.view.frame.size.width - 50 - 50, 44)];
    self.msgLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:self.msgLabel];
    self.msgLabel.textColor = Color_Orange;
    self.msgLabel.backgroundColor = Color_DFDFDF;
    
    CGFloat ww = self.view.width/D_selCount;
    for (NSInteger idx = 0; idx < D_selCount; idx++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = Color_Random;
        btn.frame = CGRectMake(ww * idx, 100, ww, 33);
        [btn addTarget:self action:NSSelectorFromString([NSString stringWithFormat:@"%@%ld",D_selName,(long)idx+1]) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

#pragma mark - HTTP

#pragma mark - Delegate

#pragma mark - Public

#pragma mark - Private
- (void)showAlert1{
    UIAlertController * alert = [UIAlertController alertControllerWithMessage:@"showAlert1"];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)showAlert2{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"showAlert2" message:@"showAlert2"];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)showAlert3{
    UIAlertController * alert = [UIAlertController alertControllerWithMessage:@"showAlert3" confirm:^(UIAlertAction * _Nonnull action) {
        self.msgLabel.text = @"showAlert3";
    }];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)showAlert4{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"showAlert4" Message:@"showAlert4" confirm:^(UIAlertAction * _Nonnull action) {
        self.msgLabel.text = @"showAlert4";
    }];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Setter

#pragma mark - Getter


@end

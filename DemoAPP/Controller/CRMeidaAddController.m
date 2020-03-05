//
//  CRMeidaAddController.m
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/5.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import "CRMeidaAddController.h"
#import "CRMediaContainArrangement.h"
#import "CRMedia.h"

@interface CRMeidaAddController ()

@property (nonatomic, strong) CRMediaContainArrangement * mediaContain;


@end

@implementation CRMeidaAddController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Color_F4F4F4;
    
    [self createSubView];
    [self createNavigationBar];
}

#pragma mark - HTTP

#pragma mark - Delegate

#pragma mark - Public

#pragma mark - Private

- (void)createNavigationBar{
    UIBarButtonItem * add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(clickAddButton)];
    self.navigationItem.rightBarButtonItem = add;
}

- (void)createSubView{

    self.mediaContain = [[CRMediaContainArrangement alloc] init];
    [self.view addSubview:self.mediaContain];
    self.mediaContain.backgroundColor = Color_White;
    WEAK_SELF
    [self.mediaContain setHeightChange:^(CGFloat height) {
        [weakself.mediaContain mas_updateConstraints:^(MASConstraintMaker *make) {
            MAS_height(height);
        }];
    }];
    
    [self makeSubViewsLayout];
}

- (void)makeSubViewsLayout{

    [self.mediaContain mas_makeConstraints:^(MASConstraintMaker *make) {
        MAS_top(self.view, 64);
        MAS_leftRight0(self.view);
    }];
}

- (void)clickAddButton{
    [self.mediaContain addMedia:[[CRMediaImage alloc] init]];
}

#pragma mark - Setter

#pragma mark - Getter


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

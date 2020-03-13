//
//  CRSystemButtonController.m
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/14.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import "CRSystemButtonController.h"

#define D_lineNum   4   //每行展示4个
#define D_offset    8   //间隔8

@interface CRSystemButtonController ()
@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, strong) NSDictionary * buttonConfig;
@property (nonatomic, strong) NSArray * buttonKeys;
@end

@implementation CRSystemButtonController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buttonKeys = self.buttonConfig.allKeys;

    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollView];
    self.scrollView.contentSize = self.view.bounds.size;
    self.scrollView.backgroundColor = Color_DFDFDF;
    
    CGFloat ww = (self.view.width - (D_offset * 5))/4;
    NSInteger line = ceil(self.buttonKeys.count/1.0 / D_lineNum );
    [self.buttonKeys enumerateObjectsUsingBlock:^(NSNumber *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton * btn = [UIButton buttonWithType:obj.integerValue];
        btn.frame = CGRectMake(D_offset + (D_offset + ww) * (idx % D_lineNum),
                               100 + (D_offset + ww) * (idx / D_lineNum), ww, ww);
        btn.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [btn setTitle:[self.buttonConfig objectForKey:obj] forState:UIControlStateNormal];
        [self.scrollView addSubview:btn];
        
        UIButton * btn2 = [UIButton buttonWithType:obj.integerValue];
        btn2.frame = CGRectMake(D_offset + (D_offset + ww) * (idx % D_lineNum),
                               130 + line * (D_offset + ww) + (D_offset + ww) * (idx / D_lineNum), ww, ww);
        btn2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.scrollView addSubview:btn2];
    }];
}


#pragma mark - HTTP

#pragma mark - Delegate

#pragma mark - Public

#pragma mark - Private

#pragma mark - Setter

#pragma mark - Getter
- (NSDictionary *)buttonConfig{
    if (_buttonConfig) {
        return _buttonConfig;
    }
    if (@available(iOS 13.0, *)) {
        _buttonConfig = @{@(UIButtonTypeCustom):@"UIButtonTypeCustom",
                          @(UIButtonTypeSystem):@"UIButtonTypeSystem",
                          @(UIButtonTypeDetailDisclosure):@"UIButtonTypeDetailDisclosure",
                          @(UIButtonTypeInfoLight):@"UIButtonTypeInfoLight",
                          @(UIButtonTypeInfoDark):@"UIButtonTypeInfoDark",
                          @(UIButtonTypeContactAdd):@"UIButtonTypeContactAdd",
                          @(UIButtonTypeClose):@"UIButtonTypeClose",
                          @(UIButtonTypeRoundedRect):@"UIButtonTypeRoundedRect",
        };
    } else {
        // Fallback on earlier versions
        _buttonConfig = @{@(UIButtonTypeCustom):@"UIButtonTypeCustom",
                          @(UIButtonTypeSystem):@"UIButtonTypeSystem",
                          @(UIButtonTypeDetailDisclosure):@"UIButtonTypeDetailDisclosure",
                          @(UIButtonTypeInfoLight):@"UIButtonTypeInfoLight",
                          @(UIButtonTypeInfoDark):@"UIButtonTypeInfoDark",
                          @(UIButtonTypeContactAdd):@"UIButtonTypeContactAdd",
                          @(UIButtonTypeRoundedRect):@"UIButtonTypeRoundedRect",
        };
    }
    return _buttonConfig;
}

@end

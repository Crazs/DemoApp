//
//  CRScrollBarTestController.m
//  DemoAPP
//
//  Created by Crazs on 2020/5/25.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import "CRScrollBarTestController.h"

#import "CRScrollBar.h"

@interface CRScrollBarTestController ()

@end

@implementation CRScrollBarTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    // Do any additional setup after loading the view.

    NSArray *leftItemArr = @[[CRCustomBarItem itemWithTitle:@"page1" style:UIBarButtonItemStyleDone target:self action:@selector(pressPage1)],[CRCustomBarItem itemWithTitle:@"page2" style:UIBarButtonItemStyleDone target:nil action:nil]];
    NSArray *rightItemArr = @[[CRCustomBarItem itemWithImage:UIImage_name(@"media_file") style:UIBarButtonItemStyleDone target:self action:@selector(pressPage1)],[CRCustomBarItem itemWithImage:UIImage_name(@"media_audio") style:UIBarButtonItemStyleDone target:nil action:nil]];
    NSMutableArray *middleItemArr = [[NSMutableArray alloc] initWithCapacity:10];
    for (NSInteger i = 0; i < 10; i++) {
        @autoreleasepool {
            NSString *title = [NSString stringWithFormat:@"item%ld",(long)i];
            [middleItemArr addObject:[CRScrollBarItem itemWithTitle:title]];
        }
    }
    
    
    CRScrollBar *scrollBar = [[CRScrollBar alloc] initWithConfig:[CRScrollBarConfig defaultConfig]];
    scrollBar.frame = CGRectMake(10, 100, self.view.width - 20, 44);
    scrollBar.backgroundColor = Color_DFDFDF;
    [self.view addSubview:scrollBar];
    scrollBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    
    scrollBar.leftItems = leftItemArr;
    scrollBar.rightItems = rightItemArr;
    scrollBar.middleItems = middleItemArr;
    
    
    CRScrollBar *scrollBar2 = [[CRScrollBar alloc] initWithConfig:[CRScrollBarConfig defaultConfig]];
    scrollBar2.frame = CGRectMake(10, scrollBar.bottom + 30, self.view.width - 20, 44);
    scrollBar2.backgroundColor = Color_DFDFDF;
    [self.view addSubview:scrollBar2];
    scrollBar2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    
    scrollBar2.middleItems = [middleItemArr subarrayWithRange:NSMakeRange(0, 3)];
    scrollBar2.tintColor = UIColor.brownColor;
    scrollBar2.selectedColor = UIColor.magentaColor;
}


- (void)pressPage1{
    NSLog(@"%s",__func__);
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

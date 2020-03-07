//
//  CRSystemButtonController.m
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/6.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import "CRSystemButtonController.h"
#import <CRBaseLib/SimpleCollectionViewCell.h>

@interface ButtonCell : SimpleCollectionViewCell
@property (nonatomic, strong) UIButton * button;
@end
@implementation ButtonCell
@end

@interface CRSystemButtonController ()

@end

@implementation CRSystemButtonController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSubView];
    //[self createNavigationBar];
}

#pragma mark - HTTP

#pragma mark - Delegate
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ButtonCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier(ButtonCell) forIndexPath:indexPath];

     
    return cell;
}
#pragma mark - Public

#pragma mark - Private

//- (void)createNavigationBar{
//
//}
//
- (void)createSubView{
    [self.collectionView registerClass:[ButtonCell class] forCellWithReuseIdentifier:cellIdentifier(ButtonCell)];
    //[self makeSubViewsLayout];
}
//
//- (void)makeSubViewsLayout{
//
//}

#pragma mark - Setter

#pragma mark - Getter




@end




//
//  CRMediaContainArrangement.h
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/5.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CRMedia;
@interface CRMediaContainArrangement : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, copy) void(^heightChange)(CGFloat height);        //高度改变的回调
@property (nonatomic, copy) void(^clickItemPlay)(NSInteger idx,id cellModel);       //点击了item的播放按钮

@property (nonatomic, assign) NSInteger maxCount;   //默认9

- (void)resetMedias:(NSArray *)medias;
- (void)addMedia:(CRMedia *)media;

@end

NS_ASSUME_NONNULL_END

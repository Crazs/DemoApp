//
//  CRMediaContainEdit.h
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/5.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 @brief 添加媒体文件时的展示视图
 */
@interface CRMediaContainEdit : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, copy) void(^heightChange)(CGFloat height);        //高度改变的回调

@property (nonatomic, copy) void(^clickItem)(NSInteger idx,id cellModel);//点击详情

@property (nonatomic, assign) NSInteger maxCount;       //默认9
@property (nonatomic, assign, readonly) NSUInteger currentCount;   //当前数量
@property (nonatomic, assign) CGFloat estimatedHeight;  //预估高度
@property (nonatomic, assign) BOOL isEdit;  //是否编辑

- (void)resetMedias:(NSArray *)medias;
- (void)addMedia:(id)media;
- (void)addMedias:(NSArray *)medias;



- (void)createSubView;

@end

NS_ASSUME_NONNULL_END

//
//  CRMediaEditCell.h
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/5.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRMedia.h"

NS_ASSUME_NONNULL_BEGIN


@interface CRMediaEditCell : UICollectionViewCell

@property (nonatomic, weak)id cellModel;

@property (nonatomic, strong) UIImageView * rImageView;
@property (nonatomic, strong) UIImageView * playImageV;
@property (nonatomic, strong) UIButton * removeButton;

@property (nonatomic, copy) void(^onClickRemoveBtn)(void);

@end

NS_ASSUME_NONNULL_END

//
//  CRMediaContainArrangement.m
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/5.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import "CRMediaContainArrangement.h"
#import "CRMediaEditCell.h"

#define D_offset 8
#define D_lineNum 3
#define D_maxCount 9

@interface CRMediaContainArrangement()

@property (nonatomic, strong) NSMutableArray * medias;

@end

@implementation CRMediaContainArrangement
static CGFloat __width = CGFLOAT_MIN;
static CGFloat __itemCount = 0;
static CGFloat __sizeForCRMediaContainItem(CGFloat width){
    return floor((width - (D_offset * (D_lineNum + 1))) / D_lineNum);
}


+ (UICollectionViewLayout *)customFlowlayout{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = D_offset;
    layout.minimumInteritemSpacing = D_offset;
    layout.sectionInset = UIEdgeInsetsMake(D_offset, D_offset, D_offset, D_offset);
    CGFloat f = __sizeForCRMediaContainItem(ScreenWidth);
    layout.itemSize = CGSizeMake(f, f);
    
    return layout;
}

- (instancetype)init{
    self = [super initWithFrame:CGRectZero collectionViewLayout:[CRMediaContainArrangement customFlowlayout]];
    if (self) {
        [self createSubView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame collectionViewLayout:[CRMediaContainArrangement customFlowlayout]];
    if (self) {
        [self createSubView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self createSubView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self createSubView];
    }
    return self;
}


- (void)createSubView{
    //初始化子视图
    self.medias = [[NSMutableArray alloc] init];
    self.maxCount = D_maxCount;
    
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.scrollEnabled = NO;
    self.delegate = self;
    self.dataSource = self;
    [self registerClass:[CRMediaEditCell class] forCellWithReuseIdentifier:cellIdentifier(CRMediaEditCell)];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (self.width == __width && self.medias.count == __itemCount) {
        return;
    }
    __width = self.width;
    __itemCount = MIN(self.maxCount, self.medias.count);
    CGFloat h = __sizeForCRMediaContainItem(__width);
    if (!__itemCount) {
        if (self.heightChange) {
            self.heightChange(0);
        }
        return;
    }
    CGFloat maxH = (ceil(__itemCount / D_lineNum)) * (h + D_offset) + D_offset;
    if (self.heightChange) {
        self.heightChange(maxH);
    }
}

#pragma mark - UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return MIN(self.maxCount, self.medias.count);
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat f = __sizeForCRMediaContainItem(__width);
    return CGSizeMake(f, f);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CRMedia * itemModel = [self.medias objectAtIndex:indexPath.item];
    CRMediaEditCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier(CRMediaEditCell) forIndexPath:indexPath];
    cell.cellModel = itemModel;
    WEAK_SELF
    [cell setOnClickPlayBtn:^{
        if (weakself.clickItemPlay) {
            weakself.clickItemPlay(indexPath.item, itemModel);
        }
    }];
    [cell setOnClickRemoveBtn:^{
        [weakself.medias removeObjectAtIndex:indexPath.item];
        [weakself reloadData];
    }];
    
    return cell;
}

- (void)addMedia:(id)media{
    if (self.medias.count > self.maxCount) {
        return;
    }
    [self.medias addObject:media];
    [self reloadData];
}

- (void)resetMedias:(NSArray *)medias{
    [self.medias setArray:medias];
    [self reloadData];
}

@end

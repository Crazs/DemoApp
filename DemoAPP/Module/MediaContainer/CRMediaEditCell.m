//
//  CRMediaEditCell.m
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/5.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import "CRMediaEditCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Photos/Photos.h>

@implementation CRMediaEditCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubView];
    }
    return self;
}

- (void)createSubView{
    self.backgroundColor = Color_F4F4F4;
    
    UIImageView * rImageView = [[UIImageView alloc] init];
    [self addSubview:rImageView];
    self.rImageView = rImageView;
    
    UIImageView * playImageV = [[UIImageView alloc] initWithImage:UIImage_name(@"item_play")];
    [self addSubview:playImageV];
    self.playImageV = playImageV;
    
    UIButton * removeButton = [UIButton createImageButton:UIImage_name(@"item_remove") selectImage:UIImage_name(@"")];
    [self addSubview:removeButton];
    self.removeButton = removeButton;
    
    playImageV.hidden = YES;
    
    [self.removeButton addTarget:self action:@selector(pressRemoveButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self makeSubViewsLayout];
}

- (void)makeSubViewsLayout{
    [self.rImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        MAS_full(self, 0);
    }];
    
    [self.playImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        MAS_size(30);
        MAS_centerX(self.mas_centerX, 0);
        MAS_centerY(self.mas_centerY, 0);
    }];
    
    [self.removeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        MAS_size(20);
        MAS_topRight(self, 0);
    }];
}

- (void)pressRemoveButton{
    if (self.onClickRemoveBtn) {
        self.onClickRemoveBtn();
    }
}


- (void)setCellModel:(id)cellModel{

    if ([cellModel isKindOfClass:[CRMedia class]]) {
        [self setCRMediaModel:cellModel];
    }else if ([cellModel isKindOfClass:[PHAsset class]]) {
        [self setPHAssetModel:cellModel];
    }else if ([cellModel isKindOfClass:[UIImage class]]) {
        self.rImageView.image = cellModel;
        self.playImageV.hidden = YES;
    }
}

- (void)setCRMediaModel:(CRMedia *)cellModel{
    if (cellModel.mediaType == CRMediaTypeImage) {
        CRMediaImage * imageModel = (CRMediaImage *)cellModel;
        if (imageModel.image) {
            self.rImageView.image = imageModel.image;
        }else if(imageModel.localPath) {
            self.rImageView.image = [UIImage imageWithContentsOfFile:imageModel.localPath];
        }else if (imageModel.urlPath) {
            [self.rImageView sd_setImageWithURL:[NSURL URLWithString:imageModel.urlPath]];
        }
        self.playImageV.hidden = YES;
    }else if(cellModel.mediaType == CRMediaTypeVideo){
        CRMediaVideo * videoModel = (CRMediaVideo *)cellModel;
        if (videoModel.coverImage.image) {
            self.rImageView.image = videoModel.coverImage.image;
        }else if(videoModel.coverImage.localPath) {
            self.rImageView.image = [UIImage imageWithContentsOfFile:videoModel.coverImage.localPath];
        }else if (videoModel.coverImage.urlPath) {
            [self.rImageView sd_setImageWithURL:[NSURL URLWithString:videoModel.coverImage.urlPath]];
        }
        self.playImageV.hidden = NO;
    }else if(cellModel.mediaType == CRMediaTypeAudio){
        self.rImageView.image = UIImage_name(@"media_audio");
        self.playImageV.hidden = NO;
    }else if(cellModel.mediaType == CRMediaTypeFile){
        self.rImageView.image = UIImage_name(@"media_file");
        self.playImageV.hidden = YES;
    }
}

- (void)setPHAssetModel:(PHAsset *)cellModel{
    /**
     PHAssetMediaTypeUnknown = 0,
     PHAssetMediaTypeImage   = 1,
     PHAssetMediaTypeVideo   = 2,
     PHAssetMediaTypeAudio   = 3,
     */
    PHImageRequestOptions *option = [PHImageRequestOptions new];
    option.resizeMode =  PHImageRequestOptionsResizeModeExact;
    option.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    if (cellModel.mediaType == PHAssetMediaTypeImage) {
        
        [[PHImageManager defaultManager] requestImageForAsset:cellModel targetSize:self.rImageView.size contentMode:PHImageContentModeDefault options:option resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            self.rImageView.image = result;
        }];
        self.playImageV.hidden = YES;
    }else if(cellModel.mediaType == PHAssetMediaTypeVideo){
        [[PHImageManager defaultManager] requestImageForAsset:cellModel targetSize:self.rImageView.size contentMode:PHImageContentModeDefault options:option resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            self.rImageView.image = result;
        }];
        self.playImageV.hidden = NO;
    }else if(cellModel.mediaType == PHAssetMediaTypeAudio){
        self.rImageView.image = UIImage_name(@"media_audio");
        self.playImageV.hidden = NO;
    }else if(cellModel.mediaType == PHAssetMediaTypeUnknown){
        self.rImageView.image = UIImage_name(@"media_file");
        self.playImageV.hidden = YES;
    }
}

@end

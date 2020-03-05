//
//  CRMediaEditCell.m
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/5.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import "CRMediaEditCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

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
    
    
    UIButton * playButton = [UIButton createImageButton:UIImage_name(@"play1") selectImage:UIImage_name(@"")];
    [self addSubview:playButton];
    self.playButton = playButton;
    
    
    UIButton * removeButton = [UIButton createImageButton:UIImage_name(@"item_remove") selectImage:UIImage_name(@"")];
    [self addSubview:removeButton];
    self.removeButton = removeButton;
    
    
    playButton.hidden = YES;
    
    [self.playButton addTarget:self action:@selector(pressPlayButton) forControlEvents:UIControlEventTouchUpInside];
    [self.removeButton addTarget:self action:@selector(pressRemoveButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self makeSubViewsLayout];
}

- (void)makeSubViewsLayout{
    [self.rImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        MAS_full(self, 0);
    }];
    
    [self.playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        MAS_size(30);
        MAS_centerX(self.mas_centerX, 0);
        MAS_centerY(self.mas_centerY, 0);
    }];
    
    [self.removeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        MAS_size(20);
        MAS_topRight(self, 0);
    }];
}

- (void)pressPlayButton{
    if (self.onClickPlayBtn) {
        self.onClickPlayBtn();
    }
}

- (void)pressRemoveButton{
    if (self.onClickRemoveBtn) {
        self.onClickRemoveBtn();
    }
}


- (void)setCellModel:(CRMedia *)cellModel{
    if (cellModel.mediaType == CRMediaTypeImage) {
        CRMediaImage * imageModel = (CRMediaImage *)cellModel;
        if (imageModel.image) {
            self.rImageView.image = imageModel.image;
        }else if(imageModel.localPath) {
            self.rImageView.image = [UIImage imageWithContentsOfFile:imageModel.localPath];
        }else if (imageModel.urlPath) {
            [self.rImageView sd_setImageWithURL:[NSURL URLWithString:imageModel.urlPath]];
        }
        self.playButton.hidden = YES;
    }else if(cellModel.mediaType == CRMediaTypeVideo){
        CRMediaVideo * videoModel = (CRMediaVideo *)cellModel;
        if (videoModel.coverImage.image) {
            self.rImageView.image = videoModel.coverImage.image;
        }else if(videoModel.coverImage.localPath) {
            self.rImageView.image = [UIImage imageWithContentsOfFile:videoModel.coverImage.localPath];
        }else if (videoModel.coverImage.urlPath) {
            [self.rImageView sd_setImageWithURL:[NSURL URLWithString:videoModel.coverImage.urlPath]];
        }
        self.playButton.hidden = NO;
    }else{
        self.playButton.hidden = YES;
    }
}

@end

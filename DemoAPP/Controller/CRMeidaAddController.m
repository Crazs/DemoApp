//
//  CRMeidaAddController.m
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/5.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import "CRMeidaAddController.h"
#import "CRMediaContainEdit.h"
#import "CRMediaContainEditCustom.h"
#import "CRMedia.h"
#import <CTAssetsPickerController/CTAssetsPickerController.h>

@interface CRMeidaAddController ()<CTAssetsPickerControllerDelegate>

@property (nonatomic, strong) CRMediaContainEdit * mediaContain;
@property (nonatomic, strong) CRMediaContainEditCustom * custonMediaContain;

@end

@implementation CRMeidaAddController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Color_F4F4F4;
    
    [self createSubView];
    [self createNavigationBar];
}

- (void)createNavigationBar{
    UIBarButtonItem * add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(clickAddButton)];
    self.navigationItem.rightBarButtonItem = add;
}

- (void)createSubView{
    WEAK_SELF

    self.mediaContain = [[CRMediaContainEdit alloc] init];
    [self.view addSubview:self.mediaContain];
    [self.mediaContain mas_makeConstraints:^(MASConstraintMaker *make) {
        MAS_top(self.view, 64);
        MAS_leftRight0(self.view);
    }];
    self.mediaContain.backgroundColor = Color_White;
    [self.mediaContain setHeightChange:^(CGFloat height) {
        [weakself.mediaContain mas_updateConstraints:^(MASConstraintMaker *make) {
            MAS_height(height);
        }];
    }];
    
//    self.custonMediaContain = [[CRMediaContainEditCustom alloc] init];
//    [self.view addSubview:self.custonMediaContain];
//    [self.custonMediaContain mas_makeConstraints:^(MASConstraintMaker *make) {
//        MAS_top(self.view, 64);
//        MAS_leftRight0(self.view);
//    }];
//    self.custonMediaContain.backgroundColor = Color_White;
//    [self.custonMediaContain setHeightChange:^(CGFloat height) {
//        [weakself.custonMediaContain mas_updateConstraints:^(MASConstraintMaker *make) {
//            MAS_height(height);
//        }];
//    }];
    
}

#pragma mark - HTTP

#pragma mark - Delegate
#pragma mark CTAssetsPickerControllerDelegate
// 限定选择的最大选择个数
- (BOOL)assetsPickerController:(CTAssetsPickerController *)picker shouldSelectAsset:(PHAsset *)asset{
    
    NSInteger maxNumber = 9;

    if (picker.selectedAssets.count <maxNumber)return YES;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"最多选择%ld张", maxNumber] preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [picker presentViewController:alert animated:YES completion:nil];
    
    return NO;
}

- (void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets{
    //选择完毕关闭页面
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self.mediaContain addMedias:assets];
}

#pragma mark - Public

#pragma mark - Private

- (void)clickAddButton{
    //[self.mediaContain addMedia:[[CRMediaImage alloc] init]];
    
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        
        dispatch_async(dispatch_get_main_queue(), ^{

            CTAssetsPickerController *assetPC = [[CTAssetsPickerController alloc] init];

            assetPC.showsEmptyAlbums = YES;
            //显示图片索引
            assetPC.showsSelectionIndex = YES;
            //显示那些资源
            assetPC.assetCollectionSubtypes = @[@(PHAssetCollectionSubtypeSmartAlbumUserLibrary), @(PHAssetCollectionSubtypeAlbumRegular)];

            assetPC.delegate = self;
            [self presentViewController:assetPC animated:YES completion:nil];
        });
    }];

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

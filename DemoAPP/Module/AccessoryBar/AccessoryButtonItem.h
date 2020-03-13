//
//  AccessoryButtonItem.h
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/8.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AccessoryButtonItem : NSObject

@property (nonatomic, strong) UIImage * image;
@property (nonatomic, strong) UIImage * selectedImage;

@property (nonatomic, strong) UIImage * backgroundImage;
@property (nonatomic, strong) UIImage * backgroundSelectedImage;

//defalut [DarkGrayColor]
@property (nonatomic, strong) UIColor * textColor;
@property (nonatomic, strong) UIColor * textSelectedColor;

@property (nonatomic, strong) UIFont * textFont;

@property (nonatomic, copy) NSString * text;
@property (nonatomic, copy) NSString * selectedText;

@property (nonatomic, assign) NSInteger tag;
@property (nonatomic) SEL action;
@property (nonatomic, nullable, weak)id target;


- (instancetype)initWithImage:(UIImage *)image
                         text:(NSString *)text
                       target:(id)target
                       action:(SEL)action;

- (instancetype)initWithImage:(UIImage *)image
                selectedImage:(UIImage *)selectedImage
                         text:(NSString *)text
                 selectedText:(NSString *)selectedText
                       target:(id)target
                       action:(SEL)action;

@end

NS_ASSUME_NONNULL_END

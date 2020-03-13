//
//  AccessoryButtonItem.m
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/8.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import "AccessoryButtonItem.h"

#define D_fontSize  14
@implementation AccessoryButtonItem

- (instancetype)initWithImage:(UIImage *)image text:(NSString *)text target:(id)target action:(SEL)action{
    self = [super init];
    if (self) {
        self.image = image;
        self.text = text;
        self.target = target;
        self.action = action;
        
        self.textColor = [UIColor darkGrayColor];
        self.textFont = [UIFont systemFontOfSize:D_fontSize];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage text:(NSString *)text selectedText:(NSString *)selectedText target:(id)target action:(SEL)action{
    self = [super init];
    if (self) {
        self.image = image;
        self.selectedImage = selectedImage;
        self.text = text;
        self.selectedText = selectedText;
        self.target = target;
        self.action = action;
        
        self.textColor = [UIColor darkGrayColor];
        self.textFont = [UIFont systemFontOfSize:D_fontSize];
    }
    return self;
}

@end

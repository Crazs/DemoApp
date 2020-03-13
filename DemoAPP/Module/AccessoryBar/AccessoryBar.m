//
//  AccessoryBar.m
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/8.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import "AccessoryBar.h"

#define D_buttonKey @"buttonKey"
#define D_itemKey   @"itemKey"

@interface AccessoryBar()
@property (nonatomic, strong) NSMutableDictionary * buttonBind;
@property (nonatomic, strong) NSArray * buttonItems;
@end

@implementation AccessoryBar

static NSUInteger KVOOptions = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;

- (void)layoutSubviews{
    [super layoutSubviews];
    
    NSLog(@"****");
    
}

- (void)setItems:(NSArray *)items{
    self.buttonItems = items;
    if (items && items.count) {
        for (AccessoryButtonItem * item in items) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setImageTextAlign:self.itemAlign];
            
            [button setImage:item.image forState:UIControlStateNormal];
            if (item.selectedImage) {
                [button setImage:item.selectedImage forState:UIControlStateSelected];
            }
            
            [button setTitle:item.text forState:UIControlStateNormal];
            if (item.selectedText) {
                [button setTitle:item.text forState:UIControlStateSelected];
            }
            
            [button setTitleColor:item.textColor forState:UIControlStateNormal];
            if (item.textSelectedColor) {
                [button setTitleColor:item.textSelectedColor forState:UIControlStateSelected];
            }
            
            button.titleLabel.font = item.textFont;
            [button addTarget:item.target action:item.action forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:button];
            
            
            [item addObserver:self forKeyPath:@"image" options:KVOOptions context:nil];
            [item addObserver:self forKeyPath:@"image" options:KVOOptions context:nil];
            [item addObserver:self forKeyPath:@"image" options:KVOOptions context:nil];
            [item addObserver:self forKeyPath:@"image" options:KVOOptions context:nil];
            [item addObserver:self forKeyPath:@"image" options:KVOOptions context:nil];
            [item addObserver:self forKeyPath:@"image" options:KVOOptions context:nil];
            [item addObserver:self forKeyPath:@"image" options:KVOOptions context:nil];
            [item addObserver:self forKeyPath:@"image" options:KVOOptions context:nil];
            [item addObserver:self forKeyPath:@"image" options:KVOOptions context:nil];
        }
    }else{
        for (UIView * subView in self.subviews) {
            [subView removeFromSuperview];
        }
    }
}

- (void)reloadData{
    
}

- (void)reloadItem:(AccessoryButtonItem *)item{
    UIButton * button = [self buttonForItem:item];
    if (!button) {
        return;
    }else{
        //设置button
        
    }
}

- (void)resetButton:(UIButton *)button buttonItem:(AccessoryButtonItem *)item{
    
}

- (UIButton *)buttonForItem:(AccessoryButtonItem *)item{
    NSString * btnKey = @(item.tag).stringValue;
    if ([self.buttonBind.allKeys containsObject: btnKey]) {
        return [self.buttonBind objectForKey:btnKey];
    }
    return nil;
}


@end

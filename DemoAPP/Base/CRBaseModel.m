//
//  CRBaseModel.m
//  CRHelperLib
//
//  Created by 周文涛 on 2019/12/2.
//  Copyright © 2019年 Crazs. All rights reserved.
//

#import "CRBaseModel.h"

@implementation CRBaseModel

+(BOOL)supportsSecureCoding{
    return YES;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.mID = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(mID))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.mID forKey:NSStringFromSelector(@selector(mID))];
}

@end


/**
 @brief     YYModel的扩充
 */
@implementation CRBaseModel(YYModel)

//返回一个 Dict，将 Model 属性名对映射到 JSON 的 Key。
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"mID" : @"id"};
}

// 如果实现了该方法，则处理过程中会忽略该列表内的所有属性
//+ (NSArray *)modelPropertyBlacklist {
//    return @[@"mHash"];
//}


@end

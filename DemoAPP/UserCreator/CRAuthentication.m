//
//  CRAuthentication.m
//  CRHelperLib
//
//  Created by 周文涛 on 2019/12/2.
//  Copyright © 2019年 Crazs. All rights reserved.
//

#import "CRAuthentication.h"

@implementation CRAuthentication

+(BOOL)supportsSecureCoding{
    return YES;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.authenticate = [[aDecoder decodeObjectForKey:NSStringFromSelector(@selector(isAuthenticate))] boolValue];
        self.name = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(name))];
        self.nationalID = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(nationalID))];
        self.cardFrontImg = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(cardFrontImg))];
        self.cardBehindImg = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(cardBehindImg))];
        self.cardPortraitImg = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(cardPortraitImg))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:@(self.authenticate) forKey:NSStringFromSelector(@selector(isAuthenticate))];
    [aCoder encodeObject:self.name forKey:NSStringFromSelector(@selector(name))];
    [aCoder encodeObject:self.nationalID forKey:NSStringFromSelector(@selector(nationalID))];
    [aCoder encodeObject:self.cardFrontImg forKey:NSStringFromSelector(@selector(cardFrontImg))];
    [aCoder encodeObject:self.cardBehindImg forKey:NSStringFromSelector(@selector(cardBehindImg))];
    [aCoder encodeObject:self.cardPortraitImg forKey:NSStringFromSelector(@selector(cardPortraitImg))];
}

@end

//
//  CRAccount.m
//  CRHelperLib
//
//  Created by 周文涛 on 2019/12/2.
//  Copyright © 2019年 Crazs. All rights reserved.
//

#import "CRAccount.h"

@implementation CRAccount

+(BOOL)supportsSecureCoding{
    return YES;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(name))];
        self.password = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(password))];
        self.nickname = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(nickname))];
        self.header = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(header))];
        self.brief = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(brief))];
        self.roles = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(roles))];
        self.phone = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(phone))];
        self.Email = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(Email))];
        self.authenticator = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(authenticator))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.name forKey:NSStringFromSelector(@selector(name))];
    [aCoder encodeObject:self.password forKey:NSStringFromSelector(@selector(password))];
    [aCoder encodeObject:self.nickname forKey:NSStringFromSelector(@selector(nickname))];
    [aCoder encodeObject:self.header forKey:NSStringFromSelector(@selector(header))];
    [aCoder encodeObject:self.brief forKey:NSStringFromSelector(@selector(brief))];
    [aCoder encodeObject:self.roles forKey:NSStringFromSelector(@selector(roles))];
    [aCoder encodeObject:self.phone forKey:NSStringFromSelector(@selector(phone))];
    [aCoder encodeObject:self.Email forKey:NSStringFromSelector(@selector(Email))];
    [aCoder encodeObject:self.authenticator forKey:NSStringFromSelector(@selector(authenticator))];
}



@end

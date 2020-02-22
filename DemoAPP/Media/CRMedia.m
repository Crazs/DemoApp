//
//  CRMedia.m
//  CRHelperLib
//
//  Created by 周文涛 on 2019/12/2.
//  Copyright © 2019年 Crazs. All rights reserved.
//

#import "CRMedia.h"

@implementation CRMedia
+(BOOL)supportsSecureCoding{
    return YES;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.mediaType = [[aDecoder decodeObjectForKey:NSStringFromSelector(@selector(mediaType))] integerValue];
        self.localPath = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(localPath))];
        self.urlPath = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(urlPath))];
        self.suffix = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(suffix))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:@(self.mediaType) forKey:NSStringFromSelector(@selector(mediaType))];
    [aCoder encodeObject:self.localPath forKey:NSStringFromSelector(@selector(localPath))];
    [aCoder encodeObject:self.urlPath forKey:NSStringFromSelector(@selector(urlPath))];
    [aCoder encodeObject:self.suffix forKey:NSStringFromSelector(@selector(suffix))];
}

@end

@implementation CRMediaFile
+(BOOL)supportsSecureCoding{
    return YES;
}
@end

@implementation CRMediaImage
+(BOOL)supportsSecureCoding{
    return YES;
}
@end

@implementation CRMediaAudio
+(BOOL)supportsSecureCoding{
    return YES;
}
@end



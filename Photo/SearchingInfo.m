//
//  SearchingInfo.m
//  Photo
//
//  Created by Aleksey on 11.12.2017.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import "SearchingInfo.h"

@implementation SearchingInfo

- (id)initWithContent:(NSString *)content type:(ContentType)type {
    self = [super init];
    if (self) {
        _content = content;
        _type = type;
    }
    return self;
}

@end


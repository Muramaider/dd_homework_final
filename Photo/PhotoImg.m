//
//  PhotoImg.m
//  Photo
//
//  Created by Aleksey on 11.12.2017.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import "PhotoImg.h"

@implementation PhotoImg

- (id)initWithImage:(UIImage *)image photoSizes:(NSDictionary *)sizes {
    self = [super init];
    if (self) {
        _image = image;
        _sizes = sizes;
    }
    return self;
}

@end

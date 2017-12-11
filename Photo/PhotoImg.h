//
//  PhotoImg.h
//  Photo
//
//  Created by Aleksey on 11.12.2017.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoImg : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSDictionary *sizes;

- (id)initWithImage:(UIImage *)image photoSizes:(NSDictionary *)sizes;

@end

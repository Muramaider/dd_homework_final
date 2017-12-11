//
//  WebServicePhoto.h
//  Photo
//
//  Created by Aleksey on 11.12.2017.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PhotoImg;

@protocol PhotoServiceDelegate <NSObject>
- (void)errorLoadingDataWithTitle:(NSString *)title description:(NSString *)errorDescription;
- (void)setLoadedPhoto:(PhotoImg *)photoImage;
@end

@interface WebServicePhoto : NSObject

@property (nonatomic, weak) id <PhotoServiceDelegate> delegate;

- (void)loadPhotoWithSize:(NSString *)size photoSizes:(NSDictionary *)photoSizes delegate:(id)delegate;

@end


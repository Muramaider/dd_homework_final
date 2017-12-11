//
//  WebServiceParamPhoto.h
//  Photo
//
//  Created by Aleksey on 11.12.2017.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PhotoImg;

@protocol ParamPhotosDelegate <NSObject>
- (void)errorLoadingDataWithTitle:(NSString *)title description:(NSString *)errorDescription;
- (void)addPhotoImage:(PhotoImg *)photoImage;
- (void)updateNumberOfPhotos;
@end

@interface ParamPhotosService : NSObject

@property (nonatomic, assign) NSInteger nubmerOfPhotos;
@property (nonatomic, weak) id <ParamPhotosDelegate> delegate;

- (void)loadTagPhotos:(NSString *)tag;
- (void)loadTextPhotos:(NSString *)text;

@end

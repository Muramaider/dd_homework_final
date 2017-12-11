//
//  JSWeb.h
//  Photo
//
//  Created by Aleksey on 11.12.2017.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PhotoImg;

@protocol FlickrNetworkErrorDelegate <NSObject>
- (void)errorLoadingDataWithTitle:(NSString *)title description:(NSString *)errorDescription;
@end

@protocol FlickrNetworkTagsDelegate <FlickrNetworkErrorDelegate>
- (void)setReceivedTags:(NSArray *)tags;
@end

@protocol FlickrNetworkParamPhotosDelegate <FlickrNetworkErrorDelegate>
- (void)addLoadedPhoto:(PhotoImg *)image;
@optional
- (void)setReceivedPhotosIDs:(NSArray *)photosID;
@end

@interface FlickrNetwork : NSObject

+ (void)loadTenHotTagsWithDelegate:(id <FlickrNetworkTagsDelegate>)delegate;

+ (void)loadPhotoIDsWithTag:(NSString *)tag delegate:(id <FlickrNetworkParamPhotosDelegate>)delegate;
+ (void)loadPhotoIDsWithText:(NSString *)text delegate:(id <FlickrNetworkParamPhotosDelegate>)delegate;
+ (void)loadSizeOfPhotosWithID:(NSArray *)photoIDs delegate:(id <FlickrNetworkParamPhotosDelegate>)delegate;

+ (void)loadPhotoWithSize:(NSString *)size photoSizes:(NSDictionary *)photoSizesURL session:(NSURLSession *)session delegate:(id <FlickrNetworkParamPhotosDelegate>)delegate;

@end

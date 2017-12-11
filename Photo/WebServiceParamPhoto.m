//
//  WebServiceParamPhoto.m
//  Photo
//
//  Created by Aleksey on 11.12.2017.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import "WebServiceParamPhoto.h"
#import "JSWeb.h"

@interface ParamPhotosService () <FlickrNetworkParamPhotosDelegate>

@end

@implementation ParamPhotosService

- (id)init {
    self = [super init];
    if (self) {
        _nubmerOfPhotos = 0;
    }
    return self;
}

- (void)loadTextPhotos:(NSString *)text {
    [FlickrNetwork loadPhotoIDsWithText:text delegate:self];
}

- (void)loadTagPhotos:(NSString *)tag {
    [FlickrNetwork loadPhotoIDsWithTag:tag delegate:self];
}

- (void)errorLoadingDataWithTitle:(NSString *)title description:(NSString *)errorDescription {
    [self.delegate errorLoadingDataWithTitle:title description:errorDescription];
}

- (void)setReceivedPhotosIDs:(NSArray *)photosID {
    self.nubmerOfPhotos = photosID.count;
    [self.delegate updateNumberOfPhotos];
    [FlickrNetwork loadSizeOfPhotosWithID:photosID delegate:self];
}

- (void)addLoadedPhoto:(PhotoImg *)image {
    [self.delegate addPhotoImage:image];
}

@end

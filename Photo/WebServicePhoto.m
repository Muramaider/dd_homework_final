//
//  WebServicePhoto.m
//  Photo
//
//  Created by Aleksey on 11.12.2017.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import "WebServicePhoto.h"
#import "JSWeb.h"

@interface WebServicePhoto () <FlickrNetworkParamPhotosDelegate>

@end

@implementation WebServicePhoto

- (void)loadPhotoWithSize:(NSString *)size photoSizes:(NSDictionary *)photoSizes delegate:(id)delegate {
    [FlickrNetwork loadPhotoWithSize:size photoSizes:photoSizes session:nil delegate:self];
}

- (void)addLoadedPhoto:(PhotoImg *)image {
    [self.delegate setLoadedPhoto:image];
}

- (void)errorLoadingDataWithTitle:(NSString *)title description:(NSString *)errorDescription {
    [self.delegate errorLoadingDataWithTitle:title description:errorDescription];
}

@end

//
//  WebServiceTag.m
//  Photo
//
//  Created by Aleksey on 11.12.2017.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import "WebServiceTag.h"
#import "JSWeb.h"

@interface WebServiceTag () <FlickrNetworkTagsDelegate>
@end

@implementation WebServiceTag

- (void)loadTags {
    [FlickrNetwork loadTenHotTagsWithDelegate:self];
}

- (void)setReceivedTags:(NSArray *)tags {
    [self.delegate setReceivedTags:tags];
}

- (void)errorLoadingDataWithTitle:(NSString *)title description:(NSString *)errorDescription {
    [self.delegate errorLoadingDataWithTitle:title description:errorDescription];
}

@end

//
//  WebServiceTag.h
//  Photo
//
//  Created by Aleksey on 11.12.2017.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TagsServiceDelegate <NSObject>
- (void)errorLoadingDataWithTitle:(NSString *)title description:(NSString *)errorDescription;
- (void)setReceivedTags:(NSArray *)tags;
@end

@interface WebServiceTag : NSObject

@property (nonatomic, weak) id <TagsServiceDelegate> delegate;

- (void)loadTags;

@end


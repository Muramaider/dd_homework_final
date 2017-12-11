//
//  SearchingInfo.h
//  Photo
//
//  Created by Aleksey on 11.12.2017.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ContentTypeTag,
    ContentTypeText
} ContentType;

@interface SearchingInfo : NSObject

- (id)initWithContent:(NSString *)content type:(ContentType)type;

@property (nonatomic, assign) ContentType type;
@property (nonatomic, copy) NSString *content;

@end

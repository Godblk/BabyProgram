//
//  RStreamItems.h
//
//  Created by zgt  on 16/3/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RStreamMoment, RStreamProduct;

@interface RStreamItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) RStreamMoment *streamMoment;
@property (nonatomic, strong) RStreamProduct *streamProduct;
@property (nonatomic, assign) double renderType;
@property (nonatomic, assign) double momentId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

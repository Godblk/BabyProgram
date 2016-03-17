//
//  RRelatedMoments.h
//
//  Created by zgt  on 16/3/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RRelatedMoments : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *showPrice;
@property (nonatomic, strong) NSString *momentType;
@property (nonatomic, assign) double iid;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *momentId;
@property (nonatomic, assign) double redirectType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

//
//  RStreamMoment.h
//
//  Created by zgt  on 16/3/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RUserInfo;

@interface RStreamMoment : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL isSticky;
@property (nonatomic, strong) NSArray *parseUrls;
@property (nonatomic, assign) double gmtCreate;
@property (nonatomic, strong) NSArray *literalAts;
@property (nonatomic, strong) NSArray *momentTags;
@property (nonatomic, assign) double likeCount;
@property (nonatomic, strong) NSArray *contentTag;
@property (nonatomic, assign) double isLiked;
@property (nonatomic, strong) NSString *showGmtCreate;
@property (nonatomic, assign) double momentId;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSArray *imgs;
@property (nonatomic, strong) NSString *displayRegion;
@property (nonatomic, strong) RUserInfo *userInfo;
@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, assign) double redirectType;
@property (nonatomic, strong) NSArray *relatedMoments;
@property (nonatomic, assign) double iid;
@property (nonatomic, strong) NSString *commentCount;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSArray *literalCircles;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

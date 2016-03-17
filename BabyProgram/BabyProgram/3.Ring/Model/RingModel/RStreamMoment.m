//
//  RStreamMoment.m
//
//  Created by zgt  on 16/3/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RStreamMoment.h"
#import "RLiteralAts.h"
#import "RImgs.h"
#import "RUserInfo.h"
#import "RComments.h"
#import "RRelatedMoments.h"
#import "RLiteralCircles.h"


NSString *const kRStreamMomentIsSticky = @"is_sticky";
NSString *const kRStreamMomentParseUrls = @"parse_urls";
NSString *const kRStreamMomentGmtCreate = @"gmt_create";
NSString *const kRStreamMomentLiteralAts = @"literal_ats";
NSString *const kRStreamMomentMomentTags = @"moment_tags";
NSString *const kRStreamMomentLikeCount = @"like_count";
NSString *const kRStreamMomentContentTag = @"content_tag";
NSString *const kRStreamMomentIsLiked = @"is_liked";
NSString *const kRStreamMomentShowGmtCreate = @"show_gmt_create";
NSString *const kRStreamMomentMomentId = @"moment_id";
NSString *const kRStreamMomentType = @"type";
NSString *const kRStreamMomentImgs = @"imgs";
NSString *const kRStreamMomentDisplayRegion = @"display_region";
NSString *const kRStreamMomentUserInfo = @"user_info";
NSString *const kRStreamMomentComments = @"comments";
NSString *const kRStreamMomentRedirectType = @"redirect_type";
NSString *const kRStreamMomentRelatedMoments = @"related_moments";
NSString *const kRStreamMomentIid = @"iid";
NSString *const kRStreamMomentCommentCount = @"comment_count";
NSString *const kRStreamMomentContent = @"content";
NSString *const kRStreamMomentLiteralCircles = @"literal_circles";


@interface RStreamMoment ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RStreamMoment

@synthesize isSticky = _isSticky;
@synthesize parseUrls = _parseUrls;
@synthesize gmtCreate = _gmtCreate;
@synthesize literalAts = _literalAts;
@synthesize momentTags = _momentTags;
@synthesize likeCount = _likeCount;
@synthesize contentTag = _contentTag;
@synthesize isLiked = _isLiked;
@synthesize showGmtCreate = _showGmtCreate;
@synthesize momentId = _momentId;
@synthesize type = _type;
@synthesize imgs = _imgs;
@synthesize displayRegion = _displayRegion;
@synthesize userInfo = _userInfo;
@synthesize comments = _comments;
@synthesize redirectType = _redirectType;
@synthesize relatedMoments = _relatedMoments;
@synthesize iid = _iid;
@synthesize commentCount = _commentCount;
@synthesize content = _content;
@synthesize literalCircles = _literalCircles;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.isSticky = [[self objectOrNilForKey:kRStreamMomentIsSticky fromDictionary:dict] boolValue];
            self.parseUrls = [self objectOrNilForKey:kRStreamMomentParseUrls fromDictionary:dict];
            self.gmtCreate = [[self objectOrNilForKey:kRStreamMomentGmtCreate fromDictionary:dict] doubleValue];
    NSObject *receivedRLiteralAts = [dict objectForKey:kRStreamMomentLiteralAts];
    NSMutableArray *parsedRLiteralAts = [NSMutableArray array];
    if ([receivedRLiteralAts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRLiteralAts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRLiteralAts addObject:[RLiteralAts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRLiteralAts isKindOfClass:[NSDictionary class]]) {
       [parsedRLiteralAts addObject:[RLiteralAts modelObjectWithDictionary:(NSDictionary *)receivedRLiteralAts]];
    }

    self.literalAts = [NSArray arrayWithArray:parsedRLiteralAts];
            self.momentTags = [self objectOrNilForKey:kRStreamMomentMomentTags fromDictionary:dict];
            self.likeCount = [[self objectOrNilForKey:kRStreamMomentLikeCount fromDictionary:dict] doubleValue];
            self.contentTag = [self objectOrNilForKey:kRStreamMomentContentTag fromDictionary:dict];
            self.isLiked = [[self objectOrNilForKey:kRStreamMomentIsLiked fromDictionary:dict] doubleValue];
            self.showGmtCreate = [self objectOrNilForKey:kRStreamMomentShowGmtCreate fromDictionary:dict];
            self.momentId = [[self objectOrNilForKey:kRStreamMomentMomentId fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kRStreamMomentType fromDictionary:dict] doubleValue];
    NSObject *receivedRImgs = [dict objectForKey:kRStreamMomentImgs];
    NSMutableArray *parsedRImgs = [NSMutableArray array];
    if ([receivedRImgs isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRImgs) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRImgs addObject:[RImgs modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRImgs isKindOfClass:[NSDictionary class]]) {
       [parsedRImgs addObject:[RImgs modelObjectWithDictionary:(NSDictionary *)receivedRImgs]];
    }

    self.imgs = [NSArray arrayWithArray:parsedRImgs];
            self.displayRegion = [self objectOrNilForKey:kRStreamMomentDisplayRegion fromDictionary:dict];
            self.userInfo = [RUserInfo modelObjectWithDictionary:[dict objectForKey:kRStreamMomentUserInfo]];
    NSObject *receivedRComments = [dict objectForKey:kRStreamMomentComments];
    NSMutableArray *parsedRComments = [NSMutableArray array];
    if ([receivedRComments isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRComments) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRComments addObject:[RComments modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRComments isKindOfClass:[NSDictionary class]]) {
       [parsedRComments addObject:[RComments modelObjectWithDictionary:(NSDictionary *)receivedRComments]];
    }

    self.comments = [NSArray arrayWithArray:parsedRComments];
            self.redirectType = [[self objectOrNilForKey:kRStreamMomentRedirectType fromDictionary:dict] doubleValue];
    NSObject *receivedRRelatedMoments = [dict objectForKey:kRStreamMomentRelatedMoments];
    NSMutableArray *parsedRRelatedMoments = [NSMutableArray array];
    if ([receivedRRelatedMoments isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRRelatedMoments) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRRelatedMoments addObject:[RRelatedMoments modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRRelatedMoments isKindOfClass:[NSDictionary class]]) {
       [parsedRRelatedMoments addObject:[RRelatedMoments modelObjectWithDictionary:(NSDictionary *)receivedRRelatedMoments]];
    }

    self.relatedMoments = [NSArray arrayWithArray:parsedRRelatedMoments];
            self.iid = [[self objectOrNilForKey:kRStreamMomentIid fromDictionary:dict] doubleValue];
            self.commentCount = [self objectOrNilForKey:kRStreamMomentCommentCount fromDictionary:dict];
            self.content = [self objectOrNilForKey:kRStreamMomentContent fromDictionary:dict];
    NSObject *receivedRLiteralCircles = [dict objectForKey:kRStreamMomentLiteralCircles];
    NSMutableArray *parsedRLiteralCircles = [NSMutableArray array];
    if ([receivedRLiteralCircles isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRLiteralCircles) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRLiteralCircles addObject:[RLiteralCircles modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRLiteralCircles isKindOfClass:[NSDictionary class]]) {
       [parsedRLiteralCircles addObject:[RLiteralCircles modelObjectWithDictionary:(NSDictionary *)receivedRLiteralCircles]];
    }

    self.literalCircles = [NSArray arrayWithArray:parsedRLiteralCircles];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.isSticky] forKey:kRStreamMomentIsSticky];
    NSMutableArray *tempArrayForParseUrls = [NSMutableArray array];
    for (NSObject *subArrayObject in self.parseUrls) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForParseUrls addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForParseUrls addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForParseUrls] forKey:kRStreamMomentParseUrls];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gmtCreate] forKey:kRStreamMomentGmtCreate];
    NSMutableArray *tempArrayForLiteralAts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.literalAts) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLiteralAts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLiteralAts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLiteralAts] forKey:kRStreamMomentLiteralAts];
    NSMutableArray *tempArrayForMomentTags = [NSMutableArray array];
    for (NSObject *subArrayObject in self.momentTags) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMomentTags addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMomentTags addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMomentTags] forKey:kRStreamMomentMomentTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likeCount] forKey:kRStreamMomentLikeCount];
    NSMutableArray *tempArrayForContentTag = [NSMutableArray array];
    for (NSObject *subArrayObject in self.contentTag) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForContentTag addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForContentTag addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForContentTag] forKey:kRStreamMomentContentTag];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isLiked] forKey:kRStreamMomentIsLiked];
    [mutableDict setValue:self.showGmtCreate forKey:kRStreamMomentShowGmtCreate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.momentId] forKey:kRStreamMomentMomentId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kRStreamMomentType];
    NSMutableArray *tempArrayForImgs = [NSMutableArray array];
    for (NSObject *subArrayObject in self.imgs) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForImgs addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForImgs addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImgs] forKey:kRStreamMomentImgs];
    [mutableDict setValue:self.displayRegion forKey:kRStreamMomentDisplayRegion];
    [mutableDict setValue:[self.userInfo dictionaryRepresentation] forKey:kRStreamMomentUserInfo];
    NSMutableArray *tempArrayForComments = [NSMutableArray array];
    for (NSObject *subArrayObject in self.comments) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForComments addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForComments addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForComments] forKey:kRStreamMomentComments];
    [mutableDict setValue:[NSNumber numberWithDouble:self.redirectType] forKey:kRStreamMomentRedirectType];
    NSMutableArray *tempArrayForRelatedMoments = [NSMutableArray array];
    for (NSObject *subArrayObject in self.relatedMoments) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRelatedMoments addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRelatedMoments addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRelatedMoments] forKey:kRStreamMomentRelatedMoments];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iid] forKey:kRStreamMomentIid];
    [mutableDict setValue:self.commentCount forKey:kRStreamMomentCommentCount];
    [mutableDict setValue:self.content forKey:kRStreamMomentContent];
    NSMutableArray *tempArrayForLiteralCircles = [NSMutableArray array];
    for (NSObject *subArrayObject in self.literalCircles) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLiteralCircles addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLiteralCircles addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLiteralCircles] forKey:kRStreamMomentLiteralCircles];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.isSticky = [aDecoder decodeBoolForKey:kRStreamMomentIsSticky];
    self.parseUrls = [aDecoder decodeObjectForKey:kRStreamMomentParseUrls];
    self.gmtCreate = [aDecoder decodeDoubleForKey:kRStreamMomentGmtCreate];
    self.literalAts = [aDecoder decodeObjectForKey:kRStreamMomentLiteralAts];
    self.momentTags = [aDecoder decodeObjectForKey:kRStreamMomentMomentTags];
    self.likeCount = [aDecoder decodeDoubleForKey:kRStreamMomentLikeCount];
    self.contentTag = [aDecoder decodeObjectForKey:kRStreamMomentContentTag];
    self.isLiked = [aDecoder decodeDoubleForKey:kRStreamMomentIsLiked];
    self.showGmtCreate = [aDecoder decodeObjectForKey:kRStreamMomentShowGmtCreate];
    self.momentId = [aDecoder decodeDoubleForKey:kRStreamMomentMomentId];
    self.type = [aDecoder decodeDoubleForKey:kRStreamMomentType];
    self.imgs = [aDecoder decodeObjectForKey:kRStreamMomentImgs];
    self.displayRegion = [aDecoder decodeObjectForKey:kRStreamMomentDisplayRegion];
    self.userInfo = [aDecoder decodeObjectForKey:kRStreamMomentUserInfo];
    self.comments = [aDecoder decodeObjectForKey:kRStreamMomentComments];
    self.redirectType = [aDecoder decodeDoubleForKey:kRStreamMomentRedirectType];
    self.relatedMoments = [aDecoder decodeObjectForKey:kRStreamMomentRelatedMoments];
    self.iid = [aDecoder decodeDoubleForKey:kRStreamMomentIid];
    self.commentCount = [aDecoder decodeObjectForKey:kRStreamMomentCommentCount];
    self.content = [aDecoder decodeObjectForKey:kRStreamMomentContent];
    self.literalCircles = [aDecoder decodeObjectForKey:kRStreamMomentLiteralCircles];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_isSticky forKey:kRStreamMomentIsSticky];
    [aCoder encodeObject:_parseUrls forKey:kRStreamMomentParseUrls];
    [aCoder encodeDouble:_gmtCreate forKey:kRStreamMomentGmtCreate];
    [aCoder encodeObject:_literalAts forKey:kRStreamMomentLiteralAts];
    [aCoder encodeObject:_momentTags forKey:kRStreamMomentMomentTags];
    [aCoder encodeDouble:_likeCount forKey:kRStreamMomentLikeCount];
    [aCoder encodeObject:_contentTag forKey:kRStreamMomentContentTag];
    [aCoder encodeDouble:_isLiked forKey:kRStreamMomentIsLiked];
    [aCoder encodeObject:_showGmtCreate forKey:kRStreamMomentShowGmtCreate];
    [aCoder encodeDouble:_momentId forKey:kRStreamMomentMomentId];
    [aCoder encodeDouble:_type forKey:kRStreamMomentType];
    [aCoder encodeObject:_imgs forKey:kRStreamMomentImgs];
    [aCoder encodeObject:_displayRegion forKey:kRStreamMomentDisplayRegion];
    [aCoder encodeObject:_userInfo forKey:kRStreamMomentUserInfo];
    [aCoder encodeObject:_comments forKey:kRStreamMomentComments];
    [aCoder encodeDouble:_redirectType forKey:kRStreamMomentRedirectType];
    [aCoder encodeObject:_relatedMoments forKey:kRStreamMomentRelatedMoments];
    [aCoder encodeDouble:_iid forKey:kRStreamMomentIid];
    [aCoder encodeObject:_commentCount forKey:kRStreamMomentCommentCount];
    [aCoder encodeObject:_content forKey:kRStreamMomentContent];
    [aCoder encodeObject:_literalCircles forKey:kRStreamMomentLiteralCircles];
}

- (id)copyWithZone:(NSZone *)zone
{
    RStreamMoment *copy = [[RStreamMoment alloc] init];
    
    if (copy) {

        copy.isSticky = self.isSticky;
        copy.parseUrls = [self.parseUrls copyWithZone:zone];
        copy.gmtCreate = self.gmtCreate;
        copy.literalAts = [self.literalAts copyWithZone:zone];
        copy.momentTags = [self.momentTags copyWithZone:zone];
        copy.likeCount = self.likeCount;
        copy.contentTag = [self.contentTag copyWithZone:zone];
        copy.isLiked = self.isLiked;
        copy.showGmtCreate = [self.showGmtCreate copyWithZone:zone];
        copy.momentId = self.momentId;
        copy.type = self.type;
        copy.imgs = [self.imgs copyWithZone:zone];
        copy.displayRegion = [self.displayRegion copyWithZone:zone];
        copy.userInfo = [self.userInfo copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.redirectType = self.redirectType;
        copy.relatedMoments = [self.relatedMoments copyWithZone:zone];
        copy.iid = self.iid;
        copy.commentCount = [self.commentCount copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.literalCircles = [self.literalCircles copyWithZone:zone];
    }
    
    return copy;
}


@end

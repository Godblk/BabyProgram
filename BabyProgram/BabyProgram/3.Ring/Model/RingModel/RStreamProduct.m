//
//  RStreamProduct.m
//
//  Created by zgt  on 16/3/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RStreamProduct.h"
#import "RImgs.h"
#import "RUserInfo.h"


NSString *const kRStreamProductIsBuyable = @"is_buyable";
NSString *const kRStreamProductIsSticky = @"is_sticky";
NSString *const kRStreamProductParseUrls = @"parse_urls";
NSString *const kRStreamProductGmtCreate = @"gmt_create";
NSString *const kRStreamProductLiteralAts = @"literal_ats";
NSString *const kRStreamProductMomentTags = @"moment_tags";
NSString *const kRStreamProductShowPrice = @"show_price";
NSString *const kRStreamProductContentTag = @"content_tag";
NSString *const kRStreamProductIsLiked = @"is_liked";
NSString *const kRStreamProductShowGmtCreate = @"show_gmt_create";
NSString *const kRStreamProductLikeCount = @"like_count";
NSString *const kRStreamProductMomentId = @"moment_id";
NSString *const kRStreamProductType = @"type";
NSString *const kRStreamProductImgs = @"imgs";
NSString *const kRStreamProductDisplayRegion = @"display_region";
NSString *const kRStreamProductUserInfo = @"user_info";
NSString *const kRStreamProductComments = @"comments";
NSString *const kRStreamProductRedirectType = @"redirect_type";
NSString *const kRStreamProductRelatedMoments = @"related_moments";
NSString *const kRStreamProductLiteralCircles = @"literal_circles";
NSString *const kRStreamProductIid = @"iid";
NSString *const kRStreamProductContent = @"content";
NSString *const kRStreamProductCommentCount = @"comment_count";


@interface RStreamProduct ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RStreamProduct

@synthesize isBuyable = _isBuyable;
@synthesize isSticky = _isSticky;
@synthesize parseUrls = _parseUrls;
@synthesize gmtCreate = _gmtCreate;
@synthesize literalAts = _literalAts;
@synthesize momentTags = _momentTags;
@synthesize showPrice = _showPrice;
@synthesize contentTag = _contentTag;
@synthesize isLiked = _isLiked;
@synthesize showGmtCreate = _showGmtCreate;
@synthesize likeCount = _likeCount;
@synthesize momentId = _momentId;
@synthesize type = _type;
@synthesize imgs = _imgs;
@synthesize displayRegion = _displayRegion;
@synthesize userInfo = _userInfo;
@synthesize comments = _comments;
@synthesize redirectType = _redirectType;
@synthesize relatedMoments = _relatedMoments;
@synthesize literalCircles = _literalCircles;
@synthesize iid = _iid;
@synthesize content = _content;
@synthesize commentCount = _commentCount;


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
            self.isBuyable = [[self objectOrNilForKey:kRStreamProductIsBuyable fromDictionary:dict] boolValue];
            self.isSticky = [[self objectOrNilForKey:kRStreamProductIsSticky fromDictionary:dict] boolValue];
            self.parseUrls = [self objectOrNilForKey:kRStreamProductParseUrls fromDictionary:dict];
            self.gmtCreate = [[self objectOrNilForKey:kRStreamProductGmtCreate fromDictionary:dict] doubleValue];
            self.literalAts = [self objectOrNilForKey:kRStreamProductLiteralAts fromDictionary:dict];
            self.momentTags = [self objectOrNilForKey:kRStreamProductMomentTags fromDictionary:dict];
            self.showPrice = [self objectOrNilForKey:kRStreamProductShowPrice fromDictionary:dict];
            self.contentTag = [self objectOrNilForKey:kRStreamProductContentTag fromDictionary:dict];
            self.isLiked = [[self objectOrNilForKey:kRStreamProductIsLiked fromDictionary:dict] doubleValue];
            self.showGmtCreate = [self objectOrNilForKey:kRStreamProductShowGmtCreate fromDictionary:dict];
            self.likeCount = [[self objectOrNilForKey:kRStreamProductLikeCount fromDictionary:dict] doubleValue];
            self.momentId = [[self objectOrNilForKey:kRStreamProductMomentId fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kRStreamProductType fromDictionary:dict] doubleValue];
    NSObject *receivedRImgs = [dict objectForKey:kRStreamProductImgs];
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
            self.displayRegion = [self objectOrNilForKey:kRStreamProductDisplayRegion fromDictionary:dict];
            self.userInfo = [RUserInfo modelObjectWithDictionary:[dict objectForKey:kRStreamProductUserInfo]];
            self.comments = [self objectOrNilForKey:kRStreamProductComments fromDictionary:dict];
            self.redirectType = [[self objectOrNilForKey:kRStreamProductRedirectType fromDictionary:dict] doubleValue];
            self.relatedMoments = [self objectOrNilForKey:kRStreamProductRelatedMoments fromDictionary:dict];
            self.literalCircles = [self objectOrNilForKey:kRStreamProductLiteralCircles fromDictionary:dict];
            self.iid = [[self objectOrNilForKey:kRStreamProductIid fromDictionary:dict] doubleValue];
            self.content = [self objectOrNilForKey:kRStreamProductContent fromDictionary:dict];
            self.commentCount = [self objectOrNilForKey:kRStreamProductCommentCount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.isBuyable] forKey:kRStreamProductIsBuyable];
    [mutableDict setValue:[NSNumber numberWithBool:self.isSticky] forKey:kRStreamProductIsSticky];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForParseUrls] forKey:kRStreamProductParseUrls];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gmtCreate] forKey:kRStreamProductGmtCreate];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLiteralAts] forKey:kRStreamProductLiteralAts];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMomentTags] forKey:kRStreamProductMomentTags];
    [mutableDict setValue:self.showPrice forKey:kRStreamProductShowPrice];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForContentTag] forKey:kRStreamProductContentTag];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isLiked] forKey:kRStreamProductIsLiked];
    [mutableDict setValue:self.showGmtCreate forKey:kRStreamProductShowGmtCreate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likeCount] forKey:kRStreamProductLikeCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.momentId] forKey:kRStreamProductMomentId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kRStreamProductType];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImgs] forKey:kRStreamProductImgs];
    [mutableDict setValue:self.displayRegion forKey:kRStreamProductDisplayRegion];
    [mutableDict setValue:[self.userInfo dictionaryRepresentation] forKey:kRStreamProductUserInfo];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForComments] forKey:kRStreamProductComments];
    [mutableDict setValue:[NSNumber numberWithDouble:self.redirectType] forKey:kRStreamProductRedirectType];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRelatedMoments] forKey:kRStreamProductRelatedMoments];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLiteralCircles] forKey:kRStreamProductLiteralCircles];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iid] forKey:kRStreamProductIid];
    [mutableDict setValue:self.content forKey:kRStreamProductContent];
    [mutableDict setValue:self.commentCount forKey:kRStreamProductCommentCount];

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

    self.isBuyable = [aDecoder decodeBoolForKey:kRStreamProductIsBuyable];
    self.isSticky = [aDecoder decodeBoolForKey:kRStreamProductIsSticky];
    self.parseUrls = [aDecoder decodeObjectForKey:kRStreamProductParseUrls];
    self.gmtCreate = [aDecoder decodeDoubleForKey:kRStreamProductGmtCreate];
    self.literalAts = [aDecoder decodeObjectForKey:kRStreamProductLiteralAts];
    self.momentTags = [aDecoder decodeObjectForKey:kRStreamProductMomentTags];
    self.showPrice = [aDecoder decodeObjectForKey:kRStreamProductShowPrice];
    self.contentTag = [aDecoder decodeObjectForKey:kRStreamProductContentTag];
    self.isLiked = [aDecoder decodeDoubleForKey:kRStreamProductIsLiked];
    self.showGmtCreate = [aDecoder decodeObjectForKey:kRStreamProductShowGmtCreate];
    self.likeCount = [aDecoder decodeDoubleForKey:kRStreamProductLikeCount];
    self.momentId = [aDecoder decodeDoubleForKey:kRStreamProductMomentId];
    self.type = [aDecoder decodeDoubleForKey:kRStreamProductType];
    self.imgs = [aDecoder decodeObjectForKey:kRStreamProductImgs];
    self.displayRegion = [aDecoder decodeObjectForKey:kRStreamProductDisplayRegion];
    self.userInfo = [aDecoder decodeObjectForKey:kRStreamProductUserInfo];
    self.comments = [aDecoder decodeObjectForKey:kRStreamProductComments];
    self.redirectType = [aDecoder decodeDoubleForKey:kRStreamProductRedirectType];
    self.relatedMoments = [aDecoder decodeObjectForKey:kRStreamProductRelatedMoments];
    self.literalCircles = [aDecoder decodeObjectForKey:kRStreamProductLiteralCircles];
    self.iid = [aDecoder decodeDoubleForKey:kRStreamProductIid];
    self.content = [aDecoder decodeObjectForKey:kRStreamProductContent];
    self.commentCount = [aDecoder decodeObjectForKey:kRStreamProductCommentCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_isBuyable forKey:kRStreamProductIsBuyable];
    [aCoder encodeBool:_isSticky forKey:kRStreamProductIsSticky];
    [aCoder encodeObject:_parseUrls forKey:kRStreamProductParseUrls];
    [aCoder encodeDouble:_gmtCreate forKey:kRStreamProductGmtCreate];
    [aCoder encodeObject:_literalAts forKey:kRStreamProductLiteralAts];
    [aCoder encodeObject:_momentTags forKey:kRStreamProductMomentTags];
    [aCoder encodeObject:_showPrice forKey:kRStreamProductShowPrice];
    [aCoder encodeObject:_contentTag forKey:kRStreamProductContentTag];
    [aCoder encodeDouble:_isLiked forKey:kRStreamProductIsLiked];
    [aCoder encodeObject:_showGmtCreate forKey:kRStreamProductShowGmtCreate];
    [aCoder encodeDouble:_likeCount forKey:kRStreamProductLikeCount];
    [aCoder encodeDouble:_momentId forKey:kRStreamProductMomentId];
    [aCoder encodeDouble:_type forKey:kRStreamProductType];
    [aCoder encodeObject:_imgs forKey:kRStreamProductImgs];
    [aCoder encodeObject:_displayRegion forKey:kRStreamProductDisplayRegion];
    [aCoder encodeObject:_userInfo forKey:kRStreamProductUserInfo];
    [aCoder encodeObject:_comments forKey:kRStreamProductComments];
    [aCoder encodeDouble:_redirectType forKey:kRStreamProductRedirectType];
    [aCoder encodeObject:_relatedMoments forKey:kRStreamProductRelatedMoments];
    [aCoder encodeObject:_literalCircles forKey:kRStreamProductLiteralCircles];
    [aCoder encodeDouble:_iid forKey:kRStreamProductIid];
    [aCoder encodeObject:_content forKey:kRStreamProductContent];
    [aCoder encodeObject:_commentCount forKey:kRStreamProductCommentCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    RStreamProduct *copy = [[RStreamProduct alloc] init];
    
    if (copy) {

        copy.isBuyable = self.isBuyable;
        copy.isSticky = self.isSticky;
        copy.parseUrls = [self.parseUrls copyWithZone:zone];
        copy.gmtCreate = self.gmtCreate;
        copy.literalAts = [self.literalAts copyWithZone:zone];
        copy.momentTags = [self.momentTags copyWithZone:zone];
        copy.showPrice = [self.showPrice copyWithZone:zone];
        copy.contentTag = [self.contentTag copyWithZone:zone];
        copy.isLiked = self.isLiked;
        copy.showGmtCreate = [self.showGmtCreate copyWithZone:zone];
        copy.likeCount = self.likeCount;
        copy.momentId = self.momentId;
        copy.type = self.type;
        copy.imgs = [self.imgs copyWithZone:zone];
        copy.displayRegion = [self.displayRegion copyWithZone:zone];
        copy.userInfo = [self.userInfo copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.redirectType = self.redirectType;
        copy.relatedMoments = [self.relatedMoments copyWithZone:zone];
        copy.literalCircles = [self.literalCircles copyWithZone:zone];
        copy.iid = self.iid;
        copy.content = [self.content copyWithZone:zone];
        copy.commentCount = [self.commentCount copyWithZone:zone];
    }
    
    return copy;
}


@end

//
//  RComments.m
//
//  Created by zgt  on 16/3/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RComments.h"


NSString *const kRCommentsId = @"id";
NSString *const kRCommentsContent = @"content";
NSString *const kRCommentsUid = @"uid";
NSString *const kRCommentsParentUid = @"parent_uid";
NSString *const kRCommentsParentId = @"parent_id";
NSString *const kRCommentsGmtCreate = @"gmt_create";
NSString *const kRCommentsType = @"type";
NSString *const kRCommentsCorrelationId = @"correlation_id";
NSString *const kRCommentsNicks = @"nicks";
NSString *const kRCommentsGmtModified = @"gmt_modified";
NSString *const kRCommentsReviewStatus = @"review_status";
NSString *const kRCommentsStatus = @"status";
NSString *const kRCommentsCorrelationType = @"correlation_type";


@interface RComments ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RComments

@synthesize commentsIdentifier = _commentsIdentifier;
@synthesize content = _content;
@synthesize uid = _uid;
@synthesize parentUid = _parentUid;
@synthesize parentId = _parentId;
@synthesize gmtCreate = _gmtCreate;
@synthesize type = _type;
@synthesize correlationId = _correlationId;
@synthesize nicks = _nicks;
@synthesize gmtModified = _gmtModified;
@synthesize reviewStatus = _reviewStatus;
@synthesize status = _status;
@synthesize correlationType = _correlationType;


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
            self.commentsIdentifier = [[self objectOrNilForKey:kRCommentsId fromDictionary:dict] doubleValue];
            self.content = [self objectOrNilForKey:kRCommentsContent fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kRCommentsUid fromDictionary:dict];
            self.parentUid = [self objectOrNilForKey:kRCommentsParentUid fromDictionary:dict];
            self.parentId = [[self objectOrNilForKey:kRCommentsParentId fromDictionary:dict] doubleValue];
            self.gmtCreate = [[self objectOrNilForKey:kRCommentsGmtCreate fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kRCommentsType fromDictionary:dict] doubleValue];
            self.correlationId = [[self objectOrNilForKey:kRCommentsCorrelationId fromDictionary:dict] doubleValue];
            self.nicks = [self objectOrNilForKey:kRCommentsNicks fromDictionary:dict];
            self.gmtModified = [[self objectOrNilForKey:kRCommentsGmtModified fromDictionary:dict] doubleValue];
            self.reviewStatus = [[self objectOrNilForKey:kRCommentsReviewStatus fromDictionary:dict] doubleValue];
            self.status = [[self objectOrNilForKey:kRCommentsStatus fromDictionary:dict] doubleValue];
            self.correlationType = [[self objectOrNilForKey:kRCommentsCorrelationType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsIdentifier] forKey:kRCommentsId];
    [mutableDict setValue:self.content forKey:kRCommentsContent];
    [mutableDict setValue:self.uid forKey:kRCommentsUid];
    [mutableDict setValue:self.parentUid forKey:kRCommentsParentUid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.parentId] forKey:kRCommentsParentId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gmtCreate] forKey:kRCommentsGmtCreate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kRCommentsType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.correlationId] forKey:kRCommentsCorrelationId];
    NSMutableArray *tempArrayForNicks = [NSMutableArray array];
    for (NSObject *subArrayObject in self.nicks) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForNicks addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForNicks addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForNicks] forKey:kRCommentsNicks];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gmtModified] forKey:kRCommentsGmtModified];
    [mutableDict setValue:[NSNumber numberWithDouble:self.reviewStatus] forKey:kRCommentsReviewStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kRCommentsStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.correlationType] forKey:kRCommentsCorrelationType];

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

    self.commentsIdentifier = [aDecoder decodeDoubleForKey:kRCommentsId];
    self.content = [aDecoder decodeObjectForKey:kRCommentsContent];
    self.uid = [aDecoder decodeObjectForKey:kRCommentsUid];
    self.parentUid = [aDecoder decodeObjectForKey:kRCommentsParentUid];
    self.parentId = [aDecoder decodeDoubleForKey:kRCommentsParentId];
    self.gmtCreate = [aDecoder decodeDoubleForKey:kRCommentsGmtCreate];
    self.type = [aDecoder decodeDoubleForKey:kRCommentsType];
    self.correlationId = [aDecoder decodeDoubleForKey:kRCommentsCorrelationId];
    self.nicks = [aDecoder decodeObjectForKey:kRCommentsNicks];
    self.gmtModified = [aDecoder decodeDoubleForKey:kRCommentsGmtModified];
    self.reviewStatus = [aDecoder decodeDoubleForKey:kRCommentsReviewStatus];
    self.status = [aDecoder decodeDoubleForKey:kRCommentsStatus];
    self.correlationType = [aDecoder decodeDoubleForKey:kRCommentsCorrelationType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_commentsIdentifier forKey:kRCommentsId];
    [aCoder encodeObject:_content forKey:kRCommentsContent];
    [aCoder encodeObject:_uid forKey:kRCommentsUid];
    [aCoder encodeObject:_parentUid forKey:kRCommentsParentUid];
    [aCoder encodeDouble:_parentId forKey:kRCommentsParentId];
    [aCoder encodeDouble:_gmtCreate forKey:kRCommentsGmtCreate];
    [aCoder encodeDouble:_type forKey:kRCommentsType];
    [aCoder encodeDouble:_correlationId forKey:kRCommentsCorrelationId];
    [aCoder encodeObject:_nicks forKey:kRCommentsNicks];
    [aCoder encodeDouble:_gmtModified forKey:kRCommentsGmtModified];
    [aCoder encodeDouble:_reviewStatus forKey:kRCommentsReviewStatus];
    [aCoder encodeDouble:_status forKey:kRCommentsStatus];
    [aCoder encodeDouble:_correlationType forKey:kRCommentsCorrelationType];
}

- (id)copyWithZone:(NSZone *)zone
{
    RComments *copy = [[RComments alloc] init];
    
    if (copy) {

        copy.commentsIdentifier = self.commentsIdentifier;
        copy.content = [self.content copyWithZone:zone];
        copy.uid = [self.uid copyWithZone:zone];
        copy.parentUid = [self.parentUid copyWithZone:zone];
        copy.parentId = self.parentId;
        copy.gmtCreate = self.gmtCreate;
        copy.type = self.type;
        copy.correlationId = self.correlationId;
        copy.nicks = [self.nicks copyWithZone:zone];
        copy.gmtModified = self.gmtModified;
        copy.reviewStatus = self.reviewStatus;
        copy.status = self.status;
        copy.correlationType = self.correlationType;
    }
    
    return copy;
}


@end

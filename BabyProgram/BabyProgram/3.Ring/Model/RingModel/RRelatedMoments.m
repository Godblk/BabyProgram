//
//  RRelatedMoments.m
//
//  Created by zgt  on 16/3/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RRelatedMoments.h"


NSString *const kRRelatedMomentsImg = @"img";
NSString *const kRRelatedMomentsShowPrice = @"show_price";
NSString *const kRRelatedMomentsMomentType = @"moment_type";
NSString *const kRRelatedMomentsIid = @"iid";
NSString *const kRRelatedMomentsTitle = @"title";
NSString *const kRRelatedMomentsMomentId = @"moment_id";
NSString *const kRRelatedMomentsRedirectType = @"redirect_type";


@interface RRelatedMoments ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RRelatedMoments

@synthesize img = _img;
@synthesize showPrice = _showPrice;
@synthesize momentType = _momentType;
@synthesize iid = _iid;
@synthesize title = _title;
@synthesize momentId = _momentId;
@synthesize redirectType = _redirectType;


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
            self.img = [self objectOrNilForKey:kRRelatedMomentsImg fromDictionary:dict];
            self.showPrice = [self objectOrNilForKey:kRRelatedMomentsShowPrice fromDictionary:dict];
            self.momentType = [self objectOrNilForKey:kRRelatedMomentsMomentType fromDictionary:dict];
            self.iid = [[self objectOrNilForKey:kRRelatedMomentsIid fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kRRelatedMomentsTitle fromDictionary:dict];
            self.momentId = [self objectOrNilForKey:kRRelatedMomentsMomentId fromDictionary:dict];
            self.redirectType = [[self objectOrNilForKey:kRRelatedMomentsRedirectType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.img forKey:kRRelatedMomentsImg];
    [mutableDict setValue:self.showPrice forKey:kRRelatedMomentsShowPrice];
    [mutableDict setValue:self.momentType forKey:kRRelatedMomentsMomentType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iid] forKey:kRRelatedMomentsIid];
    [mutableDict setValue:self.title forKey:kRRelatedMomentsTitle];
    [mutableDict setValue:self.momentId forKey:kRRelatedMomentsMomentId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.redirectType] forKey:kRRelatedMomentsRedirectType];

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

    self.img = [aDecoder decodeObjectForKey:kRRelatedMomentsImg];
    self.showPrice = [aDecoder decodeObjectForKey:kRRelatedMomentsShowPrice];
    self.momentType = [aDecoder decodeObjectForKey:kRRelatedMomentsMomentType];
    self.iid = [aDecoder decodeDoubleForKey:kRRelatedMomentsIid];
    self.title = [aDecoder decodeObjectForKey:kRRelatedMomentsTitle];
    self.momentId = [aDecoder decodeObjectForKey:kRRelatedMomentsMomentId];
    self.redirectType = [aDecoder decodeDoubleForKey:kRRelatedMomentsRedirectType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_img forKey:kRRelatedMomentsImg];
    [aCoder encodeObject:_showPrice forKey:kRRelatedMomentsShowPrice];
    [aCoder encodeObject:_momentType forKey:kRRelatedMomentsMomentType];
    [aCoder encodeDouble:_iid forKey:kRRelatedMomentsIid];
    [aCoder encodeObject:_title forKey:kRRelatedMomentsTitle];
    [aCoder encodeObject:_momentId forKey:kRRelatedMomentsMomentId];
    [aCoder encodeDouble:_redirectType forKey:kRRelatedMomentsRedirectType];
}

- (id)copyWithZone:(NSZone *)zone
{
    RRelatedMoments *copy = [[RRelatedMoments alloc] init];
    
    if (copy) {

        copy.img = [self.img copyWithZone:zone];
        copy.showPrice = [self.showPrice copyWithZone:zone];
        copy.momentType = [self.momentType copyWithZone:zone];
        copy.iid = self.iid;
        copy.title = [self.title copyWithZone:zone];
        copy.momentId = [self.momentId copyWithZone:zone];
        copy.redirectType = self.redirectType;
    }
    
    return copy;
}


@end

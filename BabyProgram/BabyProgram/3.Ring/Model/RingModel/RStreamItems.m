//
//  RStreamItems.m
//
//  Created by zgt  on 16/3/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RStreamItems.h"
#import "RStreamMoment.h"
#import "RStreamProduct.h"


NSString *const kRStreamItemsStreamMoment = @"stream_moment";
NSString *const kRStreamItemsStreamProduct = @"stream_product";
NSString *const kRStreamItemsRenderType = @"render_type";
NSString *const kRStreamItemsMomentId = @"moment_id";


@interface RStreamItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RStreamItems

@synthesize streamMoment = _streamMoment;
@synthesize streamProduct = _streamProduct;
@synthesize renderType = _renderType;
@synthesize momentId = _momentId;


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
            self.streamMoment = [RStreamMoment modelObjectWithDictionary:[dict objectForKey:kRStreamItemsStreamMoment]];
            self.streamProduct = [RStreamProduct modelObjectWithDictionary:[dict objectForKey:kRStreamItemsStreamProduct]];
            self.renderType = [[self objectOrNilForKey:kRStreamItemsRenderType fromDictionary:dict] doubleValue];
            self.momentId = [[self objectOrNilForKey:kRStreamItemsMomentId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.streamMoment dictionaryRepresentation] forKey:kRStreamItemsStreamMoment];
    [mutableDict setValue:[self.streamProduct dictionaryRepresentation] forKey:kRStreamItemsStreamProduct];
    [mutableDict setValue:[NSNumber numberWithDouble:self.renderType] forKey:kRStreamItemsRenderType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.momentId] forKey:kRStreamItemsMomentId];

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

    self.streamMoment = [aDecoder decodeObjectForKey:kRStreamItemsStreamMoment];
    self.streamProduct = [aDecoder decodeObjectForKey:kRStreamItemsStreamProduct];
    self.renderType = [aDecoder decodeDoubleForKey:kRStreamItemsRenderType];
    self.momentId = [aDecoder decodeDoubleForKey:kRStreamItemsMomentId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_streamMoment forKey:kRStreamItemsStreamMoment];
    [aCoder encodeObject:_streamProduct forKey:kRStreamItemsStreamProduct];
    [aCoder encodeDouble:_renderType forKey:kRStreamItemsRenderType];
    [aCoder encodeDouble:_momentId forKey:kRStreamItemsMomentId];
}

- (id)copyWithZone:(NSZone *)zone
{
    RStreamItems *copy = [[RStreamItems alloc] init];
    
    if (copy) {

        copy.streamMoment = [self.streamMoment copyWithZone:zone];
        copy.streamProduct = [self.streamProduct copyWithZone:zone];
        copy.renderType = self.renderType;
        copy.momentId = self.momentId;
    }
    
    return copy;
}


@end

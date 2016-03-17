//
//  RImgs.m
//
//  Created by zgt  on 16/3/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RImgs.h"


NSString *const kRImgsImgId = @"img_id";
NSString *const kRImgsUrl = @"url";


@interface RImgs ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RImgs

@synthesize imgId = _imgId;
@synthesize url = _url;


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
            self.imgId = [self objectOrNilForKey:kRImgsImgId fromDictionary:dict];
            self.url = [self objectOrNilForKey:kRImgsUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.imgId forKey:kRImgsImgId];
    [mutableDict setValue:self.url forKey:kRImgsUrl];

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

    self.imgId = [aDecoder decodeObjectForKey:kRImgsImgId];
    self.url = [aDecoder decodeObjectForKey:kRImgsUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_imgId forKey:kRImgsImgId];
    [aCoder encodeObject:_url forKey:kRImgsUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    RImgs *copy = [[RImgs alloc] init];
    
    if (copy) {

        copy.imgId = [self.imgId copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end

//
//  BBrandModel.m
//
//  Created by zgt  on 16/3/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BBrandModel.h"
#import "BMsNames.h"


NSString *const kBBrandModelMsNames = @"ms_names";


@interface BBrandModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BBrandModel

@synthesize msNames = _msNames;


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
    NSObject *receivedBMsNames = [dict objectForKey:kBBrandModelMsNames];
    NSMutableArray *parsedBMsNames = [NSMutableArray array];
    if ([receivedBMsNames isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBMsNames) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBMsNames addObject:[BMsNames modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBMsNames isKindOfClass:[NSDictionary class]]) {
       [parsedBMsNames addObject:[BMsNames modelObjectWithDictionary:(NSDictionary *)receivedBMsNames]];
    }

    self.msNames = [NSArray arrayWithArray:parsedBMsNames];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForMsNames = [NSMutableArray array];
    for (NSObject *subArrayObject in self.msNames) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMsNames addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMsNames addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMsNames] forKey:kBBrandModelMsNames];

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

    self.msNames = [aDecoder decodeObjectForKey:kBBrandModelMsNames];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_msNames forKey:kBBrandModelMsNames];
}

- (id)copyWithZone:(NSZone *)zone
{
    BBrandModel *copy = [[BBrandModel alloc] init];
    
    if (copy) {

        copy.msNames = [self.msNames copyWithZone:zone];
    }
    
    return copy;
}


@end

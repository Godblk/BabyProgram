//
//  RLiteralCircles.m
//
//  Created by zgt  on 16/3/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RLiteralCircles.h"


NSString *const kRLiteralCirclesName = @"name";
NSString *const kRLiteralCirclesObjId = @"obj_id";


@interface RLiteralCircles ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RLiteralCircles

@synthesize name = _name;
@synthesize objId = _objId;


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
            self.name = [self objectOrNilForKey:kRLiteralCirclesName fromDictionary:dict];
            self.objId = [[self objectOrNilForKey:kRLiteralCirclesObjId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kRLiteralCirclesName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.objId] forKey:kRLiteralCirclesObjId];

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

    self.name = [aDecoder decodeObjectForKey:kRLiteralCirclesName];
    self.objId = [aDecoder decodeDoubleForKey:kRLiteralCirclesObjId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kRLiteralCirclesName];
    [aCoder encodeDouble:_objId forKey:kRLiteralCirclesObjId];
}

- (id)copyWithZone:(NSZone *)zone
{
    RLiteralCircles *copy = [[RLiteralCircles alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.objId = self.objId;
    }
    
    return copy;
}


@end

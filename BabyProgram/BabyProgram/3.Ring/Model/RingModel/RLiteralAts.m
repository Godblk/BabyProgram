//
//  RLiteralAts.m
//
//  Created by zgt  on 16/3/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RLiteralAts.h"


NSString *const kRLiteralAtsName = @"name";
NSString *const kRLiteralAtsObjId = @"obj_id";


@interface RLiteralAts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RLiteralAts

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
            self.name = [self objectOrNilForKey:kRLiteralAtsName fromDictionary:dict];
            self.objId = [[self objectOrNilForKey:kRLiteralAtsObjId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kRLiteralAtsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.objId] forKey:kRLiteralAtsObjId];

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

    self.name = [aDecoder decodeObjectForKey:kRLiteralAtsName];
    self.objId = [aDecoder decodeDoubleForKey:kRLiteralAtsObjId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kRLiteralAtsName];
    [aCoder encodeDouble:_objId forKey:kRLiteralAtsObjId];
}

- (id)copyWithZone:(NSZone *)zone
{
    RLiteralAts *copy = [[RLiteralAts alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.objId = self.objId;
    }
    
    return copy;
}


@end

//
//  SBlocks.m
//
//  Created by zgt  on 16/3/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SBlocks.h"
#import "SSubdivisionCategorys.h"


NSString *const kSBlocksBlockName = @"block_name";
NSString *const kSBlocksSubdivisionCategorys = @"subdivision_categorys";


@interface SBlocks ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SBlocks

@synthesize blockName = _blockName;
@synthesize subdivisionCategorys = _subdivisionCategorys;


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
            self.blockName = [self objectOrNilForKey:kSBlocksBlockName fromDictionary:dict];
    NSObject *receivedSSubdivisionCategorys = [dict objectForKey:kSBlocksSubdivisionCategorys];
    NSMutableArray *parsedSSubdivisionCategorys = [NSMutableArray array];
    if ([receivedSSubdivisionCategorys isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSSubdivisionCategorys) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSSubdivisionCategorys addObject:[SSubdivisionCategorys modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSSubdivisionCategorys isKindOfClass:[NSDictionary class]]) {
       [parsedSSubdivisionCategorys addObject:[SSubdivisionCategorys modelObjectWithDictionary:(NSDictionary *)receivedSSubdivisionCategorys]];
    }

    self.subdivisionCategorys = [NSArray arrayWithArray:parsedSSubdivisionCategorys];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.blockName forKey:kSBlocksBlockName];
    NSMutableArray *tempArrayForSubdivisionCategorys = [NSMutableArray array];
    for (NSObject *subArrayObject in self.subdivisionCategorys) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSubdivisionCategorys addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSubdivisionCategorys addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSubdivisionCategorys] forKey:kSBlocksSubdivisionCategorys];

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

    self.blockName = [aDecoder decodeObjectForKey:kSBlocksBlockName];
    self.subdivisionCategorys = [aDecoder decodeObjectForKey:kSBlocksSubdivisionCategorys];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_blockName forKey:kSBlocksBlockName];
    [aCoder encodeObject:_subdivisionCategorys forKey:kSBlocksSubdivisionCategorys];
}

- (id)copyWithZone:(NSZone *)zone
{
    SBlocks *copy = [[SBlocks alloc] init];
    
    if (copy) {

        copy.blockName = [self.blockName copyWithZone:zone];
        copy.subdivisionCategorys = [self.subdivisionCategorys copyWithZone:zone];
    }
    
    return copy;
}


@end

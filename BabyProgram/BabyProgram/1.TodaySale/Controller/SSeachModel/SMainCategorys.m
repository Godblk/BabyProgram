//
//  SMainCategorys.m
//
//  Created by zgt  on 16/3/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SMainCategorys.h"
#import "SBlocks.h"


NSString *const kSMainCategorysCategoryName = @"category_name";
NSString *const kSMainCategorysBlocks = @"blocks";


@interface SMainCategorys ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SMainCategorys

@synthesize categoryName = _categoryName;
@synthesize blocks = _blocks;


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
            self.categoryName = [self objectOrNilForKey:kSMainCategorysCategoryName fromDictionary:dict];
    NSObject *receivedSBlocks = [dict objectForKey:kSMainCategorysBlocks];
    NSMutableArray *parsedSBlocks = [NSMutableArray array];
    if ([receivedSBlocks isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSBlocks) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSBlocks addObject:[SBlocks modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSBlocks isKindOfClass:[NSDictionary class]]) {
       [parsedSBlocks addObject:[SBlocks modelObjectWithDictionary:(NSDictionary *)receivedSBlocks]];
    }

    self.blocks = [NSArray arrayWithArray:parsedSBlocks];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.categoryName forKey:kSMainCategorysCategoryName];
    NSMutableArray *tempArrayForBlocks = [NSMutableArray array];
    for (NSObject *subArrayObject in self.blocks) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBlocks addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBlocks addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBlocks] forKey:kSMainCategorysBlocks];

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

    self.categoryName = [aDecoder decodeObjectForKey:kSMainCategorysCategoryName];
    self.blocks = [aDecoder decodeObjectForKey:kSMainCategorysBlocks];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_categoryName forKey:kSMainCategorysCategoryName];
    [aCoder encodeObject:_blocks forKey:kSMainCategorysBlocks];
}

- (id)copyWithZone:(NSZone *)zone
{
    SMainCategorys *copy = [[SMainCategorys alloc] init];
    
    if (copy) {

        copy.categoryName = [self.categoryName copyWithZone:zone];
        copy.blocks = [self.blocks copyWithZone:zone];
    }
    
    return copy;
}


@end

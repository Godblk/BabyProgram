//
//  SSeachModel.m
//
//  Created by zgt  on 16/3/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SSeachModel.h"
#import "SMainCategorys.h"


NSString *const kSSeachModelSuccess = @"success";
NSString *const kSSeachModelHiddenSearchBar = @"hidden_search_bar";
NSString *const kSSeachModelSearchTip = @"search_tip";
NSString *const kSSeachModelMainCategorys = @"main_categorys";
NSString *const kSSeachModelKeyword = @"keyword";


@interface SSeachModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SSeachModel

@synthesize success = _success;
@synthesize hiddenSearchBar = _hiddenSearchBar;
@synthesize searchTip = _searchTip;
@synthesize mainCategorys = _mainCategorys;
@synthesize keyword = _keyword;


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
            self.success = [[self objectOrNilForKey:kSSeachModelSuccess fromDictionary:dict] boolValue];
            self.hiddenSearchBar = [[self objectOrNilForKey:kSSeachModelHiddenSearchBar fromDictionary:dict] boolValue];
            self.searchTip = [self objectOrNilForKey:kSSeachModelSearchTip fromDictionary:dict];
    NSObject *receivedSMainCategorys = [dict objectForKey:kSSeachModelMainCategorys];
    NSMutableArray *parsedSMainCategorys = [NSMutableArray array];
    if ([receivedSMainCategorys isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSMainCategorys) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSMainCategorys addObject:[SMainCategorys modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSMainCategorys isKindOfClass:[NSDictionary class]]) {
       [parsedSMainCategorys addObject:[SMainCategorys modelObjectWithDictionary:(NSDictionary *)receivedSMainCategorys]];
    }

    self.mainCategorys = [NSArray arrayWithArray:parsedSMainCategorys];
            self.keyword = [self objectOrNilForKey:kSSeachModelKeyword fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kSSeachModelSuccess];
    [mutableDict setValue:[NSNumber numberWithBool:self.hiddenSearchBar] forKey:kSSeachModelHiddenSearchBar];
    [mutableDict setValue:self.searchTip forKey:kSSeachModelSearchTip];
    NSMutableArray *tempArrayForMainCategorys = [NSMutableArray array];
    for (NSObject *subArrayObject in self.mainCategorys) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMainCategorys addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMainCategorys addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMainCategorys] forKey:kSSeachModelMainCategorys];
    [mutableDict setValue:self.keyword forKey:kSSeachModelKeyword];

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

    self.success = [aDecoder decodeBoolForKey:kSSeachModelSuccess];
    self.hiddenSearchBar = [aDecoder decodeBoolForKey:kSSeachModelHiddenSearchBar];
    self.searchTip = [aDecoder decodeObjectForKey:kSSeachModelSearchTip];
    self.mainCategorys = [aDecoder decodeObjectForKey:kSSeachModelMainCategorys];
    self.keyword = [aDecoder decodeObjectForKey:kSSeachModelKeyword];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_success forKey:kSSeachModelSuccess];
    [aCoder encodeBool:_hiddenSearchBar forKey:kSSeachModelHiddenSearchBar];
    [aCoder encodeObject:_searchTip forKey:kSSeachModelSearchTip];
    [aCoder encodeObject:_mainCategorys forKey:kSSeachModelMainCategorys];
    [aCoder encodeObject:_keyword forKey:kSSeachModelKeyword];
}

- (id)copyWithZone:(NSZone *)zone
{
    SSeachModel *copy = [[SSeachModel alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.hiddenSearchBar = self.hiddenSearchBar;
        copy.searchTip = [self.searchTip copyWithZone:zone];
        copy.mainCategorys = [self.mainCategorys copyWithZone:zone];
        copy.keyword = [self.keyword copyWithZone:zone];
    }
    
    return copy;
}


@end

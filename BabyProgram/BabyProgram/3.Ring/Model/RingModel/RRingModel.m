//
//  RRingModel.m
//
//  Created by zgt  on 16/3/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RRingModel.h"
#import "RStreamItems.h"


NSString *const kRRingModelSuccess = @"success";
NSString *const kRRingModelMessage = @"message";
NSString *const kRRingModelPage = @"page";
NSString *const kRRingModelCount = @"count";
NSString *const kRRingModelStreamItems = @"stream_items";
NSString *const kRRingModelPageSize = @"page_size";


@interface RRingModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RRingModel

@synthesize success = _success;
@synthesize message = _message;
@synthesize page = _page;
@synthesize count = _count;
@synthesize streamItems = _streamItems;
@synthesize pageSize = _pageSize;


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
            self.success = [[self objectOrNilForKey:kRRingModelSuccess fromDictionary:dict] boolValue];
            self.message = [self objectOrNilForKey:kRRingModelMessage fromDictionary:dict];
            self.page = [[self objectOrNilForKey:kRRingModelPage fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kRRingModelCount fromDictionary:dict] doubleValue];
    NSObject *receivedRStreamItems = [dict objectForKey:kRRingModelStreamItems];
    NSMutableArray *parsedRStreamItems = [NSMutableArray array];
    if ([receivedRStreamItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRStreamItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRStreamItems addObject:[RStreamItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRStreamItems isKindOfClass:[NSDictionary class]]) {
       [parsedRStreamItems addObject:[RStreamItems modelObjectWithDictionary:(NSDictionary *)receivedRStreamItems]];
    }

    self.streamItems = [NSArray arrayWithArray:parsedRStreamItems];
            self.pageSize = [[self objectOrNilForKey:kRRingModelPageSize fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kRRingModelSuccess];
    [mutableDict setValue:self.message forKey:kRRingModelMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kRRingModelPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kRRingModelCount];
    NSMutableArray *tempArrayForStreamItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.streamItems) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForStreamItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForStreamItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForStreamItems] forKey:kRRingModelStreamItems];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kRRingModelPageSize];

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

    self.success = [aDecoder decodeBoolForKey:kRRingModelSuccess];
    self.message = [aDecoder decodeObjectForKey:kRRingModelMessage];
    self.page = [aDecoder decodeDoubleForKey:kRRingModelPage];
    self.count = [aDecoder decodeDoubleForKey:kRRingModelCount];
    self.streamItems = [aDecoder decodeObjectForKey:kRRingModelStreamItems];
    self.pageSize = [aDecoder decodeDoubleForKey:kRRingModelPageSize];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_success forKey:kRRingModelSuccess];
    [aCoder encodeObject:_message forKey:kRRingModelMessage];
    [aCoder encodeDouble:_page forKey:kRRingModelPage];
    [aCoder encodeDouble:_count forKey:kRRingModelCount];
    [aCoder encodeObject:_streamItems forKey:kRRingModelStreamItems];
    [aCoder encodeDouble:_pageSize forKey:kRRingModelPageSize];
}

- (id)copyWithZone:(NSZone *)zone
{
    RRingModel *copy = [[RRingModel alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.message = [self.message copyWithZone:zone];
        copy.page = self.page;
        copy.count = self.count;
        copy.streamItems = [self.streamItems copyWithZone:zone];
        copy.pageSize = self.pageSize;
    }
    
    return copy;
}


@end

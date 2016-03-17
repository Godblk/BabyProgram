//
//  BMsNames.m
//
//  Created by zgt  on 16/3/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BMsNames.h"
#import "BMartshows.h"


NSString *const kBMsNamesShowNum = @"show_num";
NSString *const kBMsNamesBrand = @"brand";
NSString *const kBMsNamesImg = @"img";
NSString *const kBMsNamesPinyin = @"pinyin";
NSString *const kBMsNamesBid = @"bid";
NSString *const kBMsNamesMartshows = @"martshows";


@interface BMsNames ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BMsNames

@synthesize showNum = _showNum;
@synthesize brand = _brand;
@synthesize img = _img;
@synthesize pinyin = _pinyin;
@synthesize bid = _bid;
@synthesize martshows = _martshows;


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
            self.showNum = [[self objectOrNilForKey:kBMsNamesShowNum fromDictionary:dict] doubleValue];
            self.brand = [self objectOrNilForKey:kBMsNamesBrand fromDictionary:dict];
            self.img = [self objectOrNilForKey:kBMsNamesImg fromDictionary:dict];
            self.pinyin = [self objectOrNilForKey:kBMsNamesPinyin fromDictionary:dict];
            self.bid = [[self objectOrNilForKey:kBMsNamesBid fromDictionary:dict] doubleValue];
    NSObject *receivedBMartshows = [dict objectForKey:kBMsNamesMartshows];
    NSMutableArray *parsedBMartshows = [NSMutableArray array];
    if ([receivedBMartshows isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBMartshows) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBMartshows addObject:[BMartshows modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBMartshows isKindOfClass:[NSDictionary class]]) {
       [parsedBMartshows addObject:[BMartshows modelObjectWithDictionary:(NSDictionary *)receivedBMartshows]];
    }

    self.martshows = [NSArray arrayWithArray:parsedBMartshows];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.showNum] forKey:kBMsNamesShowNum];
    [mutableDict setValue:self.brand forKey:kBMsNamesBrand];
    [mutableDict setValue:self.img forKey:kBMsNamesImg];
    [mutableDict setValue:self.pinyin forKey:kBMsNamesPinyin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bid] forKey:kBMsNamesBid];
    NSMutableArray *tempArrayForMartshows = [NSMutableArray array];
    for (NSObject *subArrayObject in self.martshows) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMartshows addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMartshows addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMartshows] forKey:kBMsNamesMartshows];

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

    self.showNum = [aDecoder decodeDoubleForKey:kBMsNamesShowNum];
    self.brand = [aDecoder decodeObjectForKey:kBMsNamesBrand];
    self.img = [aDecoder decodeObjectForKey:kBMsNamesImg];
    self.pinyin = [aDecoder decodeObjectForKey:kBMsNamesPinyin];
    self.bid = [aDecoder decodeDoubleForKey:kBMsNamesBid];
    self.martshows = [aDecoder decodeObjectForKey:kBMsNamesMartshows];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_showNum forKey:kBMsNamesShowNum];
    [aCoder encodeObject:_brand forKey:kBMsNamesBrand];
    [aCoder encodeObject:_img forKey:kBMsNamesImg];
    [aCoder encodeObject:_pinyin forKey:kBMsNamesPinyin];
    [aCoder encodeDouble:_bid forKey:kBMsNamesBid];
    [aCoder encodeObject:_martshows forKey:kBMsNamesMartshows];
}

- (id)copyWithZone:(NSZone *)zone
{
    BMsNames *copy = [[BMsNames alloc] init];
    
    if (copy) {

        copy.showNum = self.showNum;
        copy.brand = [self.brand copyWithZone:zone];
        copy.img = [self.img copyWithZone:zone];
        copy.pinyin = [self.pinyin copyWithZone:zone];
        copy.bid = self.bid;
        copy.martshows = [self.martshows copyWithZone:zone];
    }
    
    return copy;
}


@end

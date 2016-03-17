//
//  CMsItems.m
//
//  Created by zgt  on 16/3/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CMsItems.h"


NSString *const kCMsItemsImg = @"img";
NSString *const kCMsItemsPriceOri = @"price_ori";
NSString *const kCMsItemsPrice = @"price";
NSString *const kCMsItemsIid = @"iid";
NSString *const kCMsItemsTitle = @"title";


@interface CMsItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CMsItems

@synthesize img = _img;
@synthesize priceOri = _priceOri;
@synthesize price = _price;
@synthesize iid = _iid;
@synthesize title = _title;


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
            self.img = [self objectOrNilForKey:kCMsItemsImg fromDictionary:dict];
            self.priceOri = [[self objectOrNilForKey:kCMsItemsPriceOri fromDictionary:dict] doubleValue];
            self.price = [[self objectOrNilForKey:kCMsItemsPrice fromDictionary:dict] doubleValue];
            self.iid = [[self objectOrNilForKey:kCMsItemsIid fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kCMsItemsTitle fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.img forKey:kCMsItemsImg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceOri] forKey:kCMsItemsPriceOri];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kCMsItemsPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iid] forKey:kCMsItemsIid];
    [mutableDict setValue:self.title forKey:kCMsItemsTitle];

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

    self.img = [aDecoder decodeObjectForKey:kCMsItemsImg];
    self.priceOri = [aDecoder decodeDoubleForKey:kCMsItemsPriceOri];
    self.price = [aDecoder decodeDoubleForKey:kCMsItemsPrice];
    self.iid = [aDecoder decodeDoubleForKey:kCMsItemsIid];
    self.title = [aDecoder decodeObjectForKey:kCMsItemsTitle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_img forKey:kCMsItemsImg];
    [aCoder encodeDouble:_priceOri forKey:kCMsItemsPriceOri];
    [aCoder encodeDouble:_price forKey:kCMsItemsPrice];
    [aCoder encodeDouble:_iid forKey:kCMsItemsIid];
    [aCoder encodeObject:_title forKey:kCMsItemsTitle];
}

- (id)copyWithZone:(NSZone *)zone
{
    CMsItems *copy = [[CMsItems alloc] init];
    
    if (copy) {

        copy.img = [self.img copyWithZone:zone];
        copy.priceOri = self.priceOri;
        copy.price = self.price;
        copy.iid = self.iid;
        copy.title = [self.title copyWithZone:zone];
    }
    
    return copy;
}


@end

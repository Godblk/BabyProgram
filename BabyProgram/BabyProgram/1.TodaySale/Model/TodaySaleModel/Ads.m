//
//  Ads.m
//
//  Created by zgt  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Ads.h"


NSString *const kAdsBuyingInfo = @"buying_info";
NSString *const kAdsLogin = @"login";
NSString *const kAdsWidth = @"width";
NSString *const kAdsRid = @"rid";
NSString *const kAdsPriority = @"priority";
NSString *const kAdsImg = @"img";
NSString *const kAdsTitle = @"title";
NSString *const kAdsDesc = @"desc";
NSString *const kAdsVer = @"ver";
NSString *const kAdsTarget = @"target";
NSString *const kAdsHeight = @"height";
NSString *const kAdsSid = @"sid";
NSString *const kAdsEnd = @"end";
NSString *const kAdsBegin = @"begin";


@interface Ads ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Ads

@synthesize buyingInfo = _buyingInfo;
@synthesize login = _login;
@synthesize width = _width;
@synthesize rid = _rid;
@synthesize priority = _priority;
@synthesize img = _img;
@synthesize title = _title;
@synthesize desc = _desc;
@synthesize ver = _ver;
@synthesize target = _target;
@synthesize height = _height;
@synthesize sid = _sid;
@synthesize endProperty = _endProperty;
@synthesize begin = _begin;


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
            self.buyingInfo = [self objectOrNilForKey:kAdsBuyingInfo fromDictionary:dict];
            self.login = [[self objectOrNilForKey:kAdsLogin fromDictionary:dict] doubleValue];
            self.width = [[self objectOrNilForKey:kAdsWidth fromDictionary:dict] doubleValue];
            self.rid = [[self objectOrNilForKey:kAdsRid fromDictionary:dict] doubleValue];
            self.priority = [[self objectOrNilForKey:kAdsPriority fromDictionary:dict] doubleValue];
            self.img = [self objectOrNilForKey:kAdsImg fromDictionary:dict];
            self.title = [self objectOrNilForKey:kAdsTitle fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kAdsDesc fromDictionary:dict];
            self.ver = [self objectOrNilForKey:kAdsVer fromDictionary:dict];
            self.target = [self objectOrNilForKey:kAdsTarget fromDictionary:dict];
            self.height = [[self objectOrNilForKey:kAdsHeight fromDictionary:dict] doubleValue];
            self.sid = [[self objectOrNilForKey:kAdsSid fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kAdsEnd fromDictionary:dict] doubleValue];
            self.begin = [[self objectOrNilForKey:kAdsBegin fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.buyingInfo forKey:kAdsBuyingInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.login] forKey:kAdsLogin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kAdsWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rid] forKey:kAdsRid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priority] forKey:kAdsPriority];
    [mutableDict setValue:self.img forKey:kAdsImg];
    [mutableDict setValue:self.title forKey:kAdsTitle];
    [mutableDict setValue:self.desc forKey:kAdsDesc];
    [mutableDict setValue:self.ver forKey:kAdsVer];
    [mutableDict setValue:self.target forKey:kAdsTarget];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kAdsHeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sid] forKey:kAdsSid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kAdsEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.begin] forKey:kAdsBegin];

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

    self.buyingInfo = [aDecoder decodeObjectForKey:kAdsBuyingInfo];
    self.login = [aDecoder decodeDoubleForKey:kAdsLogin];
    self.width = [aDecoder decodeDoubleForKey:kAdsWidth];
    self.rid = [aDecoder decodeDoubleForKey:kAdsRid];
    self.priority = [aDecoder decodeDoubleForKey:kAdsPriority];
    self.img = [aDecoder decodeObjectForKey:kAdsImg];
    self.title = [aDecoder decodeObjectForKey:kAdsTitle];
    self.desc = [aDecoder decodeObjectForKey:kAdsDesc];
    self.ver = [aDecoder decodeObjectForKey:kAdsVer];
    self.target = [aDecoder decodeObjectForKey:kAdsTarget];
    self.height = [aDecoder decodeDoubleForKey:kAdsHeight];
    self.sid = [aDecoder decodeDoubleForKey:kAdsSid];
    self.endProperty = [aDecoder decodeDoubleForKey:kAdsEnd];
    self.begin = [aDecoder decodeDoubleForKey:kAdsBegin];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_buyingInfo forKey:kAdsBuyingInfo];
    [aCoder encodeDouble:_login forKey:kAdsLogin];
    [aCoder encodeDouble:_width forKey:kAdsWidth];
    [aCoder encodeDouble:_rid forKey:kAdsRid];
    [aCoder encodeDouble:_priority forKey:kAdsPriority];
    [aCoder encodeObject:_img forKey:kAdsImg];
    [aCoder encodeObject:_title forKey:kAdsTitle];
    [aCoder encodeObject:_desc forKey:kAdsDesc];
    [aCoder encodeObject:_ver forKey:kAdsVer];
    [aCoder encodeObject:_target forKey:kAdsTarget];
    [aCoder encodeDouble:_height forKey:kAdsHeight];
    [aCoder encodeDouble:_sid forKey:kAdsSid];
    [aCoder encodeDouble:_endProperty forKey:kAdsEnd];
    [aCoder encodeDouble:_begin forKey:kAdsBegin];
}

- (id)copyWithZone:(NSZone *)zone
{
    Ads *copy = [[Ads alloc] init];
    
    if (copy) {

        copy.buyingInfo = [self.buyingInfo copyWithZone:zone];
        copy.login = self.login;
        copy.width = self.width;
        copy.rid = self.rid;
        copy.priority = self.priority;
        copy.img = [self.img copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.desc = [self.desc copyWithZone:zone];
        copy.ver = [self.ver copyWithZone:zone];
        copy.target = [self.target copyWithZone:zone];
        copy.height = self.height;
        copy.sid = self.sid;
        copy.endProperty = self.endProperty;
        copy.begin = self.begin;
    }
    
    return copy;
}


@end

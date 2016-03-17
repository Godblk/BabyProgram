//
//  PopupAds.m
//
//  Created by zgt  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PopupAds.h"


NSString *const kPopupAdsBuyingInfo = @"buying_info";
NSString *const kPopupAdsLogin = @"login";
NSString *const kPopupAdsRid = @"rid";
NSString *const kPopupAdsPriority = @"priority";
NSString *const kPopupAdsImg = @"img";
NSString *const kPopupAdsTitle = @"title";
NSString *const kPopupAdsDesc = @"desc";
NSString *const kPopupAdsVer = @"ver";
NSString *const kPopupAdsTarget = @"target";
NSString *const kPopupAdsSid = @"sid";
NSString *const kPopupAdsEnd = @"end";
NSString *const kPopupAdsBegin = @"begin";


@interface PopupAds ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PopupAds

@synthesize buyingInfo = _buyingInfo;
@synthesize login = _login;
@synthesize rid = _rid;
@synthesize priority = _priority;
@synthesize img = _img;
@synthesize title = _title;
@synthesize desc = _desc;
@synthesize ver = _ver;
@synthesize target = _target;
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
            self.buyingInfo = [self objectOrNilForKey:kPopupAdsBuyingInfo fromDictionary:dict];
            self.login = [[self objectOrNilForKey:kPopupAdsLogin fromDictionary:dict] doubleValue];
            self.rid = [[self objectOrNilForKey:kPopupAdsRid fromDictionary:dict] doubleValue];
            self.priority = [[self objectOrNilForKey:kPopupAdsPriority fromDictionary:dict] doubleValue];
            self.img = [self objectOrNilForKey:kPopupAdsImg fromDictionary:dict];
            self.title = [self objectOrNilForKey:kPopupAdsTitle fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kPopupAdsDesc fromDictionary:dict];
            self.ver = [self objectOrNilForKey:kPopupAdsVer fromDictionary:dict];
            self.target = [self objectOrNilForKey:kPopupAdsTarget fromDictionary:dict];
            self.sid = [[self objectOrNilForKey:kPopupAdsSid fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kPopupAdsEnd fromDictionary:dict] doubleValue];
            self.begin = [[self objectOrNilForKey:kPopupAdsBegin fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.buyingInfo forKey:kPopupAdsBuyingInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.login] forKey:kPopupAdsLogin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rid] forKey:kPopupAdsRid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priority] forKey:kPopupAdsPriority];
    [mutableDict setValue:self.img forKey:kPopupAdsImg];
    [mutableDict setValue:self.title forKey:kPopupAdsTitle];
    [mutableDict setValue:self.desc forKey:kPopupAdsDesc];
    [mutableDict setValue:self.ver forKey:kPopupAdsVer];
    [mutableDict setValue:self.target forKey:kPopupAdsTarget];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sid] forKey:kPopupAdsSid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kPopupAdsEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.begin] forKey:kPopupAdsBegin];

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

    self.buyingInfo = [aDecoder decodeObjectForKey:kPopupAdsBuyingInfo];
    self.login = [aDecoder decodeDoubleForKey:kPopupAdsLogin];
    self.rid = [aDecoder decodeDoubleForKey:kPopupAdsRid];
    self.priority = [aDecoder decodeDoubleForKey:kPopupAdsPriority];
    self.img = [aDecoder decodeObjectForKey:kPopupAdsImg];
    self.title = [aDecoder decodeObjectForKey:kPopupAdsTitle];
    self.desc = [aDecoder decodeObjectForKey:kPopupAdsDesc];
    self.ver = [aDecoder decodeObjectForKey:kPopupAdsVer];
    self.target = [aDecoder decodeObjectForKey:kPopupAdsTarget];
    self.sid = [aDecoder decodeDoubleForKey:kPopupAdsSid];
    self.endProperty = [aDecoder decodeDoubleForKey:kPopupAdsEnd];
    self.begin = [aDecoder decodeDoubleForKey:kPopupAdsBegin];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_buyingInfo forKey:kPopupAdsBuyingInfo];
    [aCoder encodeDouble:_login forKey:kPopupAdsLogin];
    [aCoder encodeDouble:_rid forKey:kPopupAdsRid];
    [aCoder encodeDouble:_priority forKey:kPopupAdsPriority];
    [aCoder encodeObject:_img forKey:kPopupAdsImg];
    [aCoder encodeObject:_title forKey:kPopupAdsTitle];
    [aCoder encodeObject:_desc forKey:kPopupAdsDesc];
    [aCoder encodeObject:_ver forKey:kPopupAdsVer];
    [aCoder encodeObject:_target forKey:kPopupAdsTarget];
    [aCoder encodeDouble:_sid forKey:kPopupAdsSid];
    [aCoder encodeDouble:_endProperty forKey:kPopupAdsEnd];
    [aCoder encodeDouble:_begin forKey:kPopupAdsBegin];
}

- (id)copyWithZone:(NSZone *)zone
{
    PopupAds *copy = [[PopupAds alloc] init];
    
    if (copy) {

        copy.buyingInfo = [self.buyingInfo copyWithZone:zone];
        copy.login = self.login;
        copy.rid = self.rid;
        copy.priority = self.priority;
        copy.img = [self.img copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.desc = [self.desc copyWithZone:zone];
        copy.ver = [self.ver copyWithZone:zone];
        copy.target = [self.target copyWithZone:zone];
        copy.sid = self.sid;
        copy.endProperty = self.endProperty;
        copy.begin = self.begin;
    }
    
    return copy;
}


@end

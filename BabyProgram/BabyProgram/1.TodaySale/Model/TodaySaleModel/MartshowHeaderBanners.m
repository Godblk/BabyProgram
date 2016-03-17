//
//  MartshowHeaderBanners.m
//
//  Created by zgt  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MartshowHeaderBanners.h"


NSString *const kMartshowHeaderBannersBuyingInfo = @"buying_info";
NSString *const kMartshowHeaderBannersMainTitle = @"main_title";
NSString *const kMartshowHeaderBannersWidth = @"width";
NSString *const kMartshowHeaderBannersRid = @"rid";
NSString *const kMartshowHeaderBannersPriority = @"priority";
NSString *const kMartshowHeaderBannersImg = @"img";
NSString *const kMartshowHeaderBannersTitle = @"title";
NSString *const kMartshowHeaderBannersDesc = @"desc";
NSString *const kMartshowHeaderBannersLogin = @"login";
NSString *const kMartshowHeaderBannersVer = @"ver";
NSString *const kMartshowHeaderBannersSid = @"sid";
NSString *const kMartshowHeaderBannersHeight = @"height";
NSString *const kMartshowHeaderBannersTarget = @"target";
NSString *const kMartshowHeaderBannersEnd = @"end";
NSString *const kMartshowHeaderBannersMainBg = @"main_bg";
NSString *const kMartshowHeaderBannersMainImg = @"main_img";
NSString *const kMartshowHeaderBannersMainSubtitle = @"main_subtitle";
NSString *const kMartshowHeaderBannersBegin = @"begin";


@interface MartshowHeaderBanners ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MartshowHeaderBanners

@synthesize buyingInfo = _buyingInfo;
@synthesize mainTitle = _mainTitle;
@synthesize width = _width;
@synthesize rid = _rid;
@synthesize priority = _priority;
@synthesize img = _img;
@synthesize title = _title;
@synthesize desc = _desc;
@synthesize login = _login;
@synthesize ver = _ver;
@synthesize sid = _sid;
@synthesize height = _height;
@synthesize target = _target;
@synthesize endProperty = _endProperty;
@synthesize mainBg = _mainBg;
@synthesize mainImg = _mainImg;
@synthesize mainSubtitle = _mainSubtitle;
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
            self.buyingInfo = [self objectOrNilForKey:kMartshowHeaderBannersBuyingInfo fromDictionary:dict];
            self.mainTitle = [self objectOrNilForKey:kMartshowHeaderBannersMainTitle fromDictionary:dict];
            self.width = [[self objectOrNilForKey:kMartshowHeaderBannersWidth fromDictionary:dict] doubleValue];
            self.rid = [[self objectOrNilForKey:kMartshowHeaderBannersRid fromDictionary:dict] doubleValue];
            self.priority = [[self objectOrNilForKey:kMartshowHeaderBannersPriority fromDictionary:dict] doubleValue];
            self.img = [self objectOrNilForKey:kMartshowHeaderBannersImg fromDictionary:dict];
            self.title = [self objectOrNilForKey:kMartshowHeaderBannersTitle fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kMartshowHeaderBannersDesc fromDictionary:dict];
            self.login = [[self objectOrNilForKey:kMartshowHeaderBannersLogin fromDictionary:dict] doubleValue];
            self.ver = [self objectOrNilForKey:kMartshowHeaderBannersVer fromDictionary:dict];
            self.sid = [[self objectOrNilForKey:kMartshowHeaderBannersSid fromDictionary:dict] doubleValue];
            self.height = [[self objectOrNilForKey:kMartshowHeaderBannersHeight fromDictionary:dict] doubleValue];
            self.target = [self objectOrNilForKey:kMartshowHeaderBannersTarget fromDictionary:dict];
            self.endProperty = [[self objectOrNilForKey:kMartshowHeaderBannersEnd fromDictionary:dict] doubleValue];
            self.mainBg = [self objectOrNilForKey:kMartshowHeaderBannersMainBg fromDictionary:dict];
            self.mainImg = [self objectOrNilForKey:kMartshowHeaderBannersMainImg fromDictionary:dict];
            self.mainSubtitle = [self objectOrNilForKey:kMartshowHeaderBannersMainSubtitle fromDictionary:dict];
            self.begin = [[self objectOrNilForKey:kMartshowHeaderBannersBegin fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.buyingInfo forKey:kMartshowHeaderBannersBuyingInfo];
    [mutableDict setValue:self.mainTitle forKey:kMartshowHeaderBannersMainTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kMartshowHeaderBannersWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rid] forKey:kMartshowHeaderBannersRid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priority] forKey:kMartshowHeaderBannersPriority];
    [mutableDict setValue:self.img forKey:kMartshowHeaderBannersImg];
    [mutableDict setValue:self.title forKey:kMartshowHeaderBannersTitle];
    [mutableDict setValue:self.desc forKey:kMartshowHeaderBannersDesc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.login] forKey:kMartshowHeaderBannersLogin];
    [mutableDict setValue:self.ver forKey:kMartshowHeaderBannersVer];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sid] forKey:kMartshowHeaderBannersSid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kMartshowHeaderBannersHeight];
    [mutableDict setValue:self.target forKey:kMartshowHeaderBannersTarget];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kMartshowHeaderBannersEnd];
    [mutableDict setValue:self.mainBg forKey:kMartshowHeaderBannersMainBg];
    [mutableDict setValue:self.mainImg forKey:kMartshowHeaderBannersMainImg];
    [mutableDict setValue:self.mainSubtitle forKey:kMartshowHeaderBannersMainSubtitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.begin] forKey:kMartshowHeaderBannersBegin];

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

    self.buyingInfo = [aDecoder decodeObjectForKey:kMartshowHeaderBannersBuyingInfo];
    self.mainTitle = [aDecoder decodeObjectForKey:kMartshowHeaderBannersMainTitle];
    self.width = [aDecoder decodeDoubleForKey:kMartshowHeaderBannersWidth];
    self.rid = [aDecoder decodeDoubleForKey:kMartshowHeaderBannersRid];
    self.priority = [aDecoder decodeDoubleForKey:kMartshowHeaderBannersPriority];
    self.img = [aDecoder decodeObjectForKey:kMartshowHeaderBannersImg];
    self.title = [aDecoder decodeObjectForKey:kMartshowHeaderBannersTitle];
    self.desc = [aDecoder decodeObjectForKey:kMartshowHeaderBannersDesc];
    self.login = [aDecoder decodeDoubleForKey:kMartshowHeaderBannersLogin];
    self.ver = [aDecoder decodeObjectForKey:kMartshowHeaderBannersVer];
    self.sid = [aDecoder decodeDoubleForKey:kMartshowHeaderBannersSid];
    self.height = [aDecoder decodeDoubleForKey:kMartshowHeaderBannersHeight];
    self.target = [aDecoder decodeObjectForKey:kMartshowHeaderBannersTarget];
    self.endProperty = [aDecoder decodeDoubleForKey:kMartshowHeaderBannersEnd];
    self.mainBg = [aDecoder decodeObjectForKey:kMartshowHeaderBannersMainBg];
    self.mainImg = [aDecoder decodeObjectForKey:kMartshowHeaderBannersMainImg];
    self.mainSubtitle = [aDecoder decodeObjectForKey:kMartshowHeaderBannersMainSubtitle];
    self.begin = [aDecoder decodeDoubleForKey:kMartshowHeaderBannersBegin];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_buyingInfo forKey:kMartshowHeaderBannersBuyingInfo];
    [aCoder encodeObject:_mainTitle forKey:kMartshowHeaderBannersMainTitle];
    [aCoder encodeDouble:_width forKey:kMartshowHeaderBannersWidth];
    [aCoder encodeDouble:_rid forKey:kMartshowHeaderBannersRid];
    [aCoder encodeDouble:_priority forKey:kMartshowHeaderBannersPriority];
    [aCoder encodeObject:_img forKey:kMartshowHeaderBannersImg];
    [aCoder encodeObject:_title forKey:kMartshowHeaderBannersTitle];
    [aCoder encodeObject:_desc forKey:kMartshowHeaderBannersDesc];
    [aCoder encodeDouble:_login forKey:kMartshowHeaderBannersLogin];
    [aCoder encodeObject:_ver forKey:kMartshowHeaderBannersVer];
    [aCoder encodeDouble:_sid forKey:kMartshowHeaderBannersSid];
    [aCoder encodeDouble:_height forKey:kMartshowHeaderBannersHeight];
    [aCoder encodeObject:_target forKey:kMartshowHeaderBannersTarget];
    [aCoder encodeDouble:_endProperty forKey:kMartshowHeaderBannersEnd];
    [aCoder encodeObject:_mainBg forKey:kMartshowHeaderBannersMainBg];
    [aCoder encodeObject:_mainImg forKey:kMartshowHeaderBannersMainImg];
    [aCoder encodeObject:_mainSubtitle forKey:kMartshowHeaderBannersMainSubtitle];
    [aCoder encodeDouble:_begin forKey:kMartshowHeaderBannersBegin];
}

- (id)copyWithZone:(NSZone *)zone
{
    MartshowHeaderBanners *copy = [[MartshowHeaderBanners alloc] init];
    
    if (copy) {

        copy.buyingInfo = [self.buyingInfo copyWithZone:zone];
        copy.mainTitle = [self.mainTitle copyWithZone:zone];
        copy.width = self.width;
        copy.rid = self.rid;
        copy.priority = self.priority;
        copy.img = [self.img copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.desc = [self.desc copyWithZone:zone];
        copy.login = self.login;
        copy.ver = [self.ver copyWithZone:zone];
        copy.sid = self.sid;
        copy.height = self.height;
        copy.target = [self.target copyWithZone:zone];
        copy.endProperty = self.endProperty;
        copy.mainBg = [self.mainBg copyWithZone:zone];
        copy.mainImg = [self.mainImg copyWithZone:zone];
        copy.mainSubtitle = [self.mainSubtitle copyWithZone:zone];
        copy.begin = self.begin;
    }
    
    return copy;
}


@end

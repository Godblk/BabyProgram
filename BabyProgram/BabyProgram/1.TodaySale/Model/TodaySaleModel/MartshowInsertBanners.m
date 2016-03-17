//
//  MartshowInsertBanners.m
//
//  Created by zgt  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MartshowInsertBanners.h"


NSString *const kMartshowInsertBannersPosition = @"position";
NSString *const kMartshowInsertBannersBuyingInfo = @"buying_info";
NSString *const kMartshowInsertBannersLogin = @"login";
NSString *const kMartshowInsertBannersWidth = @"width";
NSString *const kMartshowInsertBannersRid = @"rid";
NSString *const kMartshowInsertBannersPriority = @"priority";
NSString *const kMartshowInsertBannersImg = @"img";
NSString *const kMartshowInsertBannersTitle = @"title";
NSString *const kMartshowInsertBannersDesc = @"desc";
NSString *const kMartshowInsertBannersVer = @"ver";
NSString *const kMartshowInsertBannersSid = @"sid";
NSString *const kMartshowInsertBannersHeight = @"height";
NSString *const kMartshowInsertBannersTarget = @"target";
NSString *const kMartshowInsertBannersEnd = @"end";
NSString *const kMartshowInsertBannersBegin = @"begin";


@interface MartshowInsertBanners ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MartshowInsertBanners

@synthesize position = _position;
@synthesize buyingInfo = _buyingInfo;
@synthesize login = _login;
@synthesize width = _width;
@synthesize rid = _rid;
@synthesize priority = _priority;
@synthesize img = _img;
@synthesize title = _title;
@synthesize desc = _desc;
@synthesize ver = _ver;
@synthesize sid = _sid;
@synthesize height = _height;
@synthesize target = _target;
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
            self.position = [[self objectOrNilForKey:kMartshowInsertBannersPosition fromDictionary:dict] doubleValue];
            self.buyingInfo = [self objectOrNilForKey:kMartshowInsertBannersBuyingInfo fromDictionary:dict];
            self.login = [[self objectOrNilForKey:kMartshowInsertBannersLogin fromDictionary:dict] doubleValue];
            self.width = [[self objectOrNilForKey:kMartshowInsertBannersWidth fromDictionary:dict] doubleValue];
            self.rid = [[self objectOrNilForKey:kMartshowInsertBannersRid fromDictionary:dict] doubleValue];
            self.priority = [[self objectOrNilForKey:kMartshowInsertBannersPriority fromDictionary:dict] doubleValue];
            self.img = [self objectOrNilForKey:kMartshowInsertBannersImg fromDictionary:dict];
            self.title = [self objectOrNilForKey:kMartshowInsertBannersTitle fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kMartshowInsertBannersDesc fromDictionary:dict];
            self.ver = [self objectOrNilForKey:kMartshowInsertBannersVer fromDictionary:dict];
            self.sid = [[self objectOrNilForKey:kMartshowInsertBannersSid fromDictionary:dict] doubleValue];
            self.height = [[self objectOrNilForKey:kMartshowInsertBannersHeight fromDictionary:dict] doubleValue];
            self.target = [self objectOrNilForKey:kMartshowInsertBannersTarget fromDictionary:dict];
            self.endProperty = [[self objectOrNilForKey:kMartshowInsertBannersEnd fromDictionary:dict] doubleValue];
            self.begin = [[self objectOrNilForKey:kMartshowInsertBannersBegin fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.position] forKey:kMartshowInsertBannersPosition];
    [mutableDict setValue:self.buyingInfo forKey:kMartshowInsertBannersBuyingInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.login] forKey:kMartshowInsertBannersLogin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kMartshowInsertBannersWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rid] forKey:kMartshowInsertBannersRid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priority] forKey:kMartshowInsertBannersPriority];
    [mutableDict setValue:self.img forKey:kMartshowInsertBannersImg];
    [mutableDict setValue:self.title forKey:kMartshowInsertBannersTitle];
    [mutableDict setValue:self.desc forKey:kMartshowInsertBannersDesc];
    [mutableDict setValue:self.ver forKey:kMartshowInsertBannersVer];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sid] forKey:kMartshowInsertBannersSid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kMartshowInsertBannersHeight];
    [mutableDict setValue:self.target forKey:kMartshowInsertBannersTarget];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kMartshowInsertBannersEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.begin] forKey:kMartshowInsertBannersBegin];

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

    self.position = [aDecoder decodeDoubleForKey:kMartshowInsertBannersPosition];
    self.buyingInfo = [aDecoder decodeObjectForKey:kMartshowInsertBannersBuyingInfo];
    self.login = [aDecoder decodeDoubleForKey:kMartshowInsertBannersLogin];
    self.width = [aDecoder decodeDoubleForKey:kMartshowInsertBannersWidth];
    self.rid = [aDecoder decodeDoubleForKey:kMartshowInsertBannersRid];
    self.priority = [aDecoder decodeDoubleForKey:kMartshowInsertBannersPriority];
    self.img = [aDecoder decodeObjectForKey:kMartshowInsertBannersImg];
    self.title = [aDecoder decodeObjectForKey:kMartshowInsertBannersTitle];
    self.desc = [aDecoder decodeObjectForKey:kMartshowInsertBannersDesc];
    self.ver = [aDecoder decodeObjectForKey:kMartshowInsertBannersVer];
    self.sid = [aDecoder decodeDoubleForKey:kMartshowInsertBannersSid];
    self.height = [aDecoder decodeDoubleForKey:kMartshowInsertBannersHeight];
    self.target = [aDecoder decodeObjectForKey:kMartshowInsertBannersTarget];
    self.endProperty = [aDecoder decodeDoubleForKey:kMartshowInsertBannersEnd];
    self.begin = [aDecoder decodeDoubleForKey:kMartshowInsertBannersBegin];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_position forKey:kMartshowInsertBannersPosition];
    [aCoder encodeObject:_buyingInfo forKey:kMartshowInsertBannersBuyingInfo];
    [aCoder encodeDouble:_login forKey:kMartshowInsertBannersLogin];
    [aCoder encodeDouble:_width forKey:kMartshowInsertBannersWidth];
    [aCoder encodeDouble:_rid forKey:kMartshowInsertBannersRid];
    [aCoder encodeDouble:_priority forKey:kMartshowInsertBannersPriority];
    [aCoder encodeObject:_img forKey:kMartshowInsertBannersImg];
    [aCoder encodeObject:_title forKey:kMartshowInsertBannersTitle];
    [aCoder encodeObject:_desc forKey:kMartshowInsertBannersDesc];
    [aCoder encodeObject:_ver forKey:kMartshowInsertBannersVer];
    [aCoder encodeDouble:_sid forKey:kMartshowInsertBannersSid];
    [aCoder encodeDouble:_height forKey:kMartshowInsertBannersHeight];
    [aCoder encodeObject:_target forKey:kMartshowInsertBannersTarget];
    [aCoder encodeDouble:_endProperty forKey:kMartshowInsertBannersEnd];
    [aCoder encodeDouble:_begin forKey:kMartshowInsertBannersBegin];
}

- (id)copyWithZone:(NSZone *)zone
{
    MartshowInsertBanners *copy = [[MartshowInsertBanners alloc] init];
    
    if (copy) {

        copy.position = self.position;
        copy.buyingInfo = [self.buyingInfo copyWithZone:zone];
        copy.login = self.login;
        copy.width = self.width;
        copy.rid = self.rid;
        copy.priority = self.priority;
        copy.img = [self.img copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.desc = [self.desc copyWithZone:zone];
        copy.ver = [self.ver copyWithZone:zone];
        copy.sid = self.sid;
        copy.height = self.height;
        copy.target = [self.target copyWithZone:zone];
        copy.endProperty = self.endProperty;
        copy.begin = self.begin;
    }
    
    return copy;
}


@end

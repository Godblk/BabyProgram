//
//  PromotionProShortcuts.m
//
//  Created by zgt  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PromotionProShortcuts.h"


NSString *const kPromotionProShortcutsBuyingInfo = @"buying_info";
NSString *const kPromotionProShortcutsLogin = @"login";
NSString *const kPromotionProShortcutsRid = @"rid";
NSString *const kPromotionProShortcutsPriority = @"priority";
NSString *const kPromotionProShortcutsImg = @"img";
NSString *const kPromotionProShortcutsTitle = @"title";
NSString *const kPromotionProShortcutsDesc = @"desc";
NSString *const kPromotionProShortcutsVer = @"ver";
NSString *const kPromotionProShortcutsTarget = @"target";
NSString *const kPromotionProShortcutsSid = @"sid";
NSString *const kPromotionProShortcutsEnd = @"end";
NSString *const kPromotionProShortcutsShowLeftTime = @"show_left_time";
NSString *const kPromotionProShortcutsBegin = @"begin";


@interface PromotionProShortcuts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PromotionProShortcuts

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
@synthesize showLeftTime = _showLeftTime;
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
            self.buyingInfo = [self objectOrNilForKey:kPromotionProShortcutsBuyingInfo fromDictionary:dict];
            self.login = [[self objectOrNilForKey:kPromotionProShortcutsLogin fromDictionary:dict] doubleValue];
            self.rid = [[self objectOrNilForKey:kPromotionProShortcutsRid fromDictionary:dict] doubleValue];
            self.priority = [[self objectOrNilForKey:kPromotionProShortcutsPriority fromDictionary:dict] doubleValue];
            self.img = [self objectOrNilForKey:kPromotionProShortcutsImg fromDictionary:dict];
            self.title = [self objectOrNilForKey:kPromotionProShortcutsTitle fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kPromotionProShortcutsDesc fromDictionary:dict];
            self.ver = [self objectOrNilForKey:kPromotionProShortcutsVer fromDictionary:dict];
            self.target = [self objectOrNilForKey:kPromotionProShortcutsTarget fromDictionary:dict];
            self.sid = [[self objectOrNilForKey:kPromotionProShortcutsSid fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kPromotionProShortcutsEnd fromDictionary:dict] doubleValue];
            self.showLeftTime = [[self objectOrNilForKey:kPromotionProShortcutsShowLeftTime fromDictionary:dict] doubleValue];
            self.begin = [[self objectOrNilForKey:kPromotionProShortcutsBegin fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.buyingInfo forKey:kPromotionProShortcutsBuyingInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.login] forKey:kPromotionProShortcutsLogin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rid] forKey:kPromotionProShortcutsRid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priority] forKey:kPromotionProShortcutsPriority];
    [mutableDict setValue:self.img forKey:kPromotionProShortcutsImg];
    [mutableDict setValue:self.title forKey:kPromotionProShortcutsTitle];
    [mutableDict setValue:self.desc forKey:kPromotionProShortcutsDesc];
    [mutableDict setValue:self.ver forKey:kPromotionProShortcutsVer];
    [mutableDict setValue:self.target forKey:kPromotionProShortcutsTarget];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sid] forKey:kPromotionProShortcutsSid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kPromotionProShortcutsEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.showLeftTime] forKey:kPromotionProShortcutsShowLeftTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.begin] forKey:kPromotionProShortcutsBegin];

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

    self.buyingInfo = [aDecoder decodeObjectForKey:kPromotionProShortcutsBuyingInfo];
    self.login = [aDecoder decodeDoubleForKey:kPromotionProShortcutsLogin];
    self.rid = [aDecoder decodeDoubleForKey:kPromotionProShortcutsRid];
    self.priority = [aDecoder decodeDoubleForKey:kPromotionProShortcutsPriority];
    self.img = [aDecoder decodeObjectForKey:kPromotionProShortcutsImg];
    self.title = [aDecoder decodeObjectForKey:kPromotionProShortcutsTitle];
    self.desc = [aDecoder decodeObjectForKey:kPromotionProShortcutsDesc];
    self.ver = [aDecoder decodeObjectForKey:kPromotionProShortcutsVer];
    self.target = [aDecoder decodeObjectForKey:kPromotionProShortcutsTarget];
    self.sid = [aDecoder decodeDoubleForKey:kPromotionProShortcutsSid];
    self.endProperty = [aDecoder decodeDoubleForKey:kPromotionProShortcutsEnd];
    self.showLeftTime = [aDecoder decodeDoubleForKey:kPromotionProShortcutsShowLeftTime];
    self.begin = [aDecoder decodeDoubleForKey:kPromotionProShortcutsBegin];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_buyingInfo forKey:kPromotionProShortcutsBuyingInfo];
    [aCoder encodeDouble:_login forKey:kPromotionProShortcutsLogin];
    [aCoder encodeDouble:_rid forKey:kPromotionProShortcutsRid];
    [aCoder encodeDouble:_priority forKey:kPromotionProShortcutsPriority];
    [aCoder encodeObject:_img forKey:kPromotionProShortcutsImg];
    [aCoder encodeObject:_title forKey:kPromotionProShortcutsTitle];
    [aCoder encodeObject:_desc forKey:kPromotionProShortcutsDesc];
    [aCoder encodeObject:_ver forKey:kPromotionProShortcutsVer];
    [aCoder encodeObject:_target forKey:kPromotionProShortcutsTarget];
    [aCoder encodeDouble:_sid forKey:kPromotionProShortcutsSid];
    [aCoder encodeDouble:_endProperty forKey:kPromotionProShortcutsEnd];
    [aCoder encodeDouble:_showLeftTime forKey:kPromotionProShortcutsShowLeftTime];
    [aCoder encodeDouble:_begin forKey:kPromotionProShortcutsBegin];
}

- (id)copyWithZone:(NSZone *)zone
{
    PromotionProShortcuts *copy = [[PromotionProShortcuts alloc] init];
    
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
        copy.showLeftTime = self.showLeftTime;
        copy.begin = self.begin;
    }
    
    return copy;
}


@end

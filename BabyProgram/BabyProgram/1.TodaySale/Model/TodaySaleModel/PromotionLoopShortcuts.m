//
//  PromotionLoopShortcuts.m
//
//  Created by zgt  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PromotionLoopShortcuts.h"


NSString *const kPromotionLoopShortcutsBuyingInfo = @"buying_info";
NSString *const kPromotionLoopShortcutsLogin = @"login";
NSString *const kPromotionLoopShortcutsRid = @"rid";
NSString *const kPromotionLoopShortcutsPriority = @"priority";
NSString *const kPromotionLoopShortcutsImg = @"img";
NSString *const kPromotionLoopShortcutsTitle = @"title";
NSString *const kPromotionLoopShortcutsDesc = @"desc";
NSString *const kPromotionLoopShortcutsVer = @"ver";
NSString *const kPromotionLoopShortcutsTarget = @"target";
NSString *const kPromotionLoopShortcutsSid = @"sid";
NSString *const kPromotionLoopShortcutsEnd = @"end";
NSString *const kPromotionLoopShortcutsBegin = @"begin";


@interface PromotionLoopShortcuts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PromotionLoopShortcuts

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
            self.buyingInfo = [self objectOrNilForKey:kPromotionLoopShortcutsBuyingInfo fromDictionary:dict];
            self.login = [[self objectOrNilForKey:kPromotionLoopShortcutsLogin fromDictionary:dict] doubleValue];
            self.rid = [[self objectOrNilForKey:kPromotionLoopShortcutsRid fromDictionary:dict] doubleValue];
            self.priority = [[self objectOrNilForKey:kPromotionLoopShortcutsPriority fromDictionary:dict] doubleValue];
            self.img = [self objectOrNilForKey:kPromotionLoopShortcutsImg fromDictionary:dict];
            self.title = [self objectOrNilForKey:kPromotionLoopShortcutsTitle fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kPromotionLoopShortcutsDesc fromDictionary:dict];
            self.ver = [self objectOrNilForKey:kPromotionLoopShortcutsVer fromDictionary:dict];
            self.target = [self objectOrNilForKey:kPromotionLoopShortcutsTarget fromDictionary:dict];
            self.sid = [[self objectOrNilForKey:kPromotionLoopShortcutsSid fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kPromotionLoopShortcutsEnd fromDictionary:dict] doubleValue];
            self.begin = [[self objectOrNilForKey:kPromotionLoopShortcutsBegin fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.buyingInfo forKey:kPromotionLoopShortcutsBuyingInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.login] forKey:kPromotionLoopShortcutsLogin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rid] forKey:kPromotionLoopShortcutsRid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priority] forKey:kPromotionLoopShortcutsPriority];
    [mutableDict setValue:self.img forKey:kPromotionLoopShortcutsImg];
    [mutableDict setValue:self.title forKey:kPromotionLoopShortcutsTitle];
    [mutableDict setValue:self.desc forKey:kPromotionLoopShortcutsDesc];
    [mutableDict setValue:self.ver forKey:kPromotionLoopShortcutsVer];
    [mutableDict setValue:self.target forKey:kPromotionLoopShortcutsTarget];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sid] forKey:kPromotionLoopShortcutsSid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kPromotionLoopShortcutsEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.begin] forKey:kPromotionLoopShortcutsBegin];

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

    self.buyingInfo = [aDecoder decodeObjectForKey:kPromotionLoopShortcutsBuyingInfo];
    self.login = [aDecoder decodeDoubleForKey:kPromotionLoopShortcutsLogin];
    self.rid = [aDecoder decodeDoubleForKey:kPromotionLoopShortcutsRid];
    self.priority = [aDecoder decodeDoubleForKey:kPromotionLoopShortcutsPriority];
    self.img = [aDecoder decodeObjectForKey:kPromotionLoopShortcutsImg];
    self.title = [aDecoder decodeObjectForKey:kPromotionLoopShortcutsTitle];
    self.desc = [aDecoder decodeObjectForKey:kPromotionLoopShortcutsDesc];
    self.ver = [aDecoder decodeObjectForKey:kPromotionLoopShortcutsVer];
    self.target = [aDecoder decodeObjectForKey:kPromotionLoopShortcutsTarget];
    self.sid = [aDecoder decodeDoubleForKey:kPromotionLoopShortcutsSid];
    self.endProperty = [aDecoder decodeDoubleForKey:kPromotionLoopShortcutsEnd];
    self.begin = [aDecoder decodeDoubleForKey:kPromotionLoopShortcutsBegin];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_buyingInfo forKey:kPromotionLoopShortcutsBuyingInfo];
    [aCoder encodeDouble:_login forKey:kPromotionLoopShortcutsLogin];
    [aCoder encodeDouble:_rid forKey:kPromotionLoopShortcutsRid];
    [aCoder encodeDouble:_priority forKey:kPromotionLoopShortcutsPriority];
    [aCoder encodeObject:_img forKey:kPromotionLoopShortcutsImg];
    [aCoder encodeObject:_title forKey:kPromotionLoopShortcutsTitle];
    [aCoder encodeObject:_desc forKey:kPromotionLoopShortcutsDesc];
    [aCoder encodeObject:_ver forKey:kPromotionLoopShortcutsVer];
    [aCoder encodeObject:_target forKey:kPromotionLoopShortcutsTarget];
    [aCoder encodeDouble:_sid forKey:kPromotionLoopShortcutsSid];
    [aCoder encodeDouble:_endProperty forKey:kPromotionLoopShortcutsEnd];
    [aCoder encodeDouble:_begin forKey:kPromotionLoopShortcutsBegin];
}

- (id)copyWithZone:(NSZone *)zone
{
    PromotionLoopShortcuts *copy = [[PromotionLoopShortcuts alloc] init];
    
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

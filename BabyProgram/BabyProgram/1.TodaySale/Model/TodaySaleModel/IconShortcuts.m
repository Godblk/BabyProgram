//
//  IconShortcuts.m
//
//  Created by zgt  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "IconShortcuts.h"


NSString *const kIconShortcutsBuyingInfo = @"buying_info";
NSString *const kIconShortcutsLogin = @"login";
NSString *const kIconShortcutsRid = @"rid";
NSString *const kIconShortcutsPriority = @"priority";
NSString *const kIconShortcutsImg = @"img";
NSString *const kIconShortcutsTitle = @"title";
NSString *const kIconShortcutsDesc = @"desc";
NSString *const kIconShortcutsVer = @"ver";
NSString *const kIconShortcutsTarget = @"target";
NSString *const kIconShortcutsSid = @"sid";
NSString *const kIconShortcutsEnd = @"end";
NSString *const kIconShortcutsBegin = @"begin";


@interface IconShortcuts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation IconShortcuts

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
            self.buyingInfo = [self objectOrNilForKey:kIconShortcutsBuyingInfo fromDictionary:dict];
            self.login = [[self objectOrNilForKey:kIconShortcutsLogin fromDictionary:dict] doubleValue];
            self.rid = [[self objectOrNilForKey:kIconShortcutsRid fromDictionary:dict] doubleValue];
            self.priority = [[self objectOrNilForKey:kIconShortcutsPriority fromDictionary:dict] doubleValue];
            self.img = [self objectOrNilForKey:kIconShortcutsImg fromDictionary:dict];
            self.title = [self objectOrNilForKey:kIconShortcutsTitle fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kIconShortcutsDesc fromDictionary:dict];
            self.ver = [self objectOrNilForKey:kIconShortcutsVer fromDictionary:dict];
            self.target = [self objectOrNilForKey:kIconShortcutsTarget fromDictionary:dict];
            self.sid = [[self objectOrNilForKey:kIconShortcutsSid fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kIconShortcutsEnd fromDictionary:dict] doubleValue];
            self.begin = [[self objectOrNilForKey:kIconShortcutsBegin fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.buyingInfo forKey:kIconShortcutsBuyingInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.login] forKey:kIconShortcutsLogin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rid] forKey:kIconShortcutsRid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priority] forKey:kIconShortcutsPriority];
    [mutableDict setValue:self.img forKey:kIconShortcutsImg];
    [mutableDict setValue:self.title forKey:kIconShortcutsTitle];
    [mutableDict setValue:self.desc forKey:kIconShortcutsDesc];
    [mutableDict setValue:self.ver forKey:kIconShortcutsVer];
    [mutableDict setValue:self.target forKey:kIconShortcutsTarget];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sid] forKey:kIconShortcutsSid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kIconShortcutsEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.begin] forKey:kIconShortcutsBegin];

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

    self.buyingInfo = [aDecoder decodeObjectForKey:kIconShortcutsBuyingInfo];
    self.login = [aDecoder decodeDoubleForKey:kIconShortcutsLogin];
    self.rid = [aDecoder decodeDoubleForKey:kIconShortcutsRid];
    self.priority = [aDecoder decodeDoubleForKey:kIconShortcutsPriority];
    self.img = [aDecoder decodeObjectForKey:kIconShortcutsImg];
    self.title = [aDecoder decodeObjectForKey:kIconShortcutsTitle];
    self.desc = [aDecoder decodeObjectForKey:kIconShortcutsDesc];
    self.ver = [aDecoder decodeObjectForKey:kIconShortcutsVer];
    self.target = [aDecoder decodeObjectForKey:kIconShortcutsTarget];
    self.sid = [aDecoder decodeDoubleForKey:kIconShortcutsSid];
    self.endProperty = [aDecoder decodeDoubleForKey:kIconShortcutsEnd];
    self.begin = [aDecoder decodeDoubleForKey:kIconShortcutsBegin];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_buyingInfo forKey:kIconShortcutsBuyingInfo];
    [aCoder encodeDouble:_login forKey:kIconShortcutsLogin];
    [aCoder encodeDouble:_rid forKey:kIconShortcutsRid];
    [aCoder encodeDouble:_priority forKey:kIconShortcutsPriority];
    [aCoder encodeObject:_img forKey:kIconShortcutsImg];
    [aCoder encodeObject:_title forKey:kIconShortcutsTitle];
    [aCoder encodeObject:_desc forKey:kIconShortcutsDesc];
    [aCoder encodeObject:_ver forKey:kIconShortcutsVer];
    [aCoder encodeObject:_target forKey:kIconShortcutsTarget];
    [aCoder encodeDouble:_sid forKey:kIconShortcutsSid];
    [aCoder encodeDouble:_endProperty forKey:kIconShortcutsEnd];
    [aCoder encodeDouble:_begin forKey:kIconShortcutsBegin];
}

- (id)copyWithZone:(NSZone *)zone
{
    IconShortcuts *copy = [[IconShortcuts alloc] init];
    
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

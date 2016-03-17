//
//  MartshowHeaderThreeSquares.m
//
//  Created by zgt  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MartshowHeaderThreeSquares.h"


NSString *const kMartshowHeaderThreeSquaresBuyingInfo = @"buying_info";
NSString *const kMartshowHeaderThreeSquaresLogin = @"login";
NSString *const kMartshowHeaderThreeSquaresRid = @"rid";
NSString *const kMartshowHeaderThreeSquaresPriority = @"priority";
NSString *const kMartshowHeaderThreeSquaresImg = @"img";
NSString *const kMartshowHeaderThreeSquaresTitle = @"title";
NSString *const kMartshowHeaderThreeSquaresDesc = @"desc";
NSString *const kMartshowHeaderThreeSquaresVer = @"ver";
NSString *const kMartshowHeaderThreeSquaresTarget = @"target";
NSString *const kMartshowHeaderThreeSquaresSid = @"sid";
NSString *const kMartshowHeaderThreeSquaresEnd = @"end";
NSString *const kMartshowHeaderThreeSquaresBegin = @"begin";


@interface MartshowHeaderThreeSquares ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MartshowHeaderThreeSquares

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
            self.buyingInfo = [self objectOrNilForKey:kMartshowHeaderThreeSquaresBuyingInfo fromDictionary:dict];
            self.login = [[self objectOrNilForKey:kMartshowHeaderThreeSquaresLogin fromDictionary:dict] doubleValue];
            self.rid = [[self objectOrNilForKey:kMartshowHeaderThreeSquaresRid fromDictionary:dict] doubleValue];
            self.priority = [[self objectOrNilForKey:kMartshowHeaderThreeSquaresPriority fromDictionary:dict] doubleValue];
            self.img = [self objectOrNilForKey:kMartshowHeaderThreeSquaresImg fromDictionary:dict];
            self.title = [self objectOrNilForKey:kMartshowHeaderThreeSquaresTitle fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kMartshowHeaderThreeSquaresDesc fromDictionary:dict];
            self.ver = [self objectOrNilForKey:kMartshowHeaderThreeSquaresVer fromDictionary:dict];
            self.target = [self objectOrNilForKey:kMartshowHeaderThreeSquaresTarget fromDictionary:dict];
            self.sid = [[self objectOrNilForKey:kMartshowHeaderThreeSquaresSid fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kMartshowHeaderThreeSquaresEnd fromDictionary:dict] doubleValue];
            self.begin = [[self objectOrNilForKey:kMartshowHeaderThreeSquaresBegin fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.buyingInfo forKey:kMartshowHeaderThreeSquaresBuyingInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.login] forKey:kMartshowHeaderThreeSquaresLogin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rid] forKey:kMartshowHeaderThreeSquaresRid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priority] forKey:kMartshowHeaderThreeSquaresPriority];
    [mutableDict setValue:self.img forKey:kMartshowHeaderThreeSquaresImg];
    [mutableDict setValue:self.title forKey:kMartshowHeaderThreeSquaresTitle];
    [mutableDict setValue:self.desc forKey:kMartshowHeaderThreeSquaresDesc];
    [mutableDict setValue:self.ver forKey:kMartshowHeaderThreeSquaresVer];
    [mutableDict setValue:self.target forKey:kMartshowHeaderThreeSquaresTarget];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sid] forKey:kMartshowHeaderThreeSquaresSid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kMartshowHeaderThreeSquaresEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.begin] forKey:kMartshowHeaderThreeSquaresBegin];

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

    self.buyingInfo = [aDecoder decodeObjectForKey:kMartshowHeaderThreeSquaresBuyingInfo];
    self.login = [aDecoder decodeDoubleForKey:kMartshowHeaderThreeSquaresLogin];
    self.rid = [aDecoder decodeDoubleForKey:kMartshowHeaderThreeSquaresRid];
    self.priority = [aDecoder decodeDoubleForKey:kMartshowHeaderThreeSquaresPriority];
    self.img = [aDecoder decodeObjectForKey:kMartshowHeaderThreeSquaresImg];
    self.title = [aDecoder decodeObjectForKey:kMartshowHeaderThreeSquaresTitle];
    self.desc = [aDecoder decodeObjectForKey:kMartshowHeaderThreeSquaresDesc];
    self.ver = [aDecoder decodeObjectForKey:kMartshowHeaderThreeSquaresVer];
    self.target = [aDecoder decodeObjectForKey:kMartshowHeaderThreeSquaresTarget];
    self.sid = [aDecoder decodeDoubleForKey:kMartshowHeaderThreeSquaresSid];
    self.endProperty = [aDecoder decodeDoubleForKey:kMartshowHeaderThreeSquaresEnd];
    self.begin = [aDecoder decodeDoubleForKey:kMartshowHeaderThreeSquaresBegin];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_buyingInfo forKey:kMartshowHeaderThreeSquaresBuyingInfo];
    [aCoder encodeDouble:_login forKey:kMartshowHeaderThreeSquaresLogin];
    [aCoder encodeDouble:_rid forKey:kMartshowHeaderThreeSquaresRid];
    [aCoder encodeDouble:_priority forKey:kMartshowHeaderThreeSquaresPriority];
    [aCoder encodeObject:_img forKey:kMartshowHeaderThreeSquaresImg];
    [aCoder encodeObject:_title forKey:kMartshowHeaderThreeSquaresTitle];
    [aCoder encodeObject:_desc forKey:kMartshowHeaderThreeSquaresDesc];
    [aCoder encodeObject:_ver forKey:kMartshowHeaderThreeSquaresVer];
    [aCoder encodeObject:_target forKey:kMartshowHeaderThreeSquaresTarget];
    [aCoder encodeDouble:_sid forKey:kMartshowHeaderThreeSquaresSid];
    [aCoder encodeDouble:_endProperty forKey:kMartshowHeaderThreeSquaresEnd];
    [aCoder encodeDouble:_begin forKey:kMartshowHeaderThreeSquaresBegin];
}

- (id)copyWithZone:(NSZone *)zone
{
    MartshowHeaderThreeSquares *copy = [[MartshowHeaderThreeSquares alloc] init];
    
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

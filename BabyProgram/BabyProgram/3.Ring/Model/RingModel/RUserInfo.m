//
//  RUserInfo.m
//
//  Created by zgt  on 16/3/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RUserInfo.h"


NSString *const kRUserInfoAvatar = @"avatar";
NSString *const kRUserInfoUid = @"uid";
NSString *const kRUserInfoVerificationType = @"verification_type";
NSString *const kRUserInfoNick = @"nick";
NSString *const kRUserInfoIsFollowed = @"is_followed";
NSString *const kRUserInfoVerificationText = @"verification_text";
NSString *const kRUserInfoUserType = @"user_type";
NSString *const kRUserInfoMallText = @"mall_text";


@interface RUserInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RUserInfo

@synthesize avatar = _avatar;
@synthesize uid = _uid;
@synthesize verificationType = _verificationType;
@synthesize nick = _nick;
@synthesize isFollowed = _isFollowed;
@synthesize verificationText = _verificationText;
@synthesize userType = _userType;
@synthesize mallText = _mallText;


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
            self.avatar = [self objectOrNilForKey:kRUserInfoAvatar fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kRUserInfoUid fromDictionary:dict];
            self.verificationType = [[self objectOrNilForKey:kRUserInfoVerificationType fromDictionary:dict] doubleValue];
            self.nick = [self objectOrNilForKey:kRUserInfoNick fromDictionary:dict];
            self.isFollowed = [[self objectOrNilForKey:kRUserInfoIsFollowed fromDictionary:dict] doubleValue];
            self.verificationText = [self objectOrNilForKey:kRUserInfoVerificationText fromDictionary:dict];
            self.userType = [self objectOrNilForKey:kRUserInfoUserType fromDictionary:dict];
            self.mallText = [self objectOrNilForKey:kRUserInfoMallText fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.avatar forKey:kRUserInfoAvatar];
    [mutableDict setValue:self.uid forKey:kRUserInfoUid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verificationType] forKey:kRUserInfoVerificationType];
    [mutableDict setValue:self.nick forKey:kRUserInfoNick];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFollowed] forKey:kRUserInfoIsFollowed];
    [mutableDict setValue:self.verificationText forKey:kRUserInfoVerificationText];
    [mutableDict setValue:self.userType forKey:kRUserInfoUserType];
    [mutableDict setValue:self.mallText forKey:kRUserInfoMallText];

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

    self.avatar = [aDecoder decodeObjectForKey:kRUserInfoAvatar];
    self.uid = [aDecoder decodeObjectForKey:kRUserInfoUid];
    self.verificationType = [aDecoder decodeDoubleForKey:kRUserInfoVerificationType];
    self.nick = [aDecoder decodeObjectForKey:kRUserInfoNick];
    self.isFollowed = [aDecoder decodeDoubleForKey:kRUserInfoIsFollowed];
    self.verificationText = [aDecoder decodeObjectForKey:kRUserInfoVerificationText];
    self.userType = [aDecoder decodeObjectForKey:kRUserInfoUserType];
    self.mallText = [aDecoder decodeObjectForKey:kRUserInfoMallText];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_avatar forKey:kRUserInfoAvatar];
    [aCoder encodeObject:_uid forKey:kRUserInfoUid];
    [aCoder encodeDouble:_verificationType forKey:kRUserInfoVerificationType];
    [aCoder encodeObject:_nick forKey:kRUserInfoNick];
    [aCoder encodeDouble:_isFollowed forKey:kRUserInfoIsFollowed];
    [aCoder encodeObject:_verificationText forKey:kRUserInfoVerificationText];
    [aCoder encodeObject:_userType forKey:kRUserInfoUserType];
    [aCoder encodeObject:_mallText forKey:kRUserInfoMallText];
}

- (id)copyWithZone:(NSZone *)zone
{
    RUserInfo *copy = [[RUserInfo alloc] init];
    
    if (copy) {

        copy.avatar = [self.avatar copyWithZone:zone];
        copy.uid = [self.uid copyWithZone:zone];
        copy.verificationType = self.verificationType;
        copy.nick = [self.nick copyWithZone:zone];
        copy.isFollowed = self.isFollowed;
        copy.verificationText = [self.verificationText copyWithZone:zone];
        copy.userType = [self.userType copyWithZone:zone];
        copy.mallText = [self.mallText copyWithZone:zone];
    }
    
    return copy;
}


@end

//
//  BMartshows.m
//
//  Created by zgt  on 16/3/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BMartshows.h"


NSString *const kBMartshowsEventType = @"event_type";
NSString *const kBMartshowsMid = @"mid";
NSString *const kBMartshowsTitle = @"title";
NSString *const kBMartshowsEventId = @"event_id";
NSString *const kBMartshowsMjPromotion = @"mj_promotion";


@interface BMartshows ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BMartshows

@synthesize eventType = _eventType;
@synthesize mid = _mid;
@synthesize title = _title;
@synthesize eventId = _eventId;
@synthesize mjPromotion = _mjPromotion;


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
            self.eventType = [self objectOrNilForKey:kBMartshowsEventType fromDictionary:dict];
            self.mid = [[self objectOrNilForKey:kBMartshowsMid fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kBMartshowsTitle fromDictionary:dict];
            self.eventId = [[self objectOrNilForKey:kBMartshowsEventId fromDictionary:dict] doubleValue];
            self.mjPromotion = [self objectOrNilForKey:kBMartshowsMjPromotion fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.eventType forKey:kBMartshowsEventType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mid] forKey:kBMartshowsMid];
    [mutableDict setValue:self.title forKey:kBMartshowsTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.eventId] forKey:kBMartshowsEventId];
    [mutableDict setValue:self.mjPromotion forKey:kBMartshowsMjPromotion];

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

    self.eventType = [aDecoder decodeObjectForKey:kBMartshowsEventType];
    self.mid = [aDecoder decodeDoubleForKey:kBMartshowsMid];
    self.title = [aDecoder decodeObjectForKey:kBMartshowsTitle];
    self.eventId = [aDecoder decodeDoubleForKey:kBMartshowsEventId];
    self.mjPromotion = [aDecoder decodeObjectForKey:kBMartshowsMjPromotion];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_eventType forKey:kBMartshowsEventType];
    [aCoder encodeDouble:_mid forKey:kBMartshowsMid];
    [aCoder encodeObject:_title forKey:kBMartshowsTitle];
    [aCoder encodeDouble:_eventId forKey:kBMartshowsEventId];
    [aCoder encodeObject:_mjPromotion forKey:kBMartshowsMjPromotion];
}

- (id)copyWithZone:(NSZone *)zone
{
    BMartshows *copy = [[BMartshows alloc] init];
    
    if (copy) {

        copy.eventType = [self.eventType copyWithZone:zone];
        copy.mid = self.mid;
        copy.title = [self.title copyWithZone:zone];
        copy.eventId = self.eventId;
        copy.mjPromotion = [self.mjPromotion copyWithZone:zone];
    }
    
    return copy;
}


@end

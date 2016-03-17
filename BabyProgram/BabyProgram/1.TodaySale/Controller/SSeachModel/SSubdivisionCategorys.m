//
//  SSubdivisionCategorys.m
//
//  Created by zgt  on 16/3/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SSubdivisionCategorys.h"


NSString *const kSSubdivisionCategorysFlag = @"flag";
NSString *const kSSubdivisionCategorysData = @"data";
NSString *const kSSubdivisionCategorysTitle = @"title";
NSString *const kSSubdivisionCategorysImg = @"img";
NSString *const kSSubdivisionCategorysDesc = @"desc";
NSString *const kSSubdivisionCategorysTarget = @"target";


@interface SSubdivisionCategorys ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SSubdivisionCategorys

@synthesize flag = _flag;
@synthesize data = _data;
@synthesize title = _title;
@synthesize img = _img;
@synthesize desc = _desc;
@synthesize target = _target;


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
            self.flag = [self objectOrNilForKey:kSSubdivisionCategorysFlag fromDictionary:dict];
            self.data = [self objectOrNilForKey:kSSubdivisionCategorysData fromDictionary:dict];
            self.title = [self objectOrNilForKey:kSSubdivisionCategorysTitle fromDictionary:dict];
            self.img = [self objectOrNilForKey:kSSubdivisionCategorysImg fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kSSubdivisionCategorysDesc fromDictionary:dict];
            self.target = [self objectOrNilForKey:kSSubdivisionCategorysTarget fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.flag forKey:kSSubdivisionCategorysFlag];
    [mutableDict setValue:self.data forKey:kSSubdivisionCategorysData];
    [mutableDict setValue:self.title forKey:kSSubdivisionCategorysTitle];
    [mutableDict setValue:self.img forKey:kSSubdivisionCategorysImg];
    [mutableDict setValue:self.desc forKey:kSSubdivisionCategorysDesc];
    [mutableDict setValue:self.target forKey:kSSubdivisionCategorysTarget];

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

    self.flag = [aDecoder decodeObjectForKey:kSSubdivisionCategorysFlag];
    self.data = [aDecoder decodeObjectForKey:kSSubdivisionCategorysData];
    self.title = [aDecoder decodeObjectForKey:kSSubdivisionCategorysTitle];
    self.img = [aDecoder decodeObjectForKey:kSSubdivisionCategorysImg];
    self.desc = [aDecoder decodeObjectForKey:kSSubdivisionCategorysDesc];
    self.target = [aDecoder decodeObjectForKey:kSSubdivisionCategorysTarget];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_flag forKey:kSSubdivisionCategorysFlag];
    [aCoder encodeObject:_data forKey:kSSubdivisionCategorysData];
    [aCoder encodeObject:_title forKey:kSSubdivisionCategorysTitle];
    [aCoder encodeObject:_img forKey:kSSubdivisionCategorysImg];
    [aCoder encodeObject:_desc forKey:kSSubdivisionCategorysDesc];
    [aCoder encodeObject:_target forKey:kSSubdivisionCategorysTarget];
}

- (id)copyWithZone:(NSZone *)zone
{
    SSubdivisionCategorys *copy = [[SSubdivisionCategorys alloc] init];
    
    if (copy) {

        copy.flag = [self.flag copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.img = [self.img copyWithZone:zone];
        copy.desc = [self.desc copyWithZone:zone];
        copy.target = [self.target copyWithZone:zone];
    }
    
    return copy;
}


@end

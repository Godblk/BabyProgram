//
//  CChildrenModel.m
//
//  Created by zgt  on 16/3/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CChildrenModel.h"
#import "CMartshows.h"


NSString *const kCChildrenModelMainImgWidth = @"main_img_width";
NSString *const kCChildrenModelMainImgHeight = @"main_img_height";
NSString *const kCChildrenModelTodayTipSubtitle = @"today_tip_subtitle";
NSString *const kCChildrenModelTodayTipTitle = @"today_tip_title";
NSString *const kCChildrenModelTag = @"tag";
NSString *const kCChildrenModelCount = @"count";
NSString *const kCChildrenModelMartshows = @"martshows";
NSString *const kCChildrenModelPage = @"page";
NSString *const kCChildrenModelPageSize = @"page_size";


@interface CChildrenModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CChildrenModel

@synthesize mainImgWidth = _mainImgWidth;
@synthesize mainImgHeight = _mainImgHeight;
@synthesize todayTipSubtitle = _todayTipSubtitle;
@synthesize todayTipTitle = _todayTipTitle;
@synthesize tag = _tag;
@synthesize count = _count;
@synthesize martshows = _martshows;
@synthesize page = _page;
@synthesize pageSize = _pageSize;


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
            self.mainImgWidth = [[self objectOrNilForKey:kCChildrenModelMainImgWidth fromDictionary:dict] doubleValue];
            self.mainImgHeight = [[self objectOrNilForKey:kCChildrenModelMainImgHeight fromDictionary:dict] doubleValue];
            self.todayTipSubtitle = [self objectOrNilForKey:kCChildrenModelTodayTipSubtitle fromDictionary:dict];
            self.todayTipTitle = [self objectOrNilForKey:kCChildrenModelTodayTipTitle fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kCChildrenModelTag fromDictionary:dict];
            self.count = [[self objectOrNilForKey:kCChildrenModelCount fromDictionary:dict] doubleValue];
    NSObject *receivedCMartshows = [dict objectForKey:kCChildrenModelMartshows];
    NSMutableArray *parsedCMartshows = [NSMutableArray array];
    if ([receivedCMartshows isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCMartshows) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCMartshows addObject:[CMartshows modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCMartshows isKindOfClass:[NSDictionary class]]) {
       [parsedCMartshows addObject:[CMartshows modelObjectWithDictionary:(NSDictionary *)receivedCMartshows]];
    }

    self.martshows = [NSArray arrayWithArray:parsedCMartshows];
            self.page = [[self objectOrNilForKey:kCChildrenModelPage fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kCChildrenModelPageSize fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mainImgWidth] forKey:kCChildrenModelMainImgWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mainImgHeight] forKey:kCChildrenModelMainImgHeight];
    [mutableDict setValue:self.todayTipSubtitle forKey:kCChildrenModelTodayTipSubtitle];
    [mutableDict setValue:self.todayTipTitle forKey:kCChildrenModelTodayTipTitle];
    [mutableDict setValue:self.tag forKey:kCChildrenModelTag];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kCChildrenModelCount];
    NSMutableArray *tempArrayForMartshows = [NSMutableArray array];
    for (NSObject *subArrayObject in self.martshows) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMartshows addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMartshows addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMartshows] forKey:kCChildrenModelMartshows];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kCChildrenModelPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kCChildrenModelPageSize];

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

    self.mainImgWidth = [aDecoder decodeDoubleForKey:kCChildrenModelMainImgWidth];
    self.mainImgHeight = [aDecoder decodeDoubleForKey:kCChildrenModelMainImgHeight];
    self.todayTipSubtitle = [aDecoder decodeObjectForKey:kCChildrenModelTodayTipSubtitle];
    self.todayTipTitle = [aDecoder decodeObjectForKey:kCChildrenModelTodayTipTitle];
    self.tag = [aDecoder decodeObjectForKey:kCChildrenModelTag];
    self.count = [aDecoder decodeDoubleForKey:kCChildrenModelCount];
    self.martshows = [aDecoder decodeObjectForKey:kCChildrenModelMartshows];
    self.page = [aDecoder decodeDoubleForKey:kCChildrenModelPage];
    self.pageSize = [aDecoder decodeDoubleForKey:kCChildrenModelPageSize];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_mainImgWidth forKey:kCChildrenModelMainImgWidth];
    [aCoder encodeDouble:_mainImgHeight forKey:kCChildrenModelMainImgHeight];
    [aCoder encodeObject:_todayTipSubtitle forKey:kCChildrenModelTodayTipSubtitle];
    [aCoder encodeObject:_todayTipTitle forKey:kCChildrenModelTodayTipTitle];
    [aCoder encodeObject:_tag forKey:kCChildrenModelTag];
    [aCoder encodeDouble:_count forKey:kCChildrenModelCount];
    [aCoder encodeObject:_martshows forKey:kCChildrenModelMartshows];
    [aCoder encodeDouble:_page forKey:kCChildrenModelPage];
    [aCoder encodeDouble:_pageSize forKey:kCChildrenModelPageSize];
}

- (id)copyWithZone:(NSZone *)zone
{
    CChildrenModel *copy = [[CChildrenModel alloc] init];
    
    if (copy) {

        copy.mainImgWidth = self.mainImgWidth;
        copy.mainImgHeight = self.mainImgHeight;
        copy.todayTipSubtitle = [self.todayTipSubtitle copyWithZone:zone];
        copy.todayTipTitle = [self.todayTipTitle copyWithZone:zone];
        copy.tag = [self.tag copyWithZone:zone];
        copy.count = self.count;
        copy.martshows = [self.martshows copyWithZone:zone];
        copy.page = self.page;
        copy.pageSize = self.pageSize;
    }
    
    return copy;
}


@end

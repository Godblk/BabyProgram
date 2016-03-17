//
//  CMartshows.m
//
//  Created by zgt  on 16/3/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CMartshows.h"
#import "CMsItems.h"


NSString *const kCMartshowsMjIcon = @"mj_icon";
NSString *const kCMartshowsGmtBegin = @"gmt_begin";
NSString *const kCMartshowsTitle = @"title";
NSString *const kCMartshowsMid = @"mid";
NSString *const kCMartshowsGmtEnd = @"gmt_end";
NSString *const kCMartshowsMjPromotion = @"mj_promotion";
NSString *const kCMartshowsBrand = @"brand";
NSString *const kCMartshowsBuyingInfo = @"buying_info";
NSString *const kCMartshowsDiscount = @"discount";
NSString *const kCMartshowsStock = @"stock";
NSString *const kCMartshowsBrandStory = @"brand_story";
NSString *const kCMartshowsBrandId = @"brand_id";
NSString *const kCMartshowsSellerTitle = @"seller_title";
NSString *const kCMartshowsCustomLabelImgPosition = @"custom_label_img_position";
NSString *const kCMartshowsEventId = @"event_id";
NSString *const kCMartshowsMainImg = @"main_img";
NSString *const kCMartshowsPromotion = @"promotion";
NSString *const kCMartshowsItemCount = @"item_count";
NSString *const kCMartshowsLogo = @"logo";
NSString *const kCMartshowsCustomLabelImg = @"custom_label_img";
NSString *const kCMartshowsMsItems = @"ms_items";
NSString *const kCMartshowsBid = @"bid";


@interface CMartshows ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CMartshows

@synthesize mjIcon = _mjIcon;
@synthesize gmtBegin = _gmtBegin;
@synthesize title = _title;
@synthesize mid = _mid;
@synthesize gmtEnd = _gmtEnd;
@synthesize mjPromotion = _mjPromotion;
@synthesize brand = _brand;
@synthesize buyingInfo = _buyingInfo;
@synthesize discount = _discount;
@synthesize stock = _stock;
@synthesize brandStory = _brandStory;
@synthesize brandId = _brandId;
@synthesize sellerTitle = _sellerTitle;
@synthesize customLabelImgPosition = _customLabelImgPosition;
@synthesize eventId = _eventId;
@synthesize mainImg = _mainImg;
@synthesize promotion = _promotion;
@synthesize itemCount = _itemCount;
@synthesize logo = _logo;
@synthesize customLabelImg = _customLabelImg;
@synthesize msItems = _msItems;
@synthesize bid = _bid;


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
            self.mjIcon = [self objectOrNilForKey:kCMartshowsMjIcon fromDictionary:dict];
            self.gmtBegin = [[self objectOrNilForKey:kCMartshowsGmtBegin fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kCMartshowsTitle fromDictionary:dict];
            self.mid = [[self objectOrNilForKey:kCMartshowsMid fromDictionary:dict] doubleValue];
            self.gmtEnd = [self objectOrNilForKey:kCMartshowsGmtEnd fromDictionary:dict];
            self.mjPromotion = [self objectOrNilForKey:kCMartshowsMjPromotion fromDictionary:dict];
            self.brand = [self objectOrNilForKey:kCMartshowsBrand fromDictionary:dict];
            self.buyingInfo = [self objectOrNilForKey:kCMartshowsBuyingInfo fromDictionary:dict];
            self.discount = [[self objectOrNilForKey:kCMartshowsDiscount fromDictionary:dict] doubleValue];
            self.stock = [[self objectOrNilForKey:kCMartshowsStock fromDictionary:dict] doubleValue];
            self.brandStory = [self objectOrNilForKey:kCMartshowsBrandStory fromDictionary:dict];
            self.brandId = [[self objectOrNilForKey:kCMartshowsBrandId fromDictionary:dict] doubleValue];
            self.sellerTitle = [self objectOrNilForKey:kCMartshowsSellerTitle fromDictionary:dict];
            self.customLabelImgPosition = [self objectOrNilForKey:kCMartshowsCustomLabelImgPosition fromDictionary:dict];
            self.eventId = [[self objectOrNilForKey:kCMartshowsEventId fromDictionary:dict] doubleValue];
            self.mainImg = [self objectOrNilForKey:kCMartshowsMainImg fromDictionary:dict];
            self.promotion = [self objectOrNilForKey:kCMartshowsPromotion fromDictionary:dict];
            self.itemCount = [[self objectOrNilForKey:kCMartshowsItemCount fromDictionary:dict] doubleValue];
            self.logo = [self objectOrNilForKey:kCMartshowsLogo fromDictionary:dict];
            self.customLabelImg = [self objectOrNilForKey:kCMartshowsCustomLabelImg fromDictionary:dict];
    NSObject *receivedCMsItems = [dict objectForKey:kCMartshowsMsItems];
    NSMutableArray *parsedCMsItems = [NSMutableArray array];
    if ([receivedCMsItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCMsItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCMsItems addObject:[CMsItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCMsItems isKindOfClass:[NSDictionary class]]) {
       [parsedCMsItems addObject:[CMsItems modelObjectWithDictionary:(NSDictionary *)receivedCMsItems]];
    }

    self.msItems = [NSArray arrayWithArray:parsedCMsItems];
            self.bid = [[self objectOrNilForKey:kCMartshowsBid fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.mjIcon forKey:kCMartshowsMjIcon];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gmtBegin] forKey:kCMartshowsGmtBegin];
    [mutableDict setValue:self.title forKey:kCMartshowsTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mid] forKey:kCMartshowsMid];
    [mutableDict setValue:self.gmtEnd forKey:kCMartshowsGmtEnd];
    [mutableDict setValue:self.mjPromotion forKey:kCMartshowsMjPromotion];
    [mutableDict setValue:self.brand forKey:kCMartshowsBrand];
    [mutableDict setValue:self.buyingInfo forKey:kCMartshowsBuyingInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.discount] forKey:kCMartshowsDiscount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.stock] forKey:kCMartshowsStock];
    [mutableDict setValue:self.brandStory forKey:kCMartshowsBrandStory];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandId] forKey:kCMartshowsBrandId];
    [mutableDict setValue:self.sellerTitle forKey:kCMartshowsSellerTitle];
    NSMutableArray *tempArrayForCustomLabelImgPosition = [NSMutableArray array];
    for (NSObject *subArrayObject in self.customLabelImgPosition) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCustomLabelImgPosition addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCustomLabelImgPosition addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomLabelImgPosition] forKey:kCMartshowsCustomLabelImgPosition];
    [mutableDict setValue:[NSNumber numberWithDouble:self.eventId] forKey:kCMartshowsEventId];
    [mutableDict setValue:self.mainImg forKey:kCMartshowsMainImg];
    [mutableDict setValue:self.promotion forKey:kCMartshowsPromotion];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemCount] forKey:kCMartshowsItemCount];
    [mutableDict setValue:self.logo forKey:kCMartshowsLogo];
    [mutableDict setValue:self.customLabelImg forKey:kCMartshowsCustomLabelImg];
    NSMutableArray *tempArrayForMsItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.msItems) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMsItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMsItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMsItems] forKey:kCMartshowsMsItems];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bid] forKey:kCMartshowsBid];

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

    self.mjIcon = [aDecoder decodeObjectForKey:kCMartshowsMjIcon];
    self.gmtBegin = [aDecoder decodeDoubleForKey:kCMartshowsGmtBegin];
    self.title = [aDecoder decodeObjectForKey:kCMartshowsTitle];
    self.mid = [aDecoder decodeDoubleForKey:kCMartshowsMid];
    self.gmtEnd = [aDecoder decodeObjectForKey:kCMartshowsGmtEnd];
    self.mjPromotion = [aDecoder decodeObjectForKey:kCMartshowsMjPromotion];
    self.brand = [aDecoder decodeObjectForKey:kCMartshowsBrand];
    self.buyingInfo = [aDecoder decodeObjectForKey:kCMartshowsBuyingInfo];
    self.discount = [aDecoder decodeDoubleForKey:kCMartshowsDiscount];
    self.stock = [aDecoder decodeDoubleForKey:kCMartshowsStock];
    self.brandStory = [aDecoder decodeObjectForKey:kCMartshowsBrandStory];
    self.brandId = [aDecoder decodeDoubleForKey:kCMartshowsBrandId];
    self.sellerTitle = [aDecoder decodeObjectForKey:kCMartshowsSellerTitle];
    self.customLabelImgPosition = [aDecoder decodeObjectForKey:kCMartshowsCustomLabelImgPosition];
    self.eventId = [aDecoder decodeDoubleForKey:kCMartshowsEventId];
    self.mainImg = [aDecoder decodeObjectForKey:kCMartshowsMainImg];
    self.promotion = [aDecoder decodeObjectForKey:kCMartshowsPromotion];
    self.itemCount = [aDecoder decodeDoubleForKey:kCMartshowsItemCount];
    self.logo = [aDecoder decodeObjectForKey:kCMartshowsLogo];
    self.customLabelImg = [aDecoder decodeObjectForKey:kCMartshowsCustomLabelImg];
    self.msItems = [aDecoder decodeObjectForKey:kCMartshowsMsItems];
    self.bid = [aDecoder decodeDoubleForKey:kCMartshowsBid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_mjIcon forKey:kCMartshowsMjIcon];
    [aCoder encodeDouble:_gmtBegin forKey:kCMartshowsGmtBegin];
    [aCoder encodeObject:_title forKey:kCMartshowsTitle];
    [aCoder encodeDouble:_mid forKey:kCMartshowsMid];
    [aCoder encodeObject:_gmtEnd forKey:kCMartshowsGmtEnd];
    [aCoder encodeObject:_mjPromotion forKey:kCMartshowsMjPromotion];
    [aCoder encodeObject:_brand forKey:kCMartshowsBrand];
    [aCoder encodeObject:_buyingInfo forKey:kCMartshowsBuyingInfo];
    [aCoder encodeDouble:_discount forKey:kCMartshowsDiscount];
    [aCoder encodeDouble:_stock forKey:kCMartshowsStock];
    [aCoder encodeObject:_brandStory forKey:kCMartshowsBrandStory];
    [aCoder encodeDouble:_brandId forKey:kCMartshowsBrandId];
    [aCoder encodeObject:_sellerTitle forKey:kCMartshowsSellerTitle];
    [aCoder encodeObject:_customLabelImgPosition forKey:kCMartshowsCustomLabelImgPosition];
    [aCoder encodeDouble:_eventId forKey:kCMartshowsEventId];
    [aCoder encodeObject:_mainImg forKey:kCMartshowsMainImg];
    [aCoder encodeObject:_promotion forKey:kCMartshowsPromotion];
    [aCoder encodeDouble:_itemCount forKey:kCMartshowsItemCount];
    [aCoder encodeObject:_logo forKey:kCMartshowsLogo];
    [aCoder encodeObject:_customLabelImg forKey:kCMartshowsCustomLabelImg];
    [aCoder encodeObject:_msItems forKey:kCMartshowsMsItems];
    [aCoder encodeDouble:_bid forKey:kCMartshowsBid];
}

- (id)copyWithZone:(NSZone *)zone
{
    CMartshows *copy = [[CMartshows alloc] init];
    
    if (copy) {

        copy.mjIcon = [self.mjIcon copyWithZone:zone];
        copy.gmtBegin = self.gmtBegin;
        copy.title = [self.title copyWithZone:zone];
        copy.mid = self.mid;
        copy.gmtEnd = [self.gmtEnd copyWithZone:zone];
        copy.mjPromotion = [self.mjPromotion copyWithZone:zone];
        copy.brand = [self.brand copyWithZone:zone];
        copy.buyingInfo = [self.buyingInfo copyWithZone:zone];
        copy.discount = self.discount;
        copy.stock = self.stock;
        copy.brandStory = [self.brandStory copyWithZone:zone];
        copy.brandId = self.brandId;
        copy.sellerTitle = [self.sellerTitle copyWithZone:zone];
        copy.customLabelImgPosition = [self.customLabelImgPosition copyWithZone:zone];
        copy.eventId = self.eventId;
        copy.mainImg = [self.mainImg copyWithZone:zone];
        copy.promotion = [self.promotion copyWithZone:zone];
        copy.itemCount = self.itemCount;
        copy.logo = [self.logo copyWithZone:zone];
        copy.customLabelImg = [self.customLabelImg copyWithZone:zone];
        copy.msItems = [self.msItems copyWithZone:zone];
        copy.bid = self.bid;
    }
    
    return copy;
}


@end

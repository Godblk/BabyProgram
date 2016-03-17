//
//  TodaySaleObjcModel.m
//
//  Created by zgt  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "TodaySaleObjcModel.h"
#import "PromotionProShortcuts.h"
#import "PromotionLoopShortcuts.h"
#import "IconShortcuts.h"
#import "MartshowHeaderBanners.h"
#import "PopupAds.h"
#import "MartshowInsertBanners.h"
#import "MartshowHeaderThreeSquares.h"
#import "Ads.h"


NSString *const kTodaySaleObjcModelMartshowInsertSquares = @"martshow_insert_squares";
NSString *const kTodaySaleObjcModelPromotionProShortcuts = @"promotion_pro_shortcuts";
NSString *const kTodaySaleObjcModelPromotionLoopShortcuts = @"promotion_loop_shortcuts";
NSString *const kTodaySaleObjcModelMartshowHeaderTwoSquares = @"martshow_header_two_squares";
NSString *const kTodaySaleObjcModelHomeHtmlAds = @"home_html_ads";
NSString *const kTodaySaleObjcModelTopPromotionBanners = @"top_promotion_banners";
NSString *const kTodaySaleObjcModelActivityShortcuts = @"activity_shortcuts";
NSString *const kTodaySaleObjcModelLatestConfigTime = @"latest_config_time";
NSString *const kTodaySaleObjcModelIconShortcuts = @"icon_shortcuts";
NSString *const kTodaySaleObjcModelMartshowHeaderBanners = @"martshow_header_banners";
NSString *const kTodaySaleObjcModelCtcBottomPopupAds = @"ctc_bottom_popup_ads";
NSString *const kTodaySaleObjcModelPopupAds = @"popup_ads";
NSString *const kTodaySaleObjcModelMartshowInsertBanners = @"martshow_insert_banners";
NSString *const kTodaySaleObjcModelMartshowHeaderThreeSquares = @"martshow_header_three_squares";
NSString *const kTodaySaleObjcModelOldMartshowAds = @"old_martshow_ads";
NSString *const kTodaySaleObjcModelMartshowPosterBanners = @"martshow_poster_banners";
NSString *const kTodaySaleObjcModelAds = @"ads";


@interface TodaySaleObjcModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TodaySaleObjcModel

@synthesize martshowInsertSquares = _martshowInsertSquares;
@synthesize promotionProShortcuts = _promotionProShortcuts;
@synthesize promotionLoopShortcuts = _promotionLoopShortcuts;
@synthesize martshowHeaderTwoSquares = _martshowHeaderTwoSquares;
@synthesize homeHtmlAds = _homeHtmlAds;
@synthesize topPromotionBanners = _topPromotionBanners;
@synthesize activityShortcuts = _activityShortcuts;
@synthesize latestConfigTime = _latestConfigTime;
@synthesize iconShortcuts = _iconShortcuts;
@synthesize martshowHeaderBanners = _martshowHeaderBanners;
@synthesize ctcBottomPopupAds = _ctcBottomPopupAds;
@synthesize popupAds = _popupAds;
@synthesize martshowInsertBanners = _martshowInsertBanners;
@synthesize martshowHeaderThreeSquares = _martshowHeaderThreeSquares;
@synthesize oldMartshowAds = _oldMartshowAds;
@synthesize martshowPosterBanners = _martshowPosterBanners;
@synthesize ads = _ads;


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
            self.martshowInsertSquares = [self objectOrNilForKey:kTodaySaleObjcModelMartshowInsertSquares fromDictionary:dict];
    NSObject *receivedPromotionProShortcuts = [dict objectForKey:kTodaySaleObjcModelPromotionProShortcuts];
    NSMutableArray *parsedPromotionProShortcuts = [NSMutableArray array];
    if ([receivedPromotionProShortcuts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPromotionProShortcuts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPromotionProShortcuts addObject:[PromotionProShortcuts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPromotionProShortcuts isKindOfClass:[NSDictionary class]]) {
       [parsedPromotionProShortcuts addObject:[PromotionProShortcuts modelObjectWithDictionary:(NSDictionary *)receivedPromotionProShortcuts]];
    }

    self.promotionProShortcuts = [NSArray arrayWithArray:parsedPromotionProShortcuts];
    NSObject *receivedPromotionLoopShortcuts = [dict objectForKey:kTodaySaleObjcModelPromotionLoopShortcuts];
    NSMutableArray *parsedPromotionLoopShortcuts = [NSMutableArray array];
    if ([receivedPromotionLoopShortcuts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPromotionLoopShortcuts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPromotionLoopShortcuts addObject:[PromotionLoopShortcuts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPromotionLoopShortcuts isKindOfClass:[NSDictionary class]]) {
       [parsedPromotionLoopShortcuts addObject:[PromotionLoopShortcuts modelObjectWithDictionary:(NSDictionary *)receivedPromotionLoopShortcuts]];
    }

    self.promotionLoopShortcuts = [NSArray arrayWithArray:parsedPromotionLoopShortcuts];
            self.martshowHeaderTwoSquares = [self objectOrNilForKey:kTodaySaleObjcModelMartshowHeaderTwoSquares fromDictionary:dict];
            self.homeHtmlAds = [self objectOrNilForKey:kTodaySaleObjcModelHomeHtmlAds fromDictionary:dict];
            self.topPromotionBanners = [self objectOrNilForKey:kTodaySaleObjcModelTopPromotionBanners fromDictionary:dict];
            self.activityShortcuts = [self objectOrNilForKey:kTodaySaleObjcModelActivityShortcuts fromDictionary:dict];
            self.latestConfigTime = [[self objectOrNilForKey:kTodaySaleObjcModelLatestConfigTime fromDictionary:dict] doubleValue];
    NSObject *receivedIconShortcuts = [dict objectForKey:kTodaySaleObjcModelIconShortcuts];
    NSMutableArray *parsedIconShortcuts = [NSMutableArray array];
    if ([receivedIconShortcuts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedIconShortcuts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedIconShortcuts addObject:[IconShortcuts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedIconShortcuts isKindOfClass:[NSDictionary class]]) {
       [parsedIconShortcuts addObject:[IconShortcuts modelObjectWithDictionary:(NSDictionary *)receivedIconShortcuts]];
    }

    self.iconShortcuts = [NSArray arrayWithArray:parsedIconShortcuts];
    NSObject *receivedMartshowHeaderBanners = [dict objectForKey:kTodaySaleObjcModelMartshowHeaderBanners];
    NSMutableArray *parsedMartshowHeaderBanners = [NSMutableArray array];
    if ([receivedMartshowHeaderBanners isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMartshowHeaderBanners) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMartshowHeaderBanners addObject:[MartshowHeaderBanners modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMartshowHeaderBanners isKindOfClass:[NSDictionary class]]) {
       [parsedMartshowHeaderBanners addObject:[MartshowHeaderBanners modelObjectWithDictionary:(NSDictionary *)receivedMartshowHeaderBanners]];
    }

    self.martshowHeaderBanners = [NSArray arrayWithArray:parsedMartshowHeaderBanners];
            self.ctcBottomPopupAds = [self objectOrNilForKey:kTodaySaleObjcModelCtcBottomPopupAds fromDictionary:dict];
    NSObject *receivedPopupAds = [dict objectForKey:kTodaySaleObjcModelPopupAds];
    NSMutableArray *parsedPopupAds = [NSMutableArray array];
    if ([receivedPopupAds isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPopupAds) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPopupAds addObject:[PopupAds modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPopupAds isKindOfClass:[NSDictionary class]]) {
       [parsedPopupAds addObject:[PopupAds modelObjectWithDictionary:(NSDictionary *)receivedPopupAds]];
    }

    self.popupAds = [NSArray arrayWithArray:parsedPopupAds];
    NSObject *receivedMartshowInsertBanners = [dict objectForKey:kTodaySaleObjcModelMartshowInsertBanners];
    NSMutableArray *parsedMartshowInsertBanners = [NSMutableArray array];
    if ([receivedMartshowInsertBanners isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMartshowInsertBanners) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMartshowInsertBanners addObject:[MartshowInsertBanners modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMartshowInsertBanners isKindOfClass:[NSDictionary class]]) {
       [parsedMartshowInsertBanners addObject:[MartshowInsertBanners modelObjectWithDictionary:(NSDictionary *)receivedMartshowInsertBanners]];
    }

    self.martshowInsertBanners = [NSArray arrayWithArray:parsedMartshowInsertBanners];
    NSObject *receivedMartshowHeaderThreeSquares = [dict objectForKey:kTodaySaleObjcModelMartshowHeaderThreeSquares];
    NSMutableArray *parsedMartshowHeaderThreeSquares = [NSMutableArray array];
    if ([receivedMartshowHeaderThreeSquares isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMartshowHeaderThreeSquares) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMartshowHeaderThreeSquares addObject:[MartshowHeaderThreeSquares modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMartshowHeaderThreeSquares isKindOfClass:[NSDictionary class]]) {
       [parsedMartshowHeaderThreeSquares addObject:[MartshowHeaderThreeSquares modelObjectWithDictionary:(NSDictionary *)receivedMartshowHeaderThreeSquares]];
    }

    self.martshowHeaderThreeSquares = [NSArray arrayWithArray:parsedMartshowHeaderThreeSquares];
            self.oldMartshowAds = [self objectOrNilForKey:kTodaySaleObjcModelOldMartshowAds fromDictionary:dict];
            self.martshowPosterBanners = [self objectOrNilForKey:kTodaySaleObjcModelMartshowPosterBanners fromDictionary:dict];
    NSObject *receivedAds = [dict objectForKey:kTodaySaleObjcModelAds];
    NSMutableArray *parsedAds = [NSMutableArray array];
    if ([receivedAds isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAds) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAds addObject:[Ads modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAds isKindOfClass:[NSDictionary class]]) {
       [parsedAds addObject:[Ads modelObjectWithDictionary:(NSDictionary *)receivedAds]];
    }

    self.ads = [NSArray arrayWithArray:parsedAds];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForMartshowInsertSquares = [NSMutableArray array];
    for (NSObject *subArrayObject in self.martshowInsertSquares) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMartshowInsertSquares addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMartshowInsertSquares addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMartshowInsertSquares] forKey:kTodaySaleObjcModelMartshowInsertSquares];
    NSMutableArray *tempArrayForPromotionProShortcuts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.promotionProShortcuts) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPromotionProShortcuts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPromotionProShortcuts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPromotionProShortcuts] forKey:kTodaySaleObjcModelPromotionProShortcuts];
    NSMutableArray *tempArrayForPromotionLoopShortcuts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.promotionLoopShortcuts) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPromotionLoopShortcuts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPromotionLoopShortcuts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPromotionLoopShortcuts] forKey:kTodaySaleObjcModelPromotionLoopShortcuts];
    NSMutableArray *tempArrayForMartshowHeaderTwoSquares = [NSMutableArray array];
    for (NSObject *subArrayObject in self.martshowHeaderTwoSquares) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMartshowHeaderTwoSquares addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMartshowHeaderTwoSquares addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMartshowHeaderTwoSquares] forKey:kTodaySaleObjcModelMartshowHeaderTwoSquares];
    NSMutableArray *tempArrayForHomeHtmlAds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.homeHtmlAds) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHomeHtmlAds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHomeHtmlAds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHomeHtmlAds] forKey:kTodaySaleObjcModelHomeHtmlAds];
    NSMutableArray *tempArrayForTopPromotionBanners = [NSMutableArray array];
    for (NSObject *subArrayObject in self.topPromotionBanners) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTopPromotionBanners addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTopPromotionBanners addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTopPromotionBanners] forKey:kTodaySaleObjcModelTopPromotionBanners];
    NSMutableArray *tempArrayForActivityShortcuts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.activityShortcuts) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForActivityShortcuts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForActivityShortcuts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForActivityShortcuts] forKey:kTodaySaleObjcModelActivityShortcuts];
    [mutableDict setValue:[NSNumber numberWithDouble:self.latestConfigTime] forKey:kTodaySaleObjcModelLatestConfigTime];
    NSMutableArray *tempArrayForIconShortcuts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.iconShortcuts) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForIconShortcuts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForIconShortcuts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForIconShortcuts] forKey:kTodaySaleObjcModelIconShortcuts];
    NSMutableArray *tempArrayForMartshowHeaderBanners = [NSMutableArray array];
    for (NSObject *subArrayObject in self.martshowHeaderBanners) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMartshowHeaderBanners addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMartshowHeaderBanners addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMartshowHeaderBanners] forKey:kTodaySaleObjcModelMartshowHeaderBanners];
    NSMutableArray *tempArrayForCtcBottomPopupAds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.ctcBottomPopupAds) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCtcBottomPopupAds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCtcBottomPopupAds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCtcBottomPopupAds] forKey:kTodaySaleObjcModelCtcBottomPopupAds];
    NSMutableArray *tempArrayForPopupAds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.popupAds) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPopupAds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPopupAds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPopupAds] forKey:kTodaySaleObjcModelPopupAds];
    NSMutableArray *tempArrayForMartshowInsertBanners = [NSMutableArray array];
    for (NSObject *subArrayObject in self.martshowInsertBanners) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMartshowInsertBanners addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMartshowInsertBanners addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMartshowInsertBanners] forKey:kTodaySaleObjcModelMartshowInsertBanners];
    NSMutableArray *tempArrayForMartshowHeaderThreeSquares = [NSMutableArray array];
    for (NSObject *subArrayObject in self.martshowHeaderThreeSquares) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMartshowHeaderThreeSquares addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMartshowHeaderThreeSquares addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMartshowHeaderThreeSquares] forKey:kTodaySaleObjcModelMartshowHeaderThreeSquares];
    NSMutableArray *tempArrayForOldMartshowAds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.oldMartshowAds) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForOldMartshowAds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForOldMartshowAds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOldMartshowAds] forKey:kTodaySaleObjcModelOldMartshowAds];
    NSMutableArray *tempArrayForMartshowPosterBanners = [NSMutableArray array];
    for (NSObject *subArrayObject in self.martshowPosterBanners) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMartshowPosterBanners addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMartshowPosterBanners addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMartshowPosterBanners] forKey:kTodaySaleObjcModelMartshowPosterBanners];
    NSMutableArray *tempArrayForAds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.ads) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAds] forKey:kTodaySaleObjcModelAds];

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

    self.martshowInsertSquares = [aDecoder decodeObjectForKey:kTodaySaleObjcModelMartshowInsertSquares];
    self.promotionProShortcuts = [aDecoder decodeObjectForKey:kTodaySaleObjcModelPromotionProShortcuts];
    self.promotionLoopShortcuts = [aDecoder decodeObjectForKey:kTodaySaleObjcModelPromotionLoopShortcuts];
    self.martshowHeaderTwoSquares = [aDecoder decodeObjectForKey:kTodaySaleObjcModelMartshowHeaderTwoSquares];
    self.homeHtmlAds = [aDecoder decodeObjectForKey:kTodaySaleObjcModelHomeHtmlAds];
    self.topPromotionBanners = [aDecoder decodeObjectForKey:kTodaySaleObjcModelTopPromotionBanners];
    self.activityShortcuts = [aDecoder decodeObjectForKey:kTodaySaleObjcModelActivityShortcuts];
    self.latestConfigTime = [aDecoder decodeDoubleForKey:kTodaySaleObjcModelLatestConfigTime];
    self.iconShortcuts = [aDecoder decodeObjectForKey:kTodaySaleObjcModelIconShortcuts];
    self.martshowHeaderBanners = [aDecoder decodeObjectForKey:kTodaySaleObjcModelMartshowHeaderBanners];
    self.ctcBottomPopupAds = [aDecoder decodeObjectForKey:kTodaySaleObjcModelCtcBottomPopupAds];
    self.popupAds = [aDecoder decodeObjectForKey:kTodaySaleObjcModelPopupAds];
    self.martshowInsertBanners = [aDecoder decodeObjectForKey:kTodaySaleObjcModelMartshowInsertBanners];
    self.martshowHeaderThreeSquares = [aDecoder decodeObjectForKey:kTodaySaleObjcModelMartshowHeaderThreeSquares];
    self.oldMartshowAds = [aDecoder decodeObjectForKey:kTodaySaleObjcModelOldMartshowAds];
    self.martshowPosterBanners = [aDecoder decodeObjectForKey:kTodaySaleObjcModelMartshowPosterBanners];
    self.ads = [aDecoder decodeObjectForKey:kTodaySaleObjcModelAds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_martshowInsertSquares forKey:kTodaySaleObjcModelMartshowInsertSquares];
    [aCoder encodeObject:_promotionProShortcuts forKey:kTodaySaleObjcModelPromotionProShortcuts];
    [aCoder encodeObject:_promotionLoopShortcuts forKey:kTodaySaleObjcModelPromotionLoopShortcuts];
    [aCoder encodeObject:_martshowHeaderTwoSquares forKey:kTodaySaleObjcModelMartshowHeaderTwoSquares];
    [aCoder encodeObject:_homeHtmlAds forKey:kTodaySaleObjcModelHomeHtmlAds];
    [aCoder encodeObject:_topPromotionBanners forKey:kTodaySaleObjcModelTopPromotionBanners];
    [aCoder encodeObject:_activityShortcuts forKey:kTodaySaleObjcModelActivityShortcuts];
    [aCoder encodeDouble:_latestConfigTime forKey:kTodaySaleObjcModelLatestConfigTime];
    [aCoder encodeObject:_iconShortcuts forKey:kTodaySaleObjcModelIconShortcuts];
    [aCoder encodeObject:_martshowHeaderBanners forKey:kTodaySaleObjcModelMartshowHeaderBanners];
    [aCoder encodeObject:_ctcBottomPopupAds forKey:kTodaySaleObjcModelCtcBottomPopupAds];
    [aCoder encodeObject:_popupAds forKey:kTodaySaleObjcModelPopupAds];
    [aCoder encodeObject:_martshowInsertBanners forKey:kTodaySaleObjcModelMartshowInsertBanners];
    [aCoder encodeObject:_martshowHeaderThreeSquares forKey:kTodaySaleObjcModelMartshowHeaderThreeSquares];
    [aCoder encodeObject:_oldMartshowAds forKey:kTodaySaleObjcModelOldMartshowAds];
    [aCoder encodeObject:_martshowPosterBanners forKey:kTodaySaleObjcModelMartshowPosterBanners];
    [aCoder encodeObject:_ads forKey:kTodaySaleObjcModelAds];
}

- (id)copyWithZone:(NSZone *)zone
{
    TodaySaleObjcModel *copy = [[TodaySaleObjcModel alloc] init];
    
    if (copy) {

        copy.martshowInsertSquares = [self.martshowInsertSquares copyWithZone:zone];
        copy.promotionProShortcuts = [self.promotionProShortcuts copyWithZone:zone];
        copy.promotionLoopShortcuts = [self.promotionLoopShortcuts copyWithZone:zone];
        copy.martshowHeaderTwoSquares = [self.martshowHeaderTwoSquares copyWithZone:zone];
        copy.homeHtmlAds = [self.homeHtmlAds copyWithZone:zone];
        copy.topPromotionBanners = [self.topPromotionBanners copyWithZone:zone];
        copy.activityShortcuts = [self.activityShortcuts copyWithZone:zone];
        copy.latestConfigTime = self.latestConfigTime;
        copy.iconShortcuts = [self.iconShortcuts copyWithZone:zone];
        copy.martshowHeaderBanners = [self.martshowHeaderBanners copyWithZone:zone];
        copy.ctcBottomPopupAds = [self.ctcBottomPopupAds copyWithZone:zone];
        copy.popupAds = [self.popupAds copyWithZone:zone];
        copy.martshowInsertBanners = [self.martshowInsertBanners copyWithZone:zone];
        copy.martshowHeaderThreeSquares = [self.martshowHeaderThreeSquares copyWithZone:zone];
        copy.oldMartshowAds = [self.oldMartshowAds copyWithZone:zone];
        copy.martshowPosterBanners = [self.martshowPosterBanners copyWithZone:zone];
        copy.ads = [self.ads copyWithZone:zone];
    }
    
    return copy;
}


@end

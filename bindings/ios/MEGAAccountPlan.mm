/**
 * @file MEGAAccountFeature.mm
 * @brief Details about a MEGA account plan
 *
 * (c) 2024 by Mega Limited, Auckland, New Zealand
 *
 * This file is part of the MEGA SDK - Client Access Engine.
 *
 * Applications using the MEGA API must present a valid application key
 * and comply with the the rules set forth in the Terms of Service.
 *
 * The MEGA SDK is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * @copyright Simplified (2-clause) BSD License.
 *
 * You should have received a copy of the license along with this
 * program.
 */
#import "MEGAAccountPlan.h"
#import "MEGAStringList+init.h"
#import "megaapi.h"

using namespace mega;

@interface MEGAAccountPlan()

@property BOOL cMemoryOwn;
@property MegaAccountPlan *megaAccountPlan;

@end

@implementation MEGAAccountPlan

- (instancetype)initWithMegaAccountPlan:(MegaAccountPlan *)accountPlan cMemoryOwn:(BOOL)cMemoryOwn {
    self = [super init];

    if (self != nil){
        _megaAccountPlan = accountPlan;
        _cMemoryOwn = cMemoryOwn;
    }

    return self;
}

- (void)dealloc {
    if (self.cMemoryOwn) {
        delete _megaAccountPlan;
    }
}

- (nullable MegaAccountPlan *)getCPtr {
    return self.megaAccountPlan;
}

-(bool)isProPlan {
    _megaAccountPlan->isProPlan();
}

-(int)getAccountLevel {
    int accountLevel = _megaAccountPlan->getAccountLevel();
    return accountLevel;
}

- (MEGAStringList *)getFeatures {
    return [MEGAStringList.alloc initWithMegaStringList:_megaAccountPlan->getFeatures() cMemoryOwn:YES];
}

-(int64_t)getExpirationTime {
     _megaAccountPlan->getExpirationTime();
}

-(int32_t)getType {
    _megaAccountPlan->getType();
}

-(NSString *)getId {
    [NSString stringWithUTF8String: _megaAccountPlan->getId()];
}

@end

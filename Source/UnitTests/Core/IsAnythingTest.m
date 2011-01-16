//
//  OCHamcrest - IsAnythingTest.m
//  Copyright 2011 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "AbstractMatcherTest.h"

    // OCHamcrest
#define HC_SHORTHAND
#import <OCHamcrest/HCAssertThat.h>
#import <OCHamcrest/HCIsAnything.h>


@interface IsAnythingTest : AbstractMatcherTest
@end

@implementation IsAnythingTest

- (id<HCMatcher>) createMatcher
{
    return anything();
}


- (void) testAlwaysEvaluatesToTrue
{
    assertThat(nil, anything());
    assertThat([[[NSObject alloc] init] autorelease], anything());
    assertThat(@"hi", anything());
}


- (void) testHasUsefulDefaultDescription
{
    assertDescription(@"ANYTHING", anything());
}


- (void) testCanOverrideDescription
{
    NSString* description = @"DESCRIPTION";
    assertDescription(description, anythingWithDescription(description));
}


- (void) testMatchAlwaysSucceedsSoShouldNotGenerateMismatchDescription
{
    assertNoMismatchDescription(anything(), @"hi");
}

@end
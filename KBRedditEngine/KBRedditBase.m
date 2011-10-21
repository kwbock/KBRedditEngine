//
//  KBRedditBase.m
//  KBRedditEngine
//
//  Base class with http helpers
//
//  Created by Kyle Bock on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBRedditBase.h"

@implementation KBRedditBase

@synthesize baseURL;

- (id)init
{
    self = [super init];
    if (self) {
        baseURL = @"http://www.reddit.com/";
    }
    
    return self;
}

@end

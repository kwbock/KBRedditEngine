//
//  KBRedditEngine.m
//  KBRedditEngine
//
//  Created by Kyle Bock on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBRedditEngine.h"

@implementation KBRedditEngine

@synthesize user;

- (id)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (id) initWithUser:(NSString *)_user andPasswd:(NSString *)_passwd
{
    self = [self init];
    NSLog(@"KBRedditEngine initWithUser:andPasswd");
    self.user = [[KBRedditUser alloc] initWithUser:_user andPasswd:_passwd];
    [self.user login];
    
    return self;
}

@end

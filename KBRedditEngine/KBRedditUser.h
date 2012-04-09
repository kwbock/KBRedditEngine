//
//  KBRedditUser.h
//  KBRedditEngine
//
//  Created by Kyle Bock on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KBRedditBase.h"

@interface KBRedditUser : KBRedditBase {
    NSString *username;
    NSString *password;
    NSString *modhash;
    NSString *cookieString;
}

@property(copy) NSString *username, *password, *modhash, *cookieString;

- (id) initWithUser:(NSString *)_user andPasswd:(NSString *)_passwd;

- (void) login;
- (NSMutableDictionary*)getSubscribedReddits;
//JSON Functions
- (void) parseLoginResponse:(NSString *)response;

@end

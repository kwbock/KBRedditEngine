//
//  KBRedditEngine.h
//  KBRedditEngine
//
//  Created by Kyle Bock on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KBRedditUser.h"

@interface KBRedditEngine : NSObject {
    KBRedditUser *user;
}

@property KBRedditUser *user;

- (id) initWithUser:(NSString *)user andPasswd:(NSString *)passwd;

@end

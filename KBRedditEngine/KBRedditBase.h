//
//  KBRedditBase.h
//  KBRedditEngine
//
//  Created by Kyle Bock on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KBRedditBase : NSObject {
    NSString *baseURL;
}

@property(copy) NSString *baseURL;

-(void) postWithDict;
-(void) getWithUrl;

@end

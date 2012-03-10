//
//  KBRedditUser.m
//  KBRedditEngine
//
//  Created by Kyle Bock on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KBRedditUser.h"

#import "SBJsonParser.h"

@implementation KBRedditUser

@synthesize username, password, modhash, cookieString;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (id) initWithUser:(NSString *)_user andPasswd:(NSString *)_passwd
{
    self = [self init];
    
    self.username = _user;
    self.password = _passwd;
    
    return self;
}

- (void) login
{
    NSLog(@"KBRedditUser.login");
    ASIFormDataRequest *request = [self getRequestForPath:[NSString stringWithFormat:@"/api/login/%@", self.username] andMethod:@"POST"];
    
    //set request headers, body, and method
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    [headers setValue:@"application/x-www-form-urlencoded" forKey:@"Content-Type"];
    [headers setValue:@"UTF-8" forKey:@"charset"];
    [request setRequestHeaders:headers];
    
    [request setRequestMethod:@"POST"];
    [request setPostValue:@"json" forKey:@"api_type"];
    
    [request setPostValue:self.username forKey:@"user"];
    [request setPostValue:self.password forKey:@"passwd"];
    
    [request startSynchronous];
    
    NSError *error = [request error];
    NSLog(@"Response: %@", [request responseString]);
    if (!error)
        [self parseLoginResponse:[request responseString]];
    else
        NSLog(@"ERROR!");
}

- (void) parseLoginResponse:(NSString *)response
{
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    NSDictionary *dict = [parser objectWithString:response error:nil];
    
    // path for key is in json style notation
    self.modhash = [dict valueForKeyPath:@"json.data.modhash"];
    self.cookieString = [dict valueForKeyPath:@"json.data.cookie"];
    
    NSLog(@"Modhash: %@", self.modhash);
}

@end

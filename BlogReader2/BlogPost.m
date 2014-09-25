//
//  BlogPost.m
//  BlogReader2
//
//  Created by Michael Liquori on 9/19/14.
//  Copyright (c) 2014 Team Treehouse. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

- (id) initWithTitle:(NSString *)title {
    self= [super init]; // initialize
    if (self){ //Check if valid instance was created
        self.title=title;
        self.author = nil;
        self.thumbnail=nil;
    }
    return self; // return initialized value
}

+ (id) blogPostWithTitle:(NSString *)title {
    return [[self alloc] initWithTitle:title];
}

-(NSURL *) thumbnailURL{
    return [NSURL URLWithString:self.thumbnail];
}

//- (void) setTitle:(NSString *)_title {
//    title = _title;
//}
//- (NSString *) title{
//    return title;
//}

@end

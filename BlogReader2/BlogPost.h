//
//  BlogPost.h
//  BlogReader2
//
//  Created by Michael Liquori on 9/19/14.
//  Copyright (c) 2014 Team Treehouse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *author;
@property (nonatomic,strong) NSString *thumbnail;
@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSURL *url;

//Designated Initializer
- (id) initWithTitle:(NSString *)title;
+ blogPostWithTitle:(NSString *)title;

-(NSURL *) thumbnailURL;
- (NSString *) formattedDate;
//{
//    NSString *title;
//    NSString *author;
//}
//@property (nonatomic, strong) NSString *title;

//- (void) setTitle:(NSString *)_title; // I am not clear if _ is needed here. Quiz did it, Video does not.
//- (NSString *) title;

@end

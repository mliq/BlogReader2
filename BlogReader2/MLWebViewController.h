//
//  MLWebViewController.h
//  BlogReader2
//
//  Created by Michael Liquori on 9/25/14.
//  Copyright (c) 2014 Michael Liquori. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLWebViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong,nonatomic) NSURL *blogPostURL;
@end

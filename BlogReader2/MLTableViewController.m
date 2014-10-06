//
//  MLTableViewController.m
//  BlogReader2
//
//  Created by Michael Liquori on 9/18/14.
//  Copyright (c) 2014 Team Treehouse. All rights reserved.
//

#import "MLTableViewController.h"
#import "BlogPost.h"
#import "MLWebViewController.h"

@interface MLTableViewController ()

@end

@implementation MLTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

//    BlogPost *bp = [[BlogPost alloc] initWithTitle:@"some title"];
//    bp.author = @"author";
//    
//    BlogPost *bp1 = [BlogPost blogPostWithTitle:@"another title"];
//    bp1.author = @"Amit";
    
//    BlogPost *blogPost = [[BlogPost alloc] init];
//    blogPost.title = @"some title";
//    blogPost.author = @"some author";
//    
    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
//    NSLog(@"%@",dataDictionary);
    
    self.blogPosts = [NSMutableArray array];
    
    NSArray *blogPostsArray = [dataDictionary objectForKey:@"posts"];
    
    for (NSDictionary *bpDictionary in blogPostsArray) {
        BlogPost *blogPost = [BlogPost blogPostWithTitle:[bpDictionary objectForKey:@"title"]];
        blogPost.author = [bpDictionary objectForKey:@"author"];
        blogPost.thumbnail = [bpDictionary objectForKey:@"thumbnail"];
        blogPost.date = [bpDictionary objectForKey:@"date"];
        blogPost.url = [NSURL URLWithString:[bpDictionary objectForKey:@"url"]];
        [self.blogPosts addObject:blogPost];
    }
//    self.blogPosts = [dataDictionary objectForKey:@"posts"];

    //    NSDictionary *blogPost1 = [NSDictionary dictionaryWithObjectsAndKeys:@"test1", @"title",@"Michael Liquori", @"author", nil];
    //    NSDictionary *blogPost2 = [NSDictionary dictionaryWithObjectsAndKeys:@"test2", @"title",@"Michael Liquori", @"author", nil];
    //    self.blogPosts = [NSArray arrayWithObjects: blogPost1,blogPost2, nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.blogPosts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    
    if ( [blogPost.thumbnail isKindOfClass:[NSString class]]) {
        NSData *imageData = [NSData dataWithContentsOfURL:blogPost.thumbnailURL];
        UIImage *image = [UIImage imageWithData:imageData];
        cell.imageView.image = image;
    } else {
        cell.imageView.image = [UIImage imageNamed:@"treehouse.png"];
    }
    cell.textLabel.text = blogPost.title;
//  cell.detailTextLabel.text = blogPost.author;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@",blogPost.author,[blogPost formattedDate]];
    //    cell.imageView.image = [UIImage imageNamed:@"treehouse.png"];
//    UIImage *image = [UIImage imageNamed: @"placeholder.png"];
    
    //    NSDictionary *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    // Configure the cell...
//    cell.textLabel.text = [blogPost valueForKey:@"title"];
//    cell.detailTextLabel.text = [blogPost valueForKey:@"author"];
    return cell;
}

#pragma mark Segue Web

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"preparing for segue: %@",segue.identifier);
    
    if( [segue.identifier isEqualToString:@"showBlogPost"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
        [segue.destinationViewController setBlogPostURL:blogPost.url];
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
//#pragma mark - Table view delegate
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
////    NSLog(@"Row selected: %ld",indexPath.row);
//    // Open Body in Safari
//    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
//    UIApplication *application = [UIApplication sharedApplication];
//    [application openURL:blogPost.url];
//}
//
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//
//
@end

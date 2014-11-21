//
//  HerzogImdb.m
//  WorldFilmmakers
//
//  Created by smudigon on 4/28/14.
//  Copyright (c) 2014 smudigon. All rights reserved.
//

#import "HerzogImdb.h"

@interface HerzogImdb ()
@property(strong,nonatomic) NSString *urladdress;

@end

@implementation HerzogImdb

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _urladdress = @"http://www.imdb.com/name/nm0001348/?ref_=tt_ov_dr";
    NSURL *url = [NSURL URLWithString:_urladdress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webDisplay loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

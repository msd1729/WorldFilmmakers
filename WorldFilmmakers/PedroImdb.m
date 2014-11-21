//
//  PedroImdb.m
//  WorldFilmmakers
//
//  Created by smudigon on 4/30/14.
//  Copyright (c) 2014 smudigon. All rights reserved.
//

#import "PedroImdb.h"

@interface PedroImdb ()
@property(strong,nonatomic) NSString *urladdress;

@end

@implementation PedroImdb

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
    _urladdress = @"http://www.imdb.com/name/nm0000264/?ref_=nv_sr_2";
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

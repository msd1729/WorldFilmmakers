//
//  BernController.m
//  WorldFilmmakers
//
//  Created by smudigon on 4/30/14.
//  Copyright (c) 2014 smudigon. All rights reserved.
//

#import "BernController.h"

@interface BernController ()
@property(strong,nonatomic) NSArray *array;
@end

@implementation BernController
@synthesize characterImage;
@synthesize filmText;

- (IBAction)playVideo {
    
    NSString *select = [_array objectAtIndex:[_picker selectedRowInComponent:0]];
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:select ofType:@"mp4"]];
    MPMoviePlayerViewController *playercontroller = [[MPMoviePlayerViewController alloc]initWithContentURL:url];
    [self presentMoviePlayerViewControllerAnimated:playercontroller];
    playercontroller.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    [playercontroller.moviePlayer play];
    playercontroller = nil;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSArray *data = [[NSArray alloc] initWithObjects:@"The Conformist",@"The Dreamers",@"The Sheltering Sky",@"The Last Emperor", nil];
    self.array = data;
    
}

#pragma mark Picker Data Source Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [_array count];
    
}

#pragma mark Picker Delegate Methods
-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [_array objectAtIndex:row];
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title = [_array objectAtIndex:row];
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    return attString;}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    UIImage *sunImage = [UIImage imageNamed:@"The Conformist.jpg"];
    
    UIImage *moodImage = [UIImage imageNamed:@"The Dreamers.jpg"];
    UIImage *theImage = [UIImage imageNamed:@"The Sheltering Sky.jpeg"];
    UIImage *weImage =
    [UIImage imageNamed:@"The Last Emperor.jpg"];
    
    switch (row) {
        case 0:
            characterImage.image = sunImage;
            characterImage.alpha = 0.4;
            filmText.text = @"A weak-willed Italian man becomes a fascist flunky who goes abroad to arrange the assassination of his old teacher, now a political dissident.";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 1:
            characterImage.image = moodImage;
            characterImage.alpha = 0.4;
            filmText.text = @"A young American studying in Paris in 1968 strikes up a friendship with a French brother and sister. Set against the background of the '68 Paris student riots.";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 2:
            characterImage.image = theImage;
            characterImage.alpha = 0.4;
            filmText.text = @"The American artist couple Port and Kit Moresby travel aimlessly through Africa, searching for new experiences that could give sense to their relationship. But the flight to distant regions only leads both deeper into despair.";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 3:
            characterImage.image = weImage;
            characterImage.alpha = 0.4;
            filmText.text = @"The story of the final Emperor of China.";
            filmText.backgroundColor = [UIColor clearColor];
        default:
            characterImage.image = weImage;
            break;
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


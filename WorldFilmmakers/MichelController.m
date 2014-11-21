//
//  MichelController.m
//  WorldFilmmakers
//
//  Created by smudigon on 4/30/14.
//  Copyright (c) 2014 smudigon. All rights reserved.
//

#import "MichelController.h"

@interface MichelController ()
@property(strong,nonatomic) NSArray *array;
@end

@implementation MichelController
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
    NSArray *data = [[NSArray alloc] initWithObjects:@"Eternal Sunshine",@"Mood Indigo",@"The Science of Sleep",@"The We And the I", nil];
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
    
    return attString;
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    UIImage *sunImage = [UIImage imageNamed:@"Eternal Sunshine.jpg"];
    
    UIImage *moodImage = [UIImage imageNamed:@"Mood Indigo.jpg"];
    UIImage *theImage = [UIImage imageNamed:@"The Science of Sleep.jpeg"];
    UIImage *weImage =
    [UIImage imageNamed:@"The We And the I.jpg"];
    
    switch (row) {
        case 0:
            characterImage.image = sunImage;
            characterImage.alpha = 0.4;
            filmText.text = @"A couple undergo a procedure to erase each other from their memories when their relationship turns sour, but it is only through the process of loss that they discover what they had to begin with.";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 1:
            characterImage.image = moodImage;
            characterImage.alpha = 0.4;
            filmText.text = @"A woman suffers from an unusual illness caused by a flower growing in her lungs.";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 2:
            characterImage.image = theImage;
            characterImage.alpha = 0.4;
            filmText.text = @"A man entranced by his dreams and imagination is lovestruck with a French woman and feels he can show her his world.";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 3:
            characterImage.image = weImage;
            characterImage.alpha = 0.4;
            filmText.text = @"A look at the lives of a group of teenagers who ride the same bus route, and how their relationships change and evolve on the last day of school.";
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


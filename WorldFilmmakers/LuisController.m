//
//  LuisController.m
//  WorldFilmmakers
//
//  Created by smudigon on 4/30/14.
//  Copyright (c) 2014 smudigon. All rights reserved.
//

#import "LuisController.h"

@interface LuisController ()
@property(strong,nonatomic) NSArray *array;
@end

@implementation LuisController
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
    NSArray *data = [[NSArray alloc] initWithObjects:@"Un Chien Andalou",@"Viridiana",@"Tristana",@"Belle de Jour", nil];
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
    
    UIImage *unImage = [UIImage imageNamed:@"Un Chien Andalou.jpg"];
    
    UIImage *virImage = [UIImage imageNamed:@"Viridiana.jpg"];
    UIImage *trisImage = [UIImage imageNamed:@"Tristana.jpg"];
    UIImage *belleImage =
    [UIImage imageNamed:@"Belle de Jour.jpg"];
    
    switch (row) {
        case 0:
            characterImage.image = unImage;
            characterImage.alpha = 0.4;
            filmText.text = @"In a dream-like sequence, a woman's eye is slit open juxtaposed with a similarly shaped cloud obsucuring the moon moving in the same direction as the knife through the eye to grab the audience's attention. ";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 1:
            characterImage.image = virImage;
            characterImage.alpha = 0.4;
            filmText.text = @"Viridiana, a young nun about to take her final vows, pays a visit to her widowed uncle at the request of her Mother Superior.";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 2:
            characterImage.image = trisImage;
            characterImage.alpha = 0.4;
            filmText.text = @"When the young woman Tristana's mother dies, she is entrusted to the guardianship of the well-respected though old Don Lope.";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 3:
            characterImage.image = belleImage;
            characterImage.alpha = 0.4;
            filmText.text = @"A frigid young housewife decides to spend her midweek afternoons as a prostitute.";
            filmText.backgroundColor = [UIColor clearColor];
        default:
            characterImage.image = belleImage;
            break;
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

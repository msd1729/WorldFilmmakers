//
//  WendersController.m
//  WorldFilmmakers
//
//  Created by smudigon on 4/30/14.
//  Copyright (c) 2014 smudigon. All rights reserved.
//

#import "WendersController.h"

@interface WendersController ()
@property(strong,nonatomic) NSArray *array;


@end

@implementation WendersController
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
    NSArray *data = [[NSArray alloc] initWithObjects:@"Buena Vista Social Club",@"Wings of Desire",@"Pina",@"Paris, Texas", nil];
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
    
    UIImage *buenaImage = [UIImage imageNamed:@"Buena Vista Social Club.jpg"];
    
    UIImage *wingsImage = [UIImage imageNamed:@"Wings of Desire.jpg"];
    UIImage *pinaImage = [UIImage imageNamed:@"Pina.jpg"];
    UIImage *parisImage =
    [UIImage imageNamed:@"Paris, Texas.jpg"];
    
    switch (row) {
        case 0:
            characterImage.image = buenaImage;
            characterImage.alpha = 0.4;
            filmText.text = @"Aging Cuban musicians whose talents had been virtually forgotten following Castro's takeover of Cuba, are brought out of retirement by Ry Cooder, who travelled to Havana in order to bring the musicians together, resulting in triumphant performances of extraordinary music, and resurrecting the musicians' careers.";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 1:
            characterImage.image = wingsImage;
            characterImage.alpha = 0.4;
            filmText.text = @"An angel tires of overseeing human activity and wishes to become human when he falls in love with a mortal.";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 2:
            characterImage.image = pinaImage;
            characterImage.alpha = 0.4;
            filmText.text = @"A tribute to the late German choreographer, Pina Bausch, as her dancers perform her most famous creations.";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 3:
            characterImage.image = parisImage;
            characterImage.alpha = 0.4;
            filmText.text = @"A man wanders out of the desert after a four year absence. His brother finds him, and together they return to L.A. to reunite the man with his young son. Soon after, he and the boy set out to locate the mother of the child, who left shortly after the man disappeared.";
            filmText.backgroundColor = [UIColor clearColor];
        default:
            characterImage.image = parisImage;
            break;
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


//
//  RobertController.m
//  WorldFilmmakers
//
//  Created by smudigon on 4/30/14.
//  Copyright (c) 2014 smudigon. All rights reserved.
//

#import "RobertController.h"

@interface RobertController ()
@property(strong,nonatomic) NSArray *array;
@end

@implementation RobertController
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
    NSArray *data = [[NSArray alloc] initWithObjects:@"Pickpocket",@"A Man Escaped",@"Mouchette",@"Au Hasard Balthazar", nil];
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
    
    UIImage *pickImage = [UIImage imageNamed:@"Pickpocket.jpg"];
    
    UIImage *manImage = [UIImage imageNamed:@"A Man Escaped.jpg"];
    UIImage *mouImage = [UIImage imageNamed:@"Mouchette.jpg"];
    UIImage *balImage =
    [UIImage imageNamed:@"Au Hasard Balthazar.jpg"];
    
    switch (row) {
        case 0:
            characterImage.image = pickImage;
            characterImage.alpha = 0.4;
            filmText.text = @"Michel is released from jail after serving a sentence for thievery. His mother dies and he resorts to pickpocketing as a means of survival. ";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 1:
            characterImage.image = manImage;
            characterImage.alpha = 0.4;
            filmText.text = @"French Resistance activist Andre Devigny is imprisoned by the Nazis, and devotes his waking hours to planning an elaborate escape. Then, on the same day, he is condemned to death, and given a new cellmate. Should he kill him, or risk revealing his plans to someone who may be a Gestapo informer?";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 2:
            characterImage.image = mouImage;
            characterImage.alpha = 0.4;
            filmText.text = @"Mouchette is a young girl living in the country. Her mother is dying and her father does not take care of her. Mouchette remains silent in the face of the humiliations she undergoes. One night in a wood, she meets Arsene, the village poacher, who thinks he has just killed the local policeman. He tries to use Mouchette to build an alibi.";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 3:
            characterImage.image = balImage;
            characterImage.alpha = 0.4;
            filmText.text = @"The story of a mistreated donkey and the people around him. A study on saintliness and a sister piece to Bresson's Mouchette.";
            filmText.backgroundColor = [UIColor clearColor];
        default:
            characterImage.image = balImage;
            break;
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


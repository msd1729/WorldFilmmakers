//
//  PierController.m
//  WorldFilmmakers
//
//  Created by smudigon on 4/30/14.
//  Copyright (c) 2014 smudigon. All rights reserved.
//

#import "PierController.h"

@interface PierController ()
@property(strong,nonatomic) NSArray *array;
@end

@implementation PierController

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
    NSArray *data = [[NSArray alloc] initWithObjects:@"Porcile",@"Accattone",@"Teorema",@"Mamma Roma", nil];
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
    
    UIImage *sunImage = [UIImage imageNamed:@"Porcile.jpg"];
    
    UIImage *moodImage = [UIImage imageNamed:@"Accattone.jpg"];
    UIImage *theImage = [UIImage imageNamed:@"Teorema.jpg"];
    UIImage *weImage =
    [UIImage imageNamed:@"Mamma Roma.jpg"];
    
    switch (row) {
        case 0:
            characterImage.image = sunImage;
            characterImage.alpha = 0.4;
            filmText.text = @"Two dramatic stories. In an undetermined past, a young cannibal (who killed his own father) is condemned to be torn to pieces by some wild beasts. In the second story, Julian, the young son of a post-war German industrialist, is on the way to lie down with his farm's pigs, because he doesn't like human relationships.";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 1:
            characterImage.image = moodImage;
            characterImage.alpha = 0.4;
            filmText.text = @"A pimp with no other means to provide for himself finds his life spiraling out of control when his prostitute is sent to prison.";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 2:
            characterImage.image = theImage;
            characterImage.alpha = 0.4;
            filmText.text = @"A strange visitor in a wealthy family. He seduces the maid, the son, the mother, the daughter and finally the father before leaving a few days after. After he's gone, none of them can continue living as they did. Who was that visitor ? Could he be God ?";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 3:
            characterImage.image = weImage;
            characterImage.alpha = 0.4;
            filmText.text = @"Mamma Roma is a middle-aged whore of Roma. Now she can quit her job to become a fruit seller. And she can take back her 16-year-old son, Ettore. For him, she dreams of a good position. But it is perhaps too late for Ettore, whose company includes mostly teenaged louts";
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


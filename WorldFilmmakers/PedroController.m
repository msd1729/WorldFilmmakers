//
//  PedroController.m
//  WorldFilmmakers
//
//  Created by smudigon on 4/30/14.
//  Copyright (c) 2014 smudigon. All rights reserved.
//

#import "PedroController.h"

@interface PedroController ()
@property(strong,nonatomic) NSArray *array;
@end

@implementation PedroController
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
    NSArray *data = [[NSArray alloc] initWithObjects:@"Talk To Her",@"Volver",@"The Skin I Live In",@"All About My Mother", nil];
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
    
    UIImage *talkImage = [UIImage imageNamed:@"Talk To Her.jpeg"];
    
    UIImage *volverImage = [UIImage imageNamed:@"Volver.jpg"];
    UIImage *skinImage = [UIImage imageNamed:@"The Skin I Live In.jpg"];
    UIImage *allImage =
    [UIImage imageNamed:@"All About My Mother.jpg"];
    
    switch (row) {
        case 0:
            characterImage.image = talkImage;
            characterImage.alpha = 0.4;
            filmText.text = @"Two men share an odd friendship while they care for two women who are both in deep comas.";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 1:
            characterImage.image = volverImage;
            characterImage.alpha = 0.4;
            filmText.text = @"After her death, a mother returns to her home town in order to fix the situations she couldn't resolve during her life.";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 2:
            characterImage.image = skinImage;
            characterImage.alpha = 0.4;
            filmText.text = @"A brilliant plastic surgeon, haunted by past tragedies, creates a type of synthetic skin that withstands any kind of damage. His guinea pig: a mysterious and volatile woman who holds the key to his obsession.";
            filmText.backgroundColor = [UIColor clearColor];
            break;
        case 3:
            characterImage.image = allImage;
            characterImage.alpha = 0.4;
            filmText.text = @"Young Esteban want to become a writer and also to discover the identity of his father, carefully concealed by the mother Manuela.";
            filmText.backgroundColor = [UIColor clearColor];
        default:
            characterImage.image = allImage;
            break;
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


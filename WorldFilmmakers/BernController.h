//
//  BernController.h
//  WorldFilmmakers
//
//  Created by smudigon on 4/30/14.
//  Copyright (c) 2014 smudigon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface BernController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>{
    
    
}


@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UIImageView *characterImage;

@property (weak, nonatomic) IBOutlet UITextView *filmText;




-(IBAction)playVideo;


@end

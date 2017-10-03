//
//  ViewController.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "MenuController.h"
#import "MenuManager.h"

@interface MenuController ()

@property (weak, nonatomic) IBOutlet UIButton *soundButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *levelsSegmentedControl;

@end

@implementation MenuController

@synthesize soundButton;
@synthesize levelsSegmentedControl;

MenuManager* menuManager;

- (void) viewDidLoad {
    [super viewDidLoad];
    
    menuManager = [[MenuManager alloc] init];
    
    [self setSoundWith: menuManager.soundManagerState];
    [self setLevelWith: menuManager.levelIndex];
}

- (IBAction) changeSoundState: (UIButton *) sender
{
    menuManager.soundManagerState = !menuManager.soundManagerState;
    [self setSoundWith: menuManager.soundManagerState];
}

- (IBAction) levelChanged: (UISegmentedControl *) sender
{
    menuManager.levelIndex = (int) sender.selectedSegmentIndex;
}

- (NSTimeInterval) timeLimitWith: (Level) level
{
    switch (level)
    {
        case easyLevel:   return 90;
        case normalLevel: return 60;
        case hardLevel:   return 45;
        default:          return 60;
    }
}

- (void) setLevelWith: (int) index
{
    levelsSegmentedControl.selectedSegmentIndex = index;
}

- (void) setSoundWith: (bool) state
{
    if (state)
    {
        
        UIImage* img = [UIImage imageNamed:@"speakerOn"];
        [soundButton setImage: img forState: normal];
        [menuManager playBackgroundMusic];
    }
    else
    {
        UIImage* img = [UIImage imageNamed:@"speakerOff"];
        [soundButton setImage: img forState: normal];
        [menuManager stopBackgroundMusic];
    }
}

@end


//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "GameControllerSegue", let _ = segue.destination as? GameController {
//            let level = Level(rawValue: levelControl.selectedSegmentIndex) ?? Level.easy
//            GameLogic.shared.setTimeLimit(time: timeLimit(with: level))
//        }
//    }




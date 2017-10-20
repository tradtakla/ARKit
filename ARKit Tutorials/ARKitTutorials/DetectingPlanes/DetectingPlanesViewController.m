//
//  DetectingPlanesViewController.m
//  ARKit Tutorials
//
//  Created by Takla Trad on 10/16/17.
//  Copyright © 2017 NM. All rights reserved.
//

#import "DetectingPlanesViewController.h"

@interface DetectingPlanesViewController () <ARSCNViewDelegate>

@property (nonatomic, strong) ARSCNView *sceneView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation DetectingPlanesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.sceneView = [[ARSCNView alloc] initWithFrame:self.view.frame];
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.sceneView.frame.size.width, 44)];
    self.label.center = self.sceneView.center;
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor whiteColor];
    self.label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.label.alpha = 1;
    
    [self.sceneView addSubview:self.label];
    
    self.sceneView.debugOptions = ARSCNDebugOptionShowWorldOrigin | ARSCNDebugOptionShowFeaturePoints;
    
    [self.view addSubview:self.sceneView];
    
    // Set the view's delegate
    self.sceneView.delegate = self;
    
    // Show statistics such as fps and timing information
    self.sceneView.showsStatistics = YES;
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Create a session configuration
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    
    configuration.planeDetection = ARPlaneDetectionHorizontal;
    
    // Run the view's session
    [self.sceneView.session runWithConfiguration:configuration];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Pause the view's session
    [self.sceneView.session pause];
}

-(void)renderer:(id<SCNSceneRenderer>)renderer didAddNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.label.text = @"Plane Detected";
        
        [UIView animateWithDuration:3.0 animations:^{
            self.label.alpha = 1;
        } completion:^(BOOL finished) {
            self.label.alpha = 0;
        }];
    });
}

@end

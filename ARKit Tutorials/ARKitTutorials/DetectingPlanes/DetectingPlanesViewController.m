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

@end

@implementation DetectingPlanesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.sceneView = [[ARSCNView alloc] initWithFrame:self.view.frame];
    
    self.sceneView.debugOptions = ARSCNDebugOptionShowWorldOrigin;
    self.sceneView.debugOptions = ARSCNDebugOptionShowFeaturePoints;
    
    [self.view addSubview:self.sceneView];
    
    // Set the view's delegate
    self.sceneView.delegate = self;
    
    // Show statistics such as fps and timing information
    self.sceneView.showsStatistics = YES;
    
    
    SCNScene *scene = [[SCNScene alloc] init];
    
    
    self.sceneView.scene = scene;
    
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

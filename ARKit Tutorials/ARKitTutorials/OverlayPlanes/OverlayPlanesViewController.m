//
//  OverlayPlanesViewController.m
//  ARKit Tutorials
//
//  Created by Takla Trad on 10/20/17.
//  Copyright © 2017 NM. All rights reserved.
//

#import "OverlayPlanesViewController.h"

@interface OverlayPlanesViewController () <ARSCNViewDelegate>

@end

@implementation OverlayPlanesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    planes = [NSMutableDictionary new];
    
    sceneView = [[ARSCNView alloc] initWithFrame:self.view.frame];
    
    sceneView.debugOptions = ARSCNDebugOptionShowWorldOrigin | ARSCNDebugOptionShowFeaturePoints;
    
    [self.view addSubview:sceneView];
    
    // Set the view's delegate
    sceneView.delegate = self;
    
    // Show statistics such as fps and timing information
    sceneView.showsStatistics = YES;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Create a session configuration
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    
    configuration.planeDetection = ARPlaneDetectionHorizontal;
    
    // Run the view's session
    [sceneView.session runWithConfiguration:configuration];
}


-(void)renderer:(id<SCNSceneRenderer>)renderer didAddNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor
{
    
    if (![anchor isKindOfClass:[ARPlaneAnchor class]]) {
        return;
    }
     
    OverlayPlane* plane = [[OverlayPlane alloc] initWithAnchor:(ARPlaneAnchor*)anchor];
    
    [planes setObject:plane forKey:anchor.identifier];
    
    [node addChildNode:plane];
}

-(void)renderer:(id<SCNSceneRenderer>)renderer didUpdateNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor {
   
    OverlayPlane* plane = [planes objectForKey:anchor.identifier];
    
    NSLog(@"%@", plane);
    
    if (plane == nil)
        return;
     NSLog(@"hjawdhjvawdhjavwdjhavdjgahvwd");
    [plane update:(ARPlaneAnchor*)anchor];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Pause the view's session
    [sceneView.session pause];
}

@end

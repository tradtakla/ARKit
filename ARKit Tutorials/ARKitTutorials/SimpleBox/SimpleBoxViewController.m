//
//  SimpleBoxViewController.m
//  MeasuringTool
//
//  Created by Karen Najem on 9/26/17.
//  Copyright © 2017 NM. All rights reserved.
//

#import "SimpleBoxViewController.h"

@interface SimpleBoxViewController () <ARSCNViewDelegate>

@property (nonatomic, strong) ARSCNView *sceneView;

@end

@implementation SimpleBoxViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sceneView = [[ARSCNView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.sceneView];
    
    // Set the view's delegate
    self.sceneView.delegate = self;
    
    // Show statistics such as fps and timing information
    self.sceneView.showsStatistics = YES;
    
    // Create a new scene
    SCNScene *scene = [[SCNScene alloc] init];
    SCNBox *box = [SCNBox boxWithWidth:0.2 height:0.2 length:0.2 chamferRadius:0];
    SCNMaterial *material = [[SCNMaterial alloc] init];
    material.diffuse.contents = [UIColor redColor];
    
    SCNNode *node = [SCNNode nodeWithGeometry:box];
    node.geometry.firstMaterial = material;
    node.position = SCNVector3Make(0, 0.1, -0.5);
    
    [scene.rootNode addChildNode:node];
    
        // Set the scene to the viewnd on object of type 'SCNG
        self.sceneView.scene = scene;
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Create a session configuration
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    
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
    // Release any cached data, images, etc that aren't in use.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  SimpleBoxWithTouchViewController.m
//  MeasuringTool
//
//  Created by Karen Najem on 9/26/17.
//  Copyright © 2017 NM. All rights reserved.
//

#import "SimpleBoxWithTouchViewController.h"

@interface SimpleBoxWithTouchViewController () <ARSCNViewDelegate>

@property (nonatomic, strong) ARSCNView *sceneView;

@end

@implementation SimpleBoxWithTouchViewController


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
    
    UITapGestureRecognizer *tapGuestRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self.sceneView addGestureRecognizer:tapGuestRecognizer];
    

    // Set the scene to the viewnd on object of type 'SCNG
    self.sceneView.scene = scene;
}

-(void)tapped:(UIGestureRecognizer *)sender {
    
    CGPoint touchLocation = [sender locationInView:sender.view];
    NSArray *hitResults = [self.sceneView hitTest:touchLocation options:nil];
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    
    if ([hitResults count] != 0) {
        SCNNode *node = [[SCNNode alloc]init];
        [mutableArray addObjectsFromArray:hitResults];
        [mutableArray addObject:node];
        
        SCNMaterial *material = [[SCNMaterial alloc] init];
        material.diffuse.contents = [UIColor greenColor];
        node.geometry.firstMaterial = material;
        
        
    }
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

@end

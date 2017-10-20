//
//  OverlayPlane.m
//  ARKit Tutorials
//
//  Created by Takla Trad on 10/20/17.
//  Copyright © 2017 NM. All rights reserved.
//

#import "OverlayPlane.h"

@interface SCNNode()

@end

@implementation OverlayPlane

@synthesize anchor;

- (id)initWithAnchor:(ARPlaneAnchor*) worldAnchor
{
    anchor = worldAnchor;
    self = [super init];
    if (self)
    {
        [self setup];
    }
    return self;
}

-(void) update:(ARPlaneAnchor*) defAnchor
{
    planeGeometry.width = defAnchor.extent.x;
    planeGeometry.height = defAnchor.extent.z;
    self.position = SCNVector3Make(defAnchor.center.x, 0, defAnchor.center.z);
    
    NSLog(@"%@", planeGeometry);
    
}

-(void) setup
{
    planeGeometry = [SCNPlane planeWithWidth:anchor.extent.x height:anchor.extent.z];
    
    planeGeometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"Overlay_grid.png"];
    
    SCNNode *planeNode = [SCNNode nodeWithGeometry: planeGeometry];
    planeNode.position = SCNVector3Make(anchor.center.x, 0, anchor.extent.z);
    planeNode.transform = SCNMatrix4MakeRotation(-M_PI_2, 1.0, 0.0, 0.0);
    
    [self addChildNode:planeNode];
    
}


@end

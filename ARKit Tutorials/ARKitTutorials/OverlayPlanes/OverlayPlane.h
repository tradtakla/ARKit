//
//  OverlayPlane.h
//  ARKit Tutorials
//
//  Created by Takla Trad on 10/20/17.
//  Copyright © 2017 NM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>
#import <ARKit/ARKit.h>

@interface OverlayPlane : SCNNode {
    
    SCNPlane* planeGeometry;
    
}

@property (nonatomic, strong) ARPlaneAnchor* anchor;

- (id)initWithAnchor:(ARPlaneAnchor*) anchor;

-(void) update:(ARPlaneAnchor*) anchor;

@end

//
//  OverlayPlanesViewController.h
//  ARKit Tutorials
//
//  Created by Takla Trad on 10/20/17.
//  Copyright © 2017 NM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>
#import <ARKit/ARKit.h>
#import "OverlayPlane.h"

@interface OverlayPlanesViewController : UIViewController {
    
    NSMutableDictionary<NSUUID *, OverlayPlane *>*planes;
    ARSCNView *sceneView;
    
}

@end

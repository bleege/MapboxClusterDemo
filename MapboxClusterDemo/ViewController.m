//
//  ViewController.m
//  MapboxClusterDemo
//
//  Created by Brad Leege on 2/2/14.
//  Copyright (c) 2014 Brad Leege. All rights reserved.
//

#import "ViewController.h"
#import "MapBox.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    RMMapboxSource *tileSource = [[RMMapboxSource alloc] initWithMapID:@"examples.map-z2effxa8"];
    
    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:tileSource];
    
    mapView.delegate = self;
    
    [self.view addSubview:mapView];
    
    [mapView addAnnotation:[RMAnnotation annotationWithMapView:mapView coordinate:CLLocationCoordinate2DMake(43.325178, -85.166016) andTitle:nil]];
    [mapView addAnnotation:[RMAnnotation annotationWithMapView:mapView coordinate:CLLocationCoordinate2DMake(35.245619, -88.769531) andTitle:nil]];
    [mapView addAnnotation:[RMAnnotation annotationWithMapView:mapView coordinate:CLLocationCoordinate2DMake(38.754083, -75.322266) andTitle:nil]];
    [mapView addAnnotation:[RMAnnotation annotationWithMapView:mapView coordinate:CLLocationCoordinate2DMake(32.026706, -71.982422) andTitle:nil]];
    [mapView addAnnotation:[RMAnnotation annotationWithMapView:mapView coordinate:CLLocationCoordinate2DMake(44.276671, -67.675781) andTitle:nil]];
    [mapView addAnnotation:[RMAnnotation annotationWithMapView:mapView coordinate:CLLocationCoordinate2DMake(50.847573, -69.960937) andTitle:nil]];
    [mapView addAnnotation:[RMAnnotation annotationWithMapView:mapView coordinate:CLLocationCoordinate2DMake(50.847573, -81.298828) andTitle:nil]];
    
    mapView.clusteringEnabled = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation
{
    if (annotation.isUserLocationAnnotation)
        return nil;
    
    RMMapLayer *layer = nil;
    
    if (annotation.isClusterAnnotation)
    {
        layer = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"circle.png"]];
        
        layer.opacity = 0.75;
        
        layer.bounds = CGRectMake(0, 0, 75, 75);
        
        [(RMMarker *)layer setTextForegroundColor:[UIColor whiteColor]];
        
        [(RMMarker *)layer changeLabelUsingText:[NSString stringWithFormat:@"%i", [annotation.clusteredAnnotations count]]];
    }
    else
    {
        layer = [[RMMarker alloc] initWithMapboxMarkerImage];
    }
    
    return layer;
}

@end

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
    
    //mapView.delegate = self;
    
    [self.view addSubview:mapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

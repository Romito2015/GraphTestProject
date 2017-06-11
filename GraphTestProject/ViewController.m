//
//  ViewController.m
//  GraphTestProject
//
//  Created by Roman Chopovenko on 6/11/17.
//  Copyright © 2017 Roman Chopovenko. All rights reserved.
//

#import "ViewController.h"
#import "GraphTestProject-Swift.h"

static const NSInteger numberOfDataItems = 29;

@interface ViewController ()
@property (strong, nonatomic) ScrollableGraphView *graphView;
@property (strong, nonatomic) NSMutableArray<NSLayoutConstraint *> *graphConstraints;
@property (strong, nonatomic) NSMutableArray<NSNumber *> *data;
@property (strong, nonatomic) NSMutableArray<XCoordinateObject *> *lablesC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.graphView = [[ScrollableGraphView alloc] initWithFrame:self.view.frame];
    self.graphView = [self createDarkGraphWithFrame:self.view.frame];
    self.data = (NSMutableArray *)[ScrollableGraphView generateRandomData:numberOfDataItems max:50];
    self.lablesC = (NSMutableArray *)[ScrollableGraphView generateSequentialCustomBottomLabelsData:numberOfDataItems text:@"FEB"];
    [self.graphView customViewSetWithData:self.data withLabelsData:self.lablesC];
    [self.view addSubview:self.graphView];
    [self setupConstraints];
}

- (ScrollableGraphView *)createDarkGraphWithFrame:(CGRect)frame {
    ScrollableGraphView *graphView = [[ScrollableGraphView alloc] initWithFrame:self.view.frame];
    graphView.backgroundFillColor = [UIColor whiteColor];
    graphView.bottomMargin = 50.f;
    
    graphView.lineWidth = 2.f;
    graphView.lineColor = [UIColor orangeColor];
    graphView.lineStyle = 1;
    
    graphView.shouldFill = YES;
    graphView.fillType = 1;
    graphView.fillColor = [UIColor whiteColor];
    graphView.fillGradientType = 0;
    graphView.fillGradientStartColor = [UIColor whiteColor];
    graphView.fillGradientEndColor = [UIColor blueColor];
    
    graphView.dataPointType = 0;
    graphView.showOnlyLastDataPoint = true;
    graphView.dataPointSize = 15.f;
    graphView.dataPointFillColor = [UIColor redColor];
    graphView.dataPointBorderColor = [UIColor greenColor];
    graphView.dataPointBorderWidth = 6.f;
    
    graphView.dataPointSpacing = 80.f;
    
    
    graphView.referenceLineLabelFont = [UIFont boldSystemFontOfSize:8.f];
    graphView.referenceLineColor = [[UIColor whiteColor] colorWithAlphaComponent:0.2f];
    graphView.referenceLineLabelColor = [UIColor blueColor];
    graphView.numberOfIntermediateReferenceLines = 3;
    
    graphView.dataPointLabelColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
    
    graphView.shouldAnimateOnStartup = YES;
    graphView.shouldAdaptRange = YES;
    graphView.adaptAnimationType = 1;
    graphView.animationDuration = 1.5f;
    graphView.rangeMax = 50;
    graphView.shouldRangeAlwaysStartAtZero = YES;
    
    return graphView;
}

- (void)setupConstraints {
    [self.graphView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.graphConstraints = [NSMutableArray new];
    
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.graphView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.graphView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self.graphView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.graphView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    
    [self.graphConstraints addObject:topConstraint];
    [self.graphConstraints addObject:rightConstraint];
    [self.graphConstraints addObject:bottomConstraint];
    [self.graphConstraints addObject:leftConstraint];
    
    [self.view addConstraints:[NSArray arrayWithArray:self.graphConstraints]];
    
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end

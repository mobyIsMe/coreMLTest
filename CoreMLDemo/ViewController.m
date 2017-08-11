//
//  ViewController.m
//  CoreMLDemo
//
//  Created by chenyi on 08/06/2017.
//  Copyright © 2017 chenyi. All rights reserved.
//

#import "ViewController.h"

#import "GoogleNetPlaces.h"
#import "Resnet50.h"
#import "UIImage+Utils.h"

@interface ViewController ()

@end

@implementation ViewController

//- (NSString*) predictImageWithResNet50:(UIImage*) image{
//
//    Resnet50* model = [[Resnet50 alloc]init];
//    NSError* error;
//    UIImage* resizedImage = [image scaleToSize:CGSizeMake(224, 224)];
//    CVPixelBufferRef bufferRef = [image pixelBufferFromCGImage:resizedImage];
//    Resnet50Input* input = [[Resnet50Input alloc]initWithImage:bufferRef];
//    Resnet50Output* output = [model predictionFromFeatures:input error:&error];
//    return output.classLabel;
//}


- (NSString *)predictImageScene:(UIImage *)image {
    GoogLeNetPlaces *model = [[GoogLeNetPlaces alloc] init];
    NSError *error;
    UIImage *scaledImage = [image scaleToSize:CGSizeMake(224, 224)];
    CVPixelBufferRef buffer = [image pixelBufferFromCGImage:scaledImage];
    GoogLeNetPlacesInput *input = [[GoogLeNetPlacesInput alloc] initWithSceneImage:buffer];
    GoogLeNetPlacesOutput *output = [model predictionFromFeatures:input error:&error];
    return output.sceneLabel;
}

- (NSString *)predictImageSceneWithResnet:(UIImage *)image {
    Resnet50 *model = [[Resnet50 alloc] init];
    NSError *error;
    UIImage *scaledImage = [image scaleToSize:CGSizeMake(224, 224)];
    CVPixelBufferRef buffer = [image pixelBufferFromCGImage:scaledImage];
    Resnet50Input *input = [[Resnet50Input alloc] initWithImage:buffer];
    Resnet50Output *output = [model predictionFromFeatures:input error:&error];
    return output.classLabel;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *image = [UIImage imageNamed:@"testImage"];
    NSString *sceneLabel = [self predictImageScene:image];
    NSString* resNet50Label = [self predictImageSceneWithResnet:image];
    NSLog(@"GoogleNet: Scene label is: %@", sceneLabel);
    NSLog(@"ResNet50: Scene label is: %@", resNet50Label);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

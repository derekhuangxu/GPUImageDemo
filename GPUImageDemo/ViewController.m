//
//  ViewController.m
//  GPUImageDemo
//
//  Created by Derek on 16/1/26.
//  Copyright © 2016年 huangxu. All rights reserved.
//

#import "ViewController.h"

#import "GPUImage.h"
@interface ViewController ()
@property (nonatomic, assign)UIImage *inputImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _inputImage = [UIImage imageNamed:@"_starwars__doll.jpg"];
    //加载出来
    UIImageView *imageView = [[UIImageView alloc] initWithImage:_inputImage];
    imageView.frame = CGRectMake(30,100,320,200);
    [self.view addSubview:imageView];


}
- (IBAction)btnSketchAction:(id)sender {
    
    
    GPUImageSketchFilter *disFilter = [[GPUImageSketchFilter alloc] init];
    
    //设置要渲染的区域
    [disFilter forceProcessingAtSize:_inputImage.size];
    [disFilter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:_inputImage];
    //添加上滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    UIImage *newImage = [disFilter imageFromCurrentFramebuffer];
    //加载出来
    UIImageView *imageView = [[UIImageView alloc] initWithImage:newImage];
    imageView.frame = CGRectMake(30,100,320,200);
    [self.view addSubview:imageView];
}
- (IBAction)btnSepiaAction:(id)sender {
    GPUImageSepiaFilter *disFilter = [[GPUImageSepiaFilter alloc] init];
    
    //设置要渲染的区域
    [disFilter forceProcessingAtSize:_inputImage.size];
    [disFilter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:_inputImage];
    //添加上滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    UIImage *newImage = [disFilter imageFromCurrentFramebuffer];
    //加载出来
    UIImageView *imageView = [[UIImageView alloc] initWithImage:newImage];
    imageView.frame = CGRectMake(30,100,320,200);
    [self.view addSubview:imageView];
    
    
}
- (IBAction)btnCustomAction:(id)sender {
    
    GPUImageFilter *customFilter = [[GPUImageFilter alloc] initWithFragmentShaderFromFile:@"GPUImageCustomFilter"];
    
    //设置要渲染的区域
    [customFilter forceProcessingAtSize:_inputImage.size];
    [customFilter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:_inputImage];
    //添加上滤镜
    [stillImageSource addTarget:customFilter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    UIImage *newImage = [customFilter imageFromCurrentFramebuffer];
    //加载出来
    UIImageView *imageView = [[UIImageView alloc] initWithImage:newImage];
    imageView.frame = CGRectMake(30,100,320,200);
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

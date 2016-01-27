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
    

    
    
    
    //创建一个亮度的滤镜
    //    GPUImageBrightnessFilter *passthroughFilter = [[GPUImageBrightnessFilter alloc] init];
    //    passthroughFilter.brightness = -0.5f;
    //    //设置要渲染的区域
    //    [passthroughFilter forceProcessingAtSize:inputImage.size];
    //    [passthroughFilter useNextFrameForImageCapture];
    //    //获取数据源
    //    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:inputImage];
    //    //添加上滤镜
    //    [stillImageSource addTarget:passthroughFilter];
    //    //开始渲染
    //    [stillImageSource processImage];
    //    //获取渲染后的图片
    //    UIImage *newImage = [passthroughFilter imageFromCurrentFramebuffer];
    //    //加载出来
    //    UIImageView *imageView = [[UIImageView alloc] initWithImage:newImage];
    //    imageView.frame = CGRectMake(0,0,inputImage.size.width ,inputImage.size.height);
    //    [self.view addSubview:imageView];
    
    
    //GPUImageStretchDistortionFilter *disFilter =[[GPUImageStretchDistortionFilter alloc] init];
    //GPUImageBulgeDistortionFilter *disFilter = [[GPUImageBulgeDistortionFilter alloc] init];
    //GPUImagePinchDistortionFilter *disFilter = [[GPUImagePinchDistortionFilter alloc] init];
    //GPUImageGlassSphereFilter *disFilter = [[GPUImageGlassSphereFilter alloc] init];
    //GPUImageSphereRefractionFilter *disFilter = [[GPUImageSphereRefractionFilter alloc] init];
    //GPUImageToonFilter *disFilter = [[GPUImageToonFilter alloc] init];

    
    _inputImage = [UIImage imageNamed:@"火影01.png"];
    //加载出来
    UIImageView *imageView = [[UIImageView alloc] initWithImage:_inputImage];
    imageView.frame = CGRectMake(50,50,_inputImage.size.width ,_inputImage.size.height);
    [self.view addSubview:imageView];
    
    
    //晕影，形成黑色圆形边缘，突出中间图像的效果
//    GPUImageSketchFilter *disFilter = [[GPUImageSketchFilter alloc] init];
    
    
    
    

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
    imageView.frame = CGRectMake(50,50,_inputImage.size.width ,_inputImage.size.height);
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
    imageView.frame = CGRectMake(50,50,_inputImage.size.width ,_inputImage.size.height);
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
    imageView.frame = CGRectMake(50,50,_inputImage.size.width ,_inputImage.size.height);
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

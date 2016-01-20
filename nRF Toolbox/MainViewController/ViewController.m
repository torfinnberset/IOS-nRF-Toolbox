/*
 * Copyright (c) 2015, Nordic Semiconductor
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this
 * software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
 * USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "ViewController.h"
#import "Constants.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

- (IBAction)aboutButtonClicked:(id)sender;

@end

@implementation ViewController
@synthesize collectionView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    collectionView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)aboutButtonClicked:(id)sender
{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString* message = [NSString stringWithFormat:@"The nRF Toolbox works with a wide range of the most popular Bluetooth Low Energy accessories. It contains applications demonstrating standard BLE profiles:\n\n%C Cycling Speed and Cadence,\n%C Running Speed and Cadence,\n%C Heart Rate Monitor,\n%C Blood Pressure Monitor,\n%C Health Thermometer Monitor,\n%C Glucose Monitor,\n%C Proximity Monitor.\n\nAdditionaly, it supports Nordic Semiconductor's proprietary profiles:\n\n%C UART (Universal Asynchronous Receiver/Transmitter),\n%C DFU (Device Firmware Update).\n\nVersion %@", (unichar) 0x2022, (unichar) 0x2022, (unichar) 0x2022, (unichar) 0x2022, (unichar) 0x2022, (unichar) 0x2022, (unichar) 0x2022, (unichar) 0x2022, (unichar) 0x2022, version];
    [self showAbout:message];
}

#pragma mark UICollectionViewDataSource methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* name = [NSString stringWithFormat:@"profile_%ld", (long)indexPath.item];
    return [cv dequeueReusableCellWithReuseIdentifier:name forIndexPath:indexPath];
}

@end

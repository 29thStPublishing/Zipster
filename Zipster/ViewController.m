//
//  ViewController.m
//  Zipster
//
//  Created by Natalie Podrazik on 2/1/12.
//  Copyright (c) 2012 Auburn & Ivory. All rights reserved.
//

#import "ViewController.h"
#import "ZipArchive.h"

#define FILENAME @"loneja_loka.jpg"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    NSLog(@"[viewDidLoad] displaying the ZipArchived data.\n");
    
    status.text = @"Initial screen loaded...";
    
    
    ZipArchive* za = [[ZipArchive alloc] init];
         
    /*
        ** documents directory ** 
     */
     NSArray * docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = [docPaths objectAtIndex:0];
             
    NSString * appPath = [[NSBundle mainBundle] bundlePath];
    


    NSLog(@"\n Documents directory = %@\n", documentsDirectory);
    NSLog(@"\n App directory = %@\n", appPath);

    
    NSString * fullPath = [NSString stringWithFormat:@"%@/%@", appPath, @"lady_rappers.zip"];
    
    
    NSLog(@"\n Full path = %@\n", fullPath);

    
    if( [za UnzipOpenFile:fullPath] ) {
        status.text = @"We're able to unzip this file!";

    
        BOOL result = [za UnzipFileTo:documentsDirectory overWrite:YES];
        if (result) {
            
            status.text = [NSString stringWithFormat:@"Package unzipped; here's the '%@' image.", FILENAME];

            NSString * newPath = [NSString stringWithFormat:@"%@/lady_rappers/%@", documentsDirectory, FILENAME];
            NSLog(@"newPath, fullpath to new image, is: %@\n", newPath);
            
            imgView.image = [UIImage imageWithContentsOfFile:newPath];

        }
        else  {
            status.text = @"Error unzipping that package.";
        }
        
        [za UnzipCloseFile];
    
    }
    else {
        NSLog(@"[viewDidLoad] Did not open.\n");
        status.text = @"Did not open the zip file.";
    }
    
    [za release];    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end

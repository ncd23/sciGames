//
//  registration.m
//  sciGames
//
//  Created by Joseph Saavedra on 6/19/12.
//  Copyright (c) 2012 Saavedra. All rights reserved.
//

#include "registration.h"
#include "testApp.h"

void registration::setup(){
    
    ofSetOrientation(OF_ORIENTATION_90_RIGHT);
	
    camera = NULL;
	
    imgPos.x=ofGetWidth()/2;
	imgPos.y=ofGetHeight()/2;
}

void registration::update(string fName, string lName){

    fullName = fName+" "+lName;
    if(camera) {
        if(camera->imageUpdated){
            
            int cameraW = camera->width;
            int cameraH = camera->height;
            //int cameraW = 500;
            //int cameraH = 500;
            
            
            unsigned const char * cameraPixels = camera->pixels;
            
            photo.setFromPixels(cameraPixels, cameraW, cameraH, OF_IMAGE_COLOR_ALPHA);
            //photo.crop(0, 0, photo.getWidth(), photo.getHeight()-1500);
            //photo.crop(0, photo.getHeight(), photo.getWidth(), 450);
            //photo.crop(0, 0, photo.getWidth(), 450);
            photo.crop(60, 80, 500, 460);
            
            imgPos.x = ofGetWidth()/2;
            imgPos.y = ofGetHeight()/2;
            
            camera->close();
            delete camera;
            camera = NULL;
        }
    }
    
}

void registration::draw(){
    ofBackground(0);
    ofSetColor(255);
    ofDrawBitmapString("Hi, "+ fullName, 50, 100);
    ofDrawBitmapString("tap HERE to take your picture!", 50,140);
    ofDrawBitmapString("Like your picture?", 50,ofGetHeight()-100);
    ofDrawBitmapString("Tap here to continue to your profile page", 50, ofGetHeight()-60);
    
    int x = imgPos.x - photo.width / 2;
    int y = imgPos.y - photo.height / 2;
    
    //photo.crop(0, 0, photo.getWidth(), photo.getHeight()-50);
    
	photo.draw(x, y);
}

void registration::grabImage(){
    if(!camera) {
        camera = new ofxiPhoneImagePicker();
        camera->setMaxDimension(MAX(ofGetWidth(), ofGetHeight())); // max the photo taken at the size of the screen.
        camera->openCamera();
        //            camera->showCameraOverlay();
    }
    
    imgPos.x=ofGetWidth()/2;
    imgPos.y=ofGetHeight()/2;
    
}

void registration::saveImage(){
    photo.resize(500, 500);
    ((testApp*) ofGetAppPtr())->profilePic = photo;
    
}
//
//  registration.h
//  sciGames
//
//  Created by Joseph Saavedra on 6/19/12.
//  Copyright (c) 2012 Saavedra. All rights reserved.
//

#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"

class registration{
    public:
        void setup();
        void update(string fName, string lName);
        void draw();
        void grabImage();
        void saveImage();
    
    ofxiPhoneImagePicker * camera;
    ofImage	photo;
    ofPoint imgPos;
    
    string fullName;
	
};
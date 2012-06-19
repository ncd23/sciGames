#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "registration.h"

class testApp : public ofxiPhoneApp{
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
    
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);
	
        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
    
    ofVideoGrabber grabber;
    ofTexture tex;
    unsigned char * pix;
    
    ofImage loginBG;
    ofImage profileBG;
    ofImage textField_on;
    
    int pageNumber; //0 = login, 1 = profile
	
    bool fNameTog;
    bool lNameTog;
    
    ofxiPhoneKeyboard * firstNameKey;
    ofxiPhoneKeyboard * lastNameKey;
    
    string firstName;
    string lastName;
    
    ofTrueTypeFont glypha;
    
    registration myRegPage;
    
    ofImage profilePic;
};

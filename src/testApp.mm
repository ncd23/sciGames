#include "testApp.h"

//845 x 1020


//--------------------------------------------------------------
void testApp::setup(){	
    
    tester = 55;
    
    myRegPage.setup();
    
	//ofxiPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
    ofxiPhoneSetOrientation(OFXIPHONE_ORIENTATION_PORTRAIT);
    
    ofTrueTypeFont::setGlobalDpi(72);
    glypha.loadFont("fonts/ExistenceLight.ttf", 70, true, true);
	glypha.setLineHeight(34.0f);
	glypha.setLetterSpacing(1.035);
    
    pageNumber = 0;
    
    fNameTog = false;
    lNameTog = false;
    monthTog = false;
    dayTog = false;
    yearTog = false;
    
    loginBG.loadImage("images/loginBG.jpg");
    profileBG.loadImage("images/profileBG.png");
    
    textField_on.loadImage("images/textField_on.png");
    
    firstNameKey = new ofxiPhoneKeyboard(125, 515, 525, 80); //30px in between
	firstNameKey->setVisible(true);
    firstNameKey->setPosition(135, 512);
	firstNameKey->setBgColor(255, 255, 255,0);
	firstNameKey->setFontColor(0,0,0,255);
	firstNameKey->setFontSize(60);
    
    lastNameKey = new ofxiPhoneKeyboard(125, 615, 525, 80); //30px in between
	lastNameKey->setVisible(true);
    lastNameKey->setPosition(135, 647);
	lastNameKey->setBgColor(255, 255, 255,0);
	lastNameKey->setFontColor(0,0,0,255);
	lastNameKey->setFontSize(60);
}

//--------------------------------------------------------------
void testApp::update(){
	ofBackground(255,255,255);
    firstName = firstNameKey->getText();
    lastName = lastNameKey->getText();
    
    if (firstNameKey-> isKeyboardShowing()) fNameTog=true;    
    if (lastNameKey-> isKeyboardShowing())  lNameTog=true;
    
    if (pageNumber == 2) myRegPage.update(firstName, lastName);
}

//--------------------------------------------------------------
void testApp::draw(){	
    ofBackground(255, 255, 255, 255);
    

    
    switch (pageNumber) {
            
        case 0: //login screen
            ofxiPhoneSetOrientation(OFXIPHONE_ORIENTATION_PORTRAIT);
            ofSetColor(255, 255, 255);
            ofScale(0.5, 0.5, 1.0);
            loginBG.draw(0,0);
            ofSetColor(255, 255, 255,255);
            
            if (fNameTog) textField_on.draw(255, 857);
            if (lNameTog) textField_on.draw(255, 1129);
            ofSetColor(255, 50, 100);
            if (monthTog) ofRect(133*2, 710*2, 160*2, 60*2);
            if (dayTog) ofRect(350*2, 710*2, 110*2, 60*2);
            if(yearTog) ofRect(500*2, 710*2, 150*2, 60*2);
            break;
            
        case 1: //profile screen
            ofxiPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
            ofScale(0.5, 0.5, 1.0);
            profileBG.draw(0,0);
            ofSetColor(255, 255,255);
            //string fullName;
            //fullName = (firstName + " " + lastName);
            glypha.drawString(firstName + " " + lastName, 100, 725);
            ofDrawBitmapString(firstName, 50, 100);
            ofDrawBitmapString(lastName, 50, 150);
            profilePic.draw(110, 160, 500, 500);
            break;
            
        case 2: //registration page
            ofxiPhoneSetOrientation(OFXIPHONE_ORIENTATION_PORTRAIT);
            myRegPage.draw();
            break;
            
        default:
            break;
    }
    
    /*
     UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)]; 
    
    NSInteger viewcount= 4; 
    for (int i = 0; i <viewcount; i++) 
    { 
        CGFloat y = i * self.view.frame.size.height; 
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, y,self.view.frame.size.width, self .view.frame.size.height)];      
        view.backgroundColor = [UIColor greenColor]; 
        [scrollview addSubview:view]; 
        [view release]; 
    }
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height *viewcount); 
    
    id s = [[NSString alloc] initWithString:@"Hello, World"]; 
    
    UIDatePicker *datePicker=[[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 480, 216)];
    datePicker.timeZone = [NSTimeZone defaultTimeZone]; datePicker.datePickerMode=UIDatePickerModeDate; datePicker.date=[NSDate date]; datePicker.maximumDate=[NSDate date]; [datePicker addTarget:s action:@selector(pickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    id s = [[NSString alloc] initWithString:@"Hello, World"]; 
    
    CGRect frame = CGRectMake(0.0, 0.0, 200.0, 10.0);
    UISlider *slider = [[UISlider alloc] initWithFrame:frame];
    [slider addTarget:s action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [slider setBackgroundColor:[UIColor clearColor]];
    slider.minimumValue = 0.0;
    slider.maximumValue = 50.0;
    slider.continuous = YES;
    slider.value = 25.0;
   */
}

//--------------------------------------------------------------
void testApp::exit(){
    
}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
    
    cout<<"touch.x: " << touch.x << "   y: "<< touch.y << endl;
    
    //welcome screen 
    if (pageNumber == 0){
        
        //hit login button
        if(touch.x > 135 && touch.x < 300 && touch.y > ofGetHeight()-180 && touch.y < ofGetHeight()-100){ 
        firstNameKey -> setVisible(false);
        lastNameKey -> setVisible(false);
        pageNumber = 1; //move to profile page
        }
        
        //hit registration button
        if (touch.x > 415 && touch.x < 600 && touch.y > ofGetHeight()-180 && touch.y < ofGetHeight()-100){ //hit login button
            firstNameKey -> setVisible(false);
            lastNameKey -> setVisible(false);
            ofxiPhoneSetOrientation(OFXIPHONE_ORIENTATION_PORTRAIT);
            pageNumber = 2; //move to registration page
        }
        
        //hit month button
        if (touch.x > 133 && touch.x < 293 && touch.y > 710 && touch.y < 770){ //hit MONTH button
            monthTog = true;
        }
        
        //hit day button
        if (touch.x > 350 && touch.x < 460 && touch.y > 710 && touch.y < 770){ //hit MONTH button
            dayTog = true;
        }
        
        //hit year button
        if (touch.x > 500 && touch.x < 650 && touch.y > 710 && touch.y < 770){ //hit MONTH button
            yearTog = true;
        }
    }
    
    

    
    //profile screen
    if (pageNumber == 1 && touch.x > 500 && touch.y < 500){
        fNameTog = false;
        lNameTog = false;
        pageNumber = 0; //go back to login page for now?
    }
    
    //registration screen 
    if (pageNumber == 2){
        if(touch.x < 200 && touch.y < 200){
            myRegPage.grabImage();
        }
        if(touch.y > ofGetHeight()-200 && touch.x < 200){
            myRegPage.saveImage();
            pageNumber = 1;
        }
    }
}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::lostFocus(){
    
}

//--------------------------------------------------------------
void testApp::gotFocus(){
    
}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){
    
}



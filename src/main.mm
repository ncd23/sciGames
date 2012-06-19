#include "ofMain.h"
#include "testApp.h"

int main(){
	ofSetupOpenGL(1024,768, OF_FULLSCREEN);			// <-------- setup the GL context
    //ofSetupOpenGL(1536, 2008, OF_FULLSCREEN);
	ofRunApp(new testApp);
}

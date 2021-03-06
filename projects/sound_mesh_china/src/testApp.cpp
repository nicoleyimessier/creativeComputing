#include "testApp.h"

//--------------------------------------------------------------
ofMesh testApp::pixelManipulate(ofImage imageA, ofMesh meshA, float intensityThreshold, float sketchDepth, float startX, float startY){
    
    //imageA.resize(200, 200);
    
    //create mesh with points as the primitive
    //meshA.setMode(OF_PRIMITIVE_POINTS);
    
    //create a mesh with lines
    meshA.setMode(OF_PRIMITIVE_LINE_LOOP);
    
    int w = imageA.getWidth();
    int h = imageA.getHeight();
    
    //loop through each pixel in the image using image width & height
    for (int x=0; x<w; x++){
        for(int y=0; y<h; y++){
            
            //create the color object at that pixel
            ofColor c = imageA.getColor(x, y);
            
            //check the intensity of the pixel's color
            float intensity = c.getLightness();
            
            //if the intensity exceeds the threshold, create a vertex at the location of the pixel
            //& color it with the pixel's color
            if (intensity >= intensityThreshold){
                
                //pushes brighter colors in the positive z direction
                //pushes whiter colors in the negative z direction
                float saturation = c.getSaturation();
                float z = ofMap(saturation, 0, 255, -sketchDepth, sketchDepth);
                
                //the image is now 1/4 the size of the OF window, so multiply
                //the pixel location by 4 so that the mesh covers the OF window
                ofVec3f pos(x, y-startY, z);
                meshA.addVertex(pos);
                meshA.addColor(c);
            }
        }
    }
    
    return meshA;
}

//--------------------------------------------------------------
void testApp::setup(){
    
    china.loadMovie("china.mov");
    china.play();
    //-----------------sound-----------------------
    soundStream.listDevices();
    int bufferSize = 256;
    
    
    left.assign(bufferSize, 0.0);
    right.assign(bufferSize, 0.0);
    volHistory.assign(400, 0.0);
    
    bufferCounter= 0;
    drawCounter= 0;
    smoothedVol     = 0.0;
    scaledVol= 0.0;
    soundStream.setup(this, 0, 2, 44100, bufferSize, 4);
    //-----------------sound-----------------------
    
    //-------------------mesh----------------------------
    imageOne.loadImage("china2.jpg");
    //-------------------mesh----------------------------
    
}

//--------------------------------------------------------------
void testApp::update(){
    
    china.update();
    //-----------------sound-----------------------
    //lets scale the vol up to a 0-1 range
    scaledVol = ofMap(smoothedVol, 0.0, 0.17, 0.0, 700.0, true);
    
    //lets record the volume into an array
    volHistory.push_back( scaledVol );
    
    //if we are bigger the the size we want to record - lets drop the oldest value
    if( volHistory.size() >= 400 ){
        volHistory.erase(volHistory.begin(), volHistory.begin()+1);
    }
    //-----------------sound-----------------------
}

//--------------------------------------------------------------
void testApp::draw(){
    
    china.draw(0, 0, ofGetWidth(), ofGetHeight());
    //-----------------sound-----------------------
    //    ofCircle(200, 200, scaledVol * 330.0f);
    
    cout<< scaledVol << endl;
    //-----------------sound-----------------------
    
    
    //-------------------mesh----------------------------
    ofColor centerColor = ofColor(85, 78, 68);
    ofColor edgeColor(0, 0, 0);
    //ofBackgroundGradient(centerColor, edgeColor, OF_GRADIENT_CIRCULAR);
    
    
    //3D view
    //left click to drag to rotate
    //right click to drag to zoom
    easyCam.begin();
    ofPushMatrix();
    ofTranslate(-ofGetWidth()/2, -ofGetHeight()/2);
    
    meshOne = pixelManipulate(imageOne, meshPassOne,  50,  scaledVol, 0, 0);
    meshOne.draw();
    
    meshTwo = pixelManipulate(imageOne, meshPassTwo,  50,  scaledVol, 0, -216);
    meshTwo.draw();
    
    meshThree = pixelManipulate(imageOne, meshPassThree,  50,  scaledVol, 0, -432);
    meshThree.draw();
    
    ofPopMatrix();
    easyCam.end();
    //-------------------mesh----------------------------
}
//--------------------------------------------------------------
void testApp::audioIn(float * input, int bufferSize, int nChannels){
    
    float curVol = 0.0;
    
    // samples are "interleaved"
    int numCounted = 0;
    
    //lets go through each sample and calculate the root mean square which is a rough way to calculate volume
    for (int i = 0; i < bufferSize; i++){
        left[i]= input[i*2]*0.5;
        right[i]= input[i*2+1]*0.5;
        
        curVol += left[i] * left[i];
        curVol += right[i] * right[i];
        numCounted+=2;
    }
    
    //this is how we get the mean of rms :)
    curVol /= (float)numCounted;
    
    // this is how we get the root of rms :)
    curVol = sqrt( curVol );
    
    smoothedVol *= 0.93;
    smoothedVol += 0.07 * curVol;
    
    bufferCounter++;
    
}

//--------------------------------------------------------------
void testApp::keyPressed(int key){
    if( key == 's' ){
        soundStream.start();
    }
    
    if( key == 'e' ){
        soundStream.stop();
    }
}

//--------------------------------------------------------------
void testApp::keyReleased(int key){
    
}

//--------------------------------------------------------------
void testApp::mouseMoved(int x, int y ){
    
}

//--------------------------------------------------------------
void testApp::mouseDragged(int x, int y, int button){
    
}

//--------------------------------------------------------------
void testApp::mousePressed(int x, int y, int button){
    
}

//--------------------------------------------------------------
void testApp::mouseReleased(int x, int y, int button){
    
}

//--------------------------------------------------------------
void testApp::windowResized(int w, int h){
    
}

//--------------------------------------------------------------
void testApp::gotMessage(ofMessage msg){
    
}

//--------------------------------------------------------------
void testApp::dragEvent(ofDragInfo dragInfo){
    
}

// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math';
class AnimationDemo{
  var context2D;
  final int speed=1000;
  final int circleSize=10;
  double hwidth=0.0;
  double hheight=0.0;
  AnimationDemo(CanvasElement canvas){
    this.context2D=canvas.context2D;
    Rectangle rect=canvas.client;
    this.hwidth=rect.width/2;
    this.hheight=rect.height/2;
    this.context2D
      ..fillStyle="#ff0"
      ..strokeStyle="#f00"
      ..lineWidth=1;
    
  }
void draw(double t){
  double x=cos(t/this.speed)*(this.hwidth-this.circleSize)+this.hwidth;
  double y=sin(t/this.speed)*(this.hheight-this.circleSize)+this.hheight;
  this.context2D
      ..clearRect(0,0,this.hwidth*2,this.hheight*2)
      ..beginPath()
      ..arc(x,y,this.circleSize,0,2*PI,false)
      ..fill()
      ..closePath()
      ..stroke();
  window.animationFrame.then((t)=>draw(t));
}
void start(){
  this.draw(0.0);  
}

void main() {
  CanvasElement canvas = querySelector("#sample_text_id");
  AnimationDemo app = new AnimationDemo(canvas);
  app.start();
  print("end main");
}
}
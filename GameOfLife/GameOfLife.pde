int tamano_Celda=10;
color celula_Viva = color(255 , 0 , 0);
color celula_Muerta=color(0);
int celdas[][];
int gCeldas[][];
float probabilidad_vida =15;
int xf=0;
int yf=0;
int intervalo=100;
int tiempo_Registrado=0;
boolean pausa =false;

void setup(){
  size(800,600);
  celdas= new int[width/tamano_Celda][height/tamano_Celda];
  gCeldas = new int[width/tamano_Celda][height/tamano_Celda];
  stroke(48);
  noSmooth();
  
  for (int x=0; x< width/tamano_Celda;x++){
    for(int y=0; y<height/tamano_Celda;y++){
      float estado = random (100);
      if (estado < probabilidad_vida){
        estado =1;
      }
      else {
        estado=0;
      }
      celdas[x][y]= int(estado);
    }
  }
  background(0);
}


void draw() {
  for (int x=0; x<width/tamano_Celda;x++){
    for(int y=0; y<height/tamano_Celda;y++){
      if (celdas[x][y]==1){
        fill(celula_Viva);
      }
        else{
          fill(celula_Muerta);
        }
        rect(x*tamano_Celda, y*tamano_Celda,tamano_Celda,tamano_Celda);
    }
  } 
  if (millis()-tiempo_Registrado>intervalo){
    if(!pausa){
      juego();
      tiempo_Registrado=millis();
    }
  }
    if (pausa && mousePressed){
      int xcelda = int(map(mouseX, 0, width, 0, width/tamano_Celda));
      xcelda = constrain(xcelda, 0, width/tamano_Celda-1);
      int ycelda = int ( map (mouseY, 0, height, 0, height/tamano_Celda));
      ycelda= constrain(ycelda, 0, height/tamano_Celda-1);
  if(gCeldas[xcelda][ycelda]==1){
    celdas[xcelda][ycelda]=0;
    fill(celula_Muerta);
  }
    else{
      celdas[xcelda][ycelda]=1;
      fill(celula_Viva);
    }
  }
  else if (pausa && !mousePressed){
    for(int x=0; x<width/tamano_Celda;x++){
      for(int y=0;y<height/tamano_Celda;y++){
        gCeldas[x][y]=celdas[x][y];
      }
    }
  }
}
void juego(){
  for (int x=0; x<width/tamano_Celda;x++){
    for(int y=0; y<height/tamano_Celda;y++){
      gCeldas[x][y]=celdas[x][y];
    }
  }
  for (int x=0; x<width/tamano_Celda;x++){
    for(int y=0; y<height/tamano_Celda;y++){
      int contador=0;
      for (int x1=x-1;x1<=x+1; x1++){
        for(int y1=y-1; y1<=y+1;y1++){
          if((x1>=0)&&(x1<width/tamano_Celda)&&(y1>=0)&&(y1<height/tamano_Celda)){
            
              if(!((x1==x)&&(y1==y))){
                if(gCeldas[x1][y1]==1){
              contador++;
                }
              
            }
          }
         
         
         
            }
          }
      if (gCeldas[x][y]==1){
        if((contador<2)||(contador>3)){
          celdas[x][y]=0;
        }
        }
        else{
          if(contador==3){
            celdas[x][y]=1;
          }
        }
      }         
    }
}

void keyPressed(){
  if (key==' ') { 
    pausa = !pausa;
  }
  if (key=='b' || key == 'B') { 
    for (int x=0; x<width/tamano_Celda; x++) {
      for (int y=0; y<height/tamano_Celda; y++) {
        celdas[x][y] = 0; 
      }
    }
  }
}

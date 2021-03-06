void setup () {

size(5000, 5000);
background(0);

float margin = 10;

String csvData[] = loadStrings("HumanPopulation.csv");
int dates[] = new int[csvData.length-1];
float populations[] = new float[csvData.length-1];

// Process csv
for (int i=1; i<csvData.length; i++) {
  String data[] = split(csvData[i], ",");
  dates[i-1] = int(data[0]);
  populations[i-1] = float(data[1]);
}

int dateRange = dates[dates.length-1] - dates[0];
float popRange = populations[populations.length-1] - populations[0];

float lastx3 = width/2;
float lasty3 = margin;
float lastx4 = width/2;
float lasty4 = margin;

// Axi
stroke(255);
line(width/2, margin, width/2, height-margin);
line(margin, height-margin, width-margin, height-margin);

// Draw image
noStroke();
fill(255);
for (int i=0; i<dates.length-1; i++) {
  int date = dates[i];
  float population = populations[i];
  
  float x1 = lastx3;
  float y1 = lasty3;
  float x2 = lastx4;
  float y2 = lasty4;
  float x3 = width/2 + ( population / popRange * (width-margin*2) / 2 );
  float y3 = margin + ( float(date - dates[0]) / dateRange * (height-margin*2) );
  float x4 = width - x3;
  float y4 = y3;
  
  lastx3 = x4;
  lasty3 = y4;
  lastx4 = x3;
  lasty4 = y3;
  
  beginShape();
  vertex(x1,y1);
  vertex(x2,y2);
  vertex(x3,y3);
  vertex(x4,y4);
  endShape(CLOSE);
}

}

void draw() {
}

void mouseClicked() {
  save("HumanFamilyTree.png");
}

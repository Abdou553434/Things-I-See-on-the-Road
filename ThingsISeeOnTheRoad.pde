Table data;

void setup() {
  size(1100, 850);
  data = loadTable("road_observations.csv", "header");

  println("Number of observations: " + data.getRowCount());
}

void draw() {
  background(245);

  // Title
  fill(30);
  textAlign(LEFT, BASELINE);
  textSize(32);
  text("Things I See on the Road", 40, 45);

  textSize(16);
  fill(80);
  text("Visualising my daily road observations", 40, 75);

  textSize(17);
  fill(30);
  text("Total observations: " + data.getRowCount(), 40, 108);

  // Category legend
  drawLegend();

  // Observation grid
  float startX = 48;
  float startY = 220;
  float spacingX = 205;
  float spacingY = 120;

  for (int i = 0; i < data.getRowCount(); i++) {
    TableRow row = data.getRow(i);

    String object = row.getString("Object");
    String category = row.getString("Category");
    String colour = row.getString("Colour");
    String date = row.getString("Date");
    String time = row.getString("Time");

    int column = i % 5;
    int rowNumber = i / 5;

    float x = startX + column * spacingX;
    float y = startY + rowNumber * spacingY;

    // Card background
    fill(255);
    stroke(215);
    strokeWeight(1);
    rect(x, y, 175, 112, 8);

    // Observation number
    fill(90);
    noStroke();
    textAlign(LEFT, BASELINE);
    textSize(11);
    text("#" + (i + 1), x + 10, y + 16);

    // Draw the category shape
    drawObject(x + 87.5, y + 45, category, colour);

    // Object name, inside the card
    fill(30);
    textAlign(CENTER, BASELINE);
    textSize(13);

    // Prevent long names from overflowing the card
    text(object, x + 8, y + 79, 159, 17);

    // Date and time
    fill(100);
    textSize(10);
    text(date + " | " + time, x + 8, y + 100, 159, 12);
  }
}


// Draw the category legend
void drawLegend() {
  float y = 155;

  textAlign(LEFT, BASELINE);
  textSize(12);
  fill(70);
  text("Category:", 40, y);

  // Transport
  fill(220, 60, 60);
  stroke(60);
  ellipse(141, y - 5, 16, 16);
  fill(50);
  noStroke();
  text("Transport", 155, y);

  // Nature
  fill(70, 170, 90);
  stroke(60);
  triangle(285, y - 14, 276, y + 3, 294, y + 3);
  fill(50);
  noStroke();
  text("Nature", 301, y);

  // Building
  fill(160);
  stroke(60);
  rectMode(CENTER);
  rect(410, y - 5, 16, 16);
  rectMode(CORNER);
  fill(50);
  noStroke();
  text("Building", 425, y);

  // People
  stroke(60);
  fill(70, 120, 220);
  ellipse(548, y - 11, 10, 10);
  line(548, y - 6, 548, y + 5);
  line(548, y, 541, y + 5);
  line(548, y, 555, y + 5);
  fill(50);
  noStroke();
  text("People", 565, y);

  // Sign / Advertisement
  fill(235, 190, 50);
  stroke(60);
  quad(685, y - 15, 696, y - 5,
       685, y + 5, 674, y - 5);
  fill(50);
  noStroke();
  text("Sign/Advertisement", 704, y);
}


// Draw a shape based on the category
void drawObject(float x, float y, String category, String colour) {
  int c = getColour(colour);

  fill(c);
  stroke(60);
  strokeWeight(1);

  if (category.equals("Transport")) {
    // Circle = Transport
    ellipse(x, y, 42, 42);

  } else if (category.equals("Nature")) {
    // Triangle = Nature
    triangle(x, y - 23, x - 23, y + 20, x + 23, y + 20);

  } else if (category.equals("Building")) {
    // Square = Building
    rectMode(CENTER);
    rect(x, y, 42, 42);
    rectMode(CORNER);

  } else if (category.equals("People")) {
    // Person symbol = People
    ellipse(x, y - 15, 18, 18);
    line(x, y - 5, x, y + 20);
    line(x, y + 5, x - 14, y + 12);
    line(x, y + 5, x + 14, y + 12);

  } else {
    // Diamond = Sign/Advertisement
    quad(x, y - 23, x + 23, y, x, y + 23, x - 23, y);
  }
}


// Convert colour names into Processing colours
int getColour(String colourName) {
  if (colourName.equals("Red")) {
    return color(220, 60, 60);
  } else if (colourName.equals("Green")) {
    return color(70, 170, 90);
  } else if (colourName.equals("Blue")) {
    return color(70, 120, 220);
  } else if (colourName.equals("White")) {
    return color(245, 245, 245);
  } else if (colourName.equals("Black")) {
    return color(40, 40, 40);
  } else if (colourName.equals("Yellow")) {
    return color(235, 200, 50);
  } else if (colourName.equals("Silver")) {
    return color(170, 175, 180);
  } else if (colourName.equals("Pink")) {
    return color(230, 120, 170);
  } else if (colourName.equals("Beige")) {
    return color(210, 190, 150);
  } else {
    return color(150);
  }
}

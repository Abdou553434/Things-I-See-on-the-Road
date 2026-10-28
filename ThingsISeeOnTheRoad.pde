Table data;

void setup() {
  size(1000, 700);

  // Load the CSV file
  data = loadTable("road_observations.csv", "header");

  println("Number of observations: " + data.getRowCount());
}

void draw() {
  background(245);

  // Title
  fill(30);
  textSize(32);
  text("Things I See on the Road", 40, 50);

  textSize(17);
  text("Visualising my daily road observations", 40, 80);

  // Number of observations
  textSize(16);
  text("Total observations: " + data.getRowCount(), 40, 115);

  // Draw observations
  float startX = 80;
  float startY = 170;

  float spacingX = 180;
  float spacingY = 100;

  for (int i = 0; i < data.getRowCount(); i++) {

    TableRow row = data.getRow(i);

    String object = row.getString("Object");
    String category = row.getString("Category");
    String colour = row.getString("Colour");
    String date = row.getString("Date");
    String time = row.getString("Time");

    // Calculate position
    int column = i % 5;
    int rowNumber = i / 5;

    float x = startX + column * spacingX;
    float y = startY + rowNumber * spacingY;

    // Draw object representation
    drawObject(x, y, category, colour);

    // Observation number
    fill(40);
    textSize(12);
    text("#" + (i + 1), x - 15, y - 35);

    // Object name
    textSize(14);
    text(object, x - 40, y + 35);

    // Date and time
    textSize(10);
    text(date, x - 40, y + 52);
    text(time, x - 40, y + 67);
  }
}


// Function to draw different shapes
// depending on the category
void drawObject(float x, float y, String category, String colour) {

  // Convert the colour name into an RGB value
  int c = getColour(colour);

  fill(c);
  stroke(50);
  strokeWeight(1);

  if (category.equals("Transport")) {

    // Circle for transport
    ellipse(x, y, 45, 45);

  } else if (category.equals("Nature")) {

    // Triangle for nature
    triangle(
      x, y - 25,
      x - 25, y + 20,
      x + 25, y + 20
    );

  } else if (category.equals("Building")) {

    // Square for buildings
    rectMode(CENTER);
    rect(x, y, 45, 45);
    rectMode(CORNER);

  } else if (category.equals("People")) {

    // Small person-like representation
    ellipse(x, y - 15, 20, 20);
    line(x, y - 5, x, y + 20);
    line(x, y + 5, x - 15, y + 12);
    line(x, y + 5, x + 15, y + 12);

  } else {

    // Diamond for signs/advertisements
    quad(
      x, y - 25,
      x + 25, y,
      x, y + 25,
      x - 25, y
    );
  }
}


// Convert colour names from the CSV
// into Processing colours
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
    return color(235, 200, 60);

  } else if (colourName.equals("Silver")) {
    return color(170, 175, 180);

  } else if (colourName.equals("Pink")) {
    return color(230, 120, 170);

  } else if (colourName.equals("Beige")) {
    return color(210, 190, 150);

  } else {

    // Default colour
    return color(150);
  }
}

Table data;

void setup() {
  size(800, 600);

  // Load the CSV file
  data = loadTable("road_observations.csv", "header");

  // Display the number of observations
  println("Number of observations: " + data.getRowCount());

  // Display the first five observations in the console
  for (int i = 0; i < min(5, data.getRowCount()); i++) {
    
    TableRow row = data.getRow(i);

    println(
      row.getString("Date") + " | " +
      row.getString("Time") + " | " +
      row.getString("Object") + " | " +
      row.getString("Category") + " | " +
      row.getString("Colour")
    );
  }
}

void draw() {
  background(240);

  fill(30);

  textSize(30);
  text("Things I See on the Road", 40, 50);

  textSize(18);
  text("My Dear Data 100 Project", 40, 85);

  textSize(16);
  text(
    "Observations collected: " + data.getRowCount(),
    40,
    125
  );
}

class Plant {
  boolean isShaded, isAlive;
  int x, growthStage, growthRate, nutrientLevel, waterLevel, stemHeight;
  ArrayList<PShape> stemParts; // A resizable array to hold stem parts as a plant grows
  
  Plant(int startX, int stemHeight) {
    // Assign values to field variables
    x = startX;
    this.stemHeight = stemHeight;
    growthStage = 0;
    growthRate = int(random(60,120)); // Interval (frames) between calling grow()
    nutrientLevel = 100;
    waterLevel = 100;
    isShaded = false; // under shade of another plant
    isAlive = true;
    stemParts = new ArrayList<>(); // Initialize the array
  }  
  
  void addStemPart() {
    if (growthStage < floor(height / stemHeight) - 1) {
      PShape stemPart = createShape(RECT, 0, 0, 5, stemHeight); // https://processing.org/reference/createShape_.html
      stemPart.setFill(color(90, 158, 95)); // Green fill
      shape(stemPart, x, height - (stemParts.size() + 1) * stemHeight); // positions next plant part
      stemParts.add(stemPart);
      growthStage += 1;
      nutrientLevel -= 10;
    }
  }
  
  void photosynthesize() {
    if (waterLevel > 20 && !isShaded) {
      waterLevel -= 20;
      nutrientLevel += 10;
    }
  }

  void flipShadedState() { // shaded only when a neighboring plant 
    isShaded = !isShaded;
  }
  
  void checkLiving() {
    if (isAlive == true && (waterLevel <= 5 || nutrientLevel <= 5)) {
      isAlive = false; 
      stemParts.clear(); // clear the array
      background(149, 181, 232);
    }
  }
    
    
  
  
  void update() {
    if (frameCount % growthRate == 0) { // only grow every at growthRate multiples
      addStemPart();
      checkLiving();
    }
  }
  
  
  

  
  
  // growthRate is random as different plants grow at different speeds
  // x and y are rectangle's position where in the rectangles are Pshapes,
    // leaves and stuff grow, plant should flower at biggest phase + leaves
    // nearby plants change the sunlight level
}

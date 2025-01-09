class Plant {
  boolean isShaded, isAlive;
  int x, growthStage, growthRate, nutrientLevel, waterLevel, stemHeight;
  ArrayList<PShape> stemParts; // A resizable array to hold stem parts as a plant grows
  
  Plant(int startX, int stemHeight) {
    // Assign values to field variables
    x = startX;
    this.stemHeight = stemHeight;
    growthStage = 0;
    growthRate = int(random(60,150)); // Interval (frames) between calling grow(); Each second is ~1 day
    nutrientLevel = int(random(45,60)); // Random values account for different kinds of seeds
    waterLevel = 50;
    isShaded = false; // under shade of another plant
    isAlive = true;
    stemParts = new ArrayList<>(); // Initialize the array
  }  
  
  void addStemPart() {
    if (growthStage < floor(height / stemHeight) - 1) {
      // Learned about PShape class:
      // https://processing.org/reference/PShape.html
      PShape stemPart = createShape(RECT, 0, 0, 5, stemHeight); 
      stemPart.setFill(color(90, 158, 95)); // Green fill
      shape(stemPart, x, height - (stemParts.size() + 1) * stemHeight); // positions next plant part
      stemParts.add(stemPart);
      growthStage += 1;
      nutrientLevel -= 15;
    }
  }
  
  void photosynthesize() {
    if (waterLevel > 25 && !isShaded) {
      waterLevel -= 25; 
      nutrientLevel += 10;
    } 
  }
  
  void absorbWater() {
    waterLevel += int(random(15,25)); // random accounts for varying levels of rainfall
  }
  
  void checkLiving() {
    if (isAlive == true && (waterLevel < 10 || nutrientLevel < 10)) {
      isAlive = false; 
      print("plant has died");
      stemParts.clear(); // clear the array
    }
  }
    
    
  
  
  void update() {
    if (frameCount % growthRate == 0 && isAlive == true) { // only grow every at growthRate multiples
      photosynthesize(); // use water, if not shaded, to get nutrients
      addStemPart(); // use nutrients to add part
      checkLiving(); // ensure plant's nutrients are not fully depleted
    }
  }
  
  
  

  
  
  // growthRate is random as different plants grow at different speeds
  // x and y are rectangle's position where in the rectangles are Pshapes,
    // leaves and stuff grow, plant should flower at biggest phase + leaves
    // nearby plants change the sunlight level
}

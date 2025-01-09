// plants growth

// variables which can be adjusted
// Prob delete: int SOIL_NUTRIENT_LEVEL; // Higher value = plants start with more nutrients
int RAIN_CHANCE = 30; // Percent chance rain starts at a second (MIN 0, MAX 100)
int NUM_PLANTS = 10; // How many plants are on the screen (MIN 2, MAX 50)
int STEM_SEGMENT_HEIGHT = 50; // Height of each stem segment; affects how many times plants can grow
Plant[] plants; // stores all plants



// init array of type plant, size numplants
// store all plants in an array, with a certain gap; neighboring plants are put


// sunlight is only affected by other plants; 
// neighboring plants reduce the sunlight level of others

// water level goes down over time, is increased for all when rain
// nutrirent level is affected by the soil nutrient richness

void setup() {
  size(700, 500);
  background(149, 181, 232);
  
  if (NUM_PLANTS > 50 || NUM_PLANTS < 2) {
    print("Please ensure NUM_PLANTS is an integer from 2 to 50");
    exit();
  } else { // Avoids negative array crash or having so many plants you can't see them
    plants = new Plant[NUM_PLANTS];
    for (int i = 0; i < NUM_PLANTS; i++) { // Populate the screen with plants
      // fit plants to screen
      plants[i] = new Plant(i * int(width / NUM_PLANTS) + int(width / NUM_PLANTS / 2), STEM_SEGMENT_HEIGHT);
    }
  }
  
  // ensure rain freq is positive and nutrient level
}

void draw() {
  // iterate through array, see if framecount is divisble by that index's growthrate
  
  for (int i = 0; i < NUM_PLANTS; i++) {
    plants[i].update();
  }


}

int rule_decimal = 0; // CHANGE HERE to draw a Cellular Automaton using a different rule
int cell_size = 2;

void setup() {
  size(1920, 860);
  noStroke();
  fill(0);
  // noLoop();
}

void draw() {
//  fill((int)random(255), (int)random(255), (int)random(255));
//  background((int)random(255), (int)random(255), (int)random(255));
  background(0, 255, 0);
 //  for (int rule_decimal = 0; rule_decimal < 3; rule_decimal++) {
  draw_rule(rule_decimal++, cell_size);
  saveFrame("./frames/rule-###.png");
//  saveFrame();
//  }
  //delay(1000);
  if (rule_decimal == 256) noLoop();
}

void draw_rule(int rule_d, int cell_size) {
  int[] rule_bin = dec_to_bin(rule_d);
  int[] prev_line = new int[width];
  prev_line[width/2] = 1;
  draw_line(prev_line, cell_size);
  for (int j = cell_size; j <= height; j += cell_size) {
    translate(0, cell_size);
    int[] this_line = compute_line(rule_bin, prev_line);
    draw_line(this_line, cell_size);
    prev_line = this_line;
  }
}

void draw_line(int[] line, int cell_size) {
  for (int i = 0; i < width; i += cell_size) {
    if (line[i] == 1) rect(i, 0, cell_size, cell_size);
  }
}

int[] compute_line(int[] rule_bin, int[] prev_line) {
  int a, b, c;
  int[] this_line = new int[width];
  for (int i = 0; i < width; i += cell_size) {
    if (i == 0) a = 0;
    else a = prev_line[i-cell_size];
    if (i == (width - cell_size)) c = 0;
    else c = prev_line[i+cell_size];
    b = prev_line[i];
    
    int bit = abc_to_bit(rule_bin, a, b, c);
    
    if (bit == 1) this_line[i] = bit;
  }
  return this_line;
}

int abc_to_bit(int[] rule_bin, int a, int b, int c) {
  int n = 4*a + 2*b + c;
  int bit = rule_bin[n];
  return bit;
}

/**
 * Returns the value of rightmost bit of n
 *
 * @param n decimal number whose last input is wanted
 * @return value of last bit of n
 */
int get_last_bit(int n) {
  return n % 2;
}

/**
 * Computes the binary form of decimal number n
 *
 * The binary form is stored in an int array of 0s and 1s called bits
 * bits[0] is the rightmost bit (less significant bit, i.e. decimal 1)
 * bits[7] is the leftmost bit (most significant bit, i.e. decimal 128)
 *
 * @param    n the decimal number to convert
 * @return     the array with number in binary form
 */
int[] dec_to_bin(int n) {
  int[] bits = new int[8];
  for (int i = 0; i < 8; i++) {
    bits[i] = get_last_bit(n);
    n = n >> 1;
  }
  return bits;
}

/**
 * Prints the binary number given in input as an array
 *
 * @param bin the binary number stored in an array of 8 ints
 */
void print_bin(int[] bin) {
  for (int i = 0; i < 8; i++) {
    println(bin[i]);
  }
}

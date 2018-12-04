int[] bin = new int[3];
int n = 5;  // 0000000101
bin[0] = n%2;
println(n%2);
n = n >> 1; // 0000000010
bin[1] = n%2;
println(n%2);
n = n >> 1; // 0000000001
bin[2] = n%2;
println(n%2);

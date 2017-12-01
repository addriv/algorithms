process.stdin.resume();
process.stdin.setEncoding('ascii');

var input_stdin = "";
var input_stdin_array = "";
var input_currentline = 0;

process.stdin.on('data', function (data) {
  input_stdin += data;
});

process.stdin.on('end', function () {
  input_stdin_array = input_stdin.split("\n");
  main();
});

function readLine() {
  return input_stdin_array[input_currentline++];
}

/////////////// ignore above this line ////////////////////

function main() {
  var t = parseInt(readLine());
  for (var a0 = 0; a0 < t; a0++) {
    var m = parseInt(readLine());
    var n = parseInt(readLine());
    a = readLine().split(' ');
    a = a.map(Number);
    console.log(iceCreamParlor(m, a));
  }

}

// Create a hash table for constant time lookup with keys as price and value of ID
// Check if the corresponding price value making totaling m exists in hash
// O(n) time complexity
function iceCreamParlor(m, arr) {
  if (arr === undefined) return;
  const prices = {};
  for (let i = 0; i < arr.length; i++) {
    const price = a[i];
    if (prices[m - price]) {
      return `${prices[m - price]} ${i + 1}`;
    };
    prices[price] = i + 1;
  }
}
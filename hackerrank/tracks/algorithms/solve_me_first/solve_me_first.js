// Return the sum of two integers read from stdin.
function solveMeFirst(a, b) {
  return a + b;
}

function main() {
  // write your code here.
  // call `readLine()` to read a line.
  // use console.log() to write to stdout

  var a = parseInt(readLine());
  var b = parseInt(readLine());;

  var res = solveMeFirst(a, b);
  console.log(res);
}

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

function countInversions(arr, len = arr.length) {
  // base case return nums if length <= 1
  if (arr.length <= 1) {
    return [arr, 0];
  }

  let numInversions = 0;

  const mid = Math.floor(arr.length / 2);
  const arr1 = arr.slice(0, mid);
  const arr2 = arr.slice(mid);

  const left = countInversions(arr1, len);
  const right = countInversions(arr2, len);

  const merged = merge(left[0], right[0], left[1] + right[1]);
  numInversions += merged[1];

  if (merged[0].length === len) {
    return numInversions;
  }
  else {
    return [merged[0], numInversions];
  }
}

function merge(left, right, inversions) {
  let sorted = [];
  while (left.length > 0 && right.length > 0) {
    if (left[0] > right[0]) {
      sorted.push(right.shift());
      inversions += left.length;
    } else {
      sorted.push(left.shift());
    }
  }

  sorted = sorted.concat(left).concat(right);

  return [sorted, inversions];
}

function main() {
  var t = parseInt(readLine());
  for (var a0 = 0; a0 < t; a0++) {
    var n = parseInt(readLine());
    arr = readLine().split(' ');
    arr = arr.map(Number);
    var result = countInversions(arr);
    process.stdout.write("" + result + "\n");
  }

}

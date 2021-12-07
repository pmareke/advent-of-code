export function solvePart1(input: string[]): number {
  const numbers = input[0].split(',').map(Number);
  const m = median(numbers);

  return numbers.reduce((acc, current) => (acc += Math.abs(current - m)), 0);
}

export function solvePart2(input: string[]): number {
  const numbers = input[0].split(',').map(Number);
  const lowestSums = [];

  for (let i = Math.min(...numbers); i <= Math.max(...numbers); i++) {
    let total = 0;
    numbers.forEach((subject) => (total += factorial(Math.abs(subject - i))));
    lowestSums.push(total);
  }
  return Math.min(...lowestSums);
}

function median(numbers: number[]): number {
  const half = Math.floor(numbers.length / 2);
  const sorted = numbers.sort((a, b) => a - b);

  return numbers.length % 2 !== 0
    ? sorted[half]
    : (sorted[half - 1] + sorted[half]) / 2;
}

function factorial(num: number): number {
  let result = 0;
  for (let i = 1; i <= num; i++) result += i;
  return result;
}

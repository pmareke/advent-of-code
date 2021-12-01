export function solvePart1(input: number[]): number {
  return input
    .slice(1)
    .reduce((acc, m, index) => (m > input[index] ? ++acc : acc), 0);
}

export function solvePart2(input: number[]): number {
  return input.slice(3).reduce((acc, m, index) => {
    const lastTwo = input[index + 1] + input[index + 2];
    return m + lastTwo > input[index] + lastTwo ? ++acc : acc;
  }, 0);
}

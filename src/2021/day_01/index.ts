export function solvePart1(input: number[]): number {
  return findIncreasesWithStep(input, 1);
}

export function solvePart2(input: number[]): number {
  return findIncreasesWithStep(input, 3);
}

function findIncreasesWithStep(input: number[], step: number): number {
  return input
    .slice(step)
    .reduce(
      (acc, measurement, index) => (measurement > input[index] ? ++acc : acc),
      0,
    );
}

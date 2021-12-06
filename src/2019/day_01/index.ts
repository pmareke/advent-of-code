export function solvePart1(input: number[]): number {
  return input.reduce(
    (acc, current) => (acc += Math.floor(current / 3) - 2),
    0,
  );
}

export function solvePart2(input: number[]): number {
  return input.reduce((acc, current) => (acc += calculateMass(current)), 0);
}

function calculateMass(input: number): number {
  const mass = Math.floor(input / 3) - 2;
  return mass <= 0 ? 0 : mass + calculateMass(mass);
}

export function solvePart1(input: number[]): number {
  return input.reduce((acc, current) => (acc += current), 0);
}

export function solvePart2(input: number[]): number {
  const seen = new Set([0]);
  let frequency = 0;

  // eslint-disable-next-line no-constant-condition
  while (true) {
    for (const delta of input) {
      frequency += delta;
      if (seen.has(frequency)) {
        return frequency;
      }
      seen.add(frequency);
    }
  }
}

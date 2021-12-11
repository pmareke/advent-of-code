export function createCave(input: string[]): number[][] {
  return input.reduce((acc, line, i) => {
    acc[i] = line
      .split('')
      .map(Number)
      .reduce((acc1, n) => {
        acc1.push(n);
        return acc1;
      }, [] as number[]);
    return acc;
  }, [] as number[][]);
}

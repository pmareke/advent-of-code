export function createMatrix(input: string[]): number[][] {
  return input.reduce((acc, line, index) => {
    acc[index] = line
      .split('')
      .filter((l) => l !== '')
      .map(Number);
    return acc;
  }, [] as number[][]);
}

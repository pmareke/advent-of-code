export function solvePart1(input: string[]): number {
  return input
    .filter((x) => x.length > 0)
    .reduce((acc, current) => {
      const [length, width, height]: number[] = current.split('x').map(Number);
      const box = 2 * length * width + 2 * width * height + 2 * height * length;
      const sorted = [height, length, width].sort((a, b) => (a < b ? -1 : 1));
      acc += box + sorted[0] * sorted[1];
      return acc;
    }, 0);
}

export function solvePart2(input: string[]): number {
  return input
    .filter((x) => x.length > 0)
    .reduce((acc, current) => {
      const [length, width, height]: number[] = current.split('x').map(Number);
      const sorted = [height, length, width].sort((a, b) => (a < b ? -1 : 1));
      const ribbon = sorted[0] * 2 + sorted[1] * 2;
      acc += ribbon + length * width * height;
      return acc;
    }, 0);
}

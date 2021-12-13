export function createMatrix(input: string[]): string[][] {
  let width = 0;
  let height = 0;

  const points = input.reduce((acc, line, index) => {
    acc[index] = line
      .split(',')
      .filter((l) => l !== '')
      .map(Number);
    width = Math.max(acc[index][0], width);
    height = Math.max(acc[index][1], height);
    return acc;
  }, [] as number[][]);

  const matrix: string[][] = [];
  for (let i = 0; i <= height; i++) {
    matrix[i] = [];
    for (let j = 0; j <= width; j++) {
      matrix[i].push('.');
    }
  }

  points.forEach(([x, y]) => {
    matrix[y][x] = '#';
  });

  return matrix;
}

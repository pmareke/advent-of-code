import { createMatrix } from './utils';

export function solvePart1(input: string[]): number {
  const index = input.findIndex((l) => l === '');
  const points = input.slice(0, index);
  const instructions = input.slice(index + 1, input.length);
  let matrix = createMatrix(points);

  const [axis, line] = instructions[0].split('fold along ')[1].split('=');
  matrix = fold(matrix, axis, Number(line));

  return matrix.flat().filter((x) => x === '#').length;
}

export function solvePart2(input: string[]): number {
  const index = input.findIndex((l) => l === '');
  const points = input.slice(0, index);
  const instructions = input
    .slice(index + 1, input.length)
    .filter((i) => i !== '');
  let matrix = createMatrix(points);

  for (let i = 0; i < instructions.length; i++) {
    const [axis, line] = instructions[i].split('fold along ')[1].split('=');
    matrix = fold(matrix, axis, Number(line));
  }

  // HZKHFEJZ
  console.log(
    matrix.map((row) => row.join('').replace(/\./g, '  ')).join('\r\n'),
  );

  return matrix.flat().filter((x) => x === '#').length;
}

function fold(matrix: string[][], axis: string, line: number): string[][] {
  if (axis === 'y') {
    for (let i = line + 1; i < matrix.length; i++) {
      for (let j = 0; j <= matrix[0].length; j++) {
        if (matrix[matrix.length - i - 1][j] === '.')
          matrix[matrix.length - i - 1][j] = matrix[i][j];
      }
    }
    return matrix.splice(0, line + 1);
  } else {
    for (let i = 0; i < matrix.length; i++) {
      let x = 0;
      for (let j = line + 1; j < matrix[0].length; j++) {
        x++;
        if (matrix[i][line - x] === '.') matrix[i][line - x] = matrix[i][j];
      }
    }

    for (let i = 0; i < matrix.length; i++)
      matrix[i] = matrix[i].splice(0, line + 1);

    return matrix;
  }
}

import { createMatrix } from './utils';

export function solvePart1(input: string[]): number {
  return find(createMatrix(input));
}

export function solvePart2(input: string[]) {
  const matrix = createMatrix(input);
  const size = matrix.length;
  return solve(
    size * 5,
    (y, x) =>
      ((matrix[y % size][x % size] +
        Math.floor(x / size) +
        Math.floor(y / size) +
        8) %
        9) +
      1,
  );
}

function find(matrix: number[][]): number {
  const solution: number[][] = matrix;

  solution[0][0] = 0;

  for (let i = 1; i < matrix.length; i++) {
    solution[0][i] = matrix[0][i] + solution[0][i - 1];
  }

  for (let i = 1; i < matrix.length; i++) {
    solution[i][0] = matrix[i][0] + solution[i - 1][0];
  }

  for (let i = 1; i < matrix.length; i++) {
    for (let j = 1; j < matrix.length; j++) {
      solution[i][j] =
        matrix[i][j] + Math.min(solution[i - 1][j], solution[i][j - 1]);
    }
  }

  return solution[solution.length - 1][solution.length - 1];
}

function solve(size: number, map: (y: number, x: number) => number): number {
  const dist = [];
  const done = [];

  for (let y = 0; y < size; ++y) {
    const done_row = [];
    const dist_row = [];
    for (let x = 0; x < size; ++x) {
      done_row[x] = 1;
      dist_row[x] = Infinity;
    }
    done.push(done_row);
    dist.push(dist_row);
  }

  dist[0][0] = 0;
  done[0][0] = 2;
  const queue = [[0, 0]];

  while (queue.length > 0) {
    let min_dist = Infinity;
    let min_dist_idx = 0;

    for (let i = 0; i < queue.length; ++i) {
      const [yy, xx] = queue[i];
      if (dist[yy][xx] < min_dist) {
        min_dist = dist[yy][xx];
        min_dist_idx = i;
      }
    }

    const [y, x] = queue[min_dist_idx];
    queue[min_dist_idx] = queue[queue.length - 1];
    queue.length--;
    done[y][x] = 3;

    for (const [yy, xx] of neigh(size, y, x)) {
      if (done[yy][xx] == 3) continue;

      dist[yy][xx] = Math.min(dist[yy][xx], dist[y][x] + map(yy, xx));

      if (done[yy][xx] == 1) {
        done[yy][xx] = 2;
        queue.push([yy, xx]);
      }
    }
  }
  return dist[size - 1][size - 1];
}

function* neigh(
  L: number,
  row: number,
  col: number,
): Iterable<[number, number]> {
  if (row > 0) {
    yield [row - 1, col];
  }
  if (row < L - 1) {
    yield [row + 1, col];
  }
  if (col > 0) {
    yield [row, col - 1];
  }
  if (col < L - 1) {
    yield [row, col + 1];
  }
}

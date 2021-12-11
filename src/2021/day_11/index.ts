import { createCave } from './utils';

export function solvePart1(input: string[]): number {
  const cave = createCave(input);

  return Array.from({ length: 100 }).reduce<number>((acc) => {
    acc += nextStep(cave);
    return acc;
  }, 0);
}

export function solvePart2(input: string[]): number {
  const cave = createCave(input);
  let steps = 0;

  do {
    steps++;
    nextStep(cave);
  } while (!cave.every((line) => line.every((l) => l === 0)));

  return steps;
}

function nextStep(cave: number[][]): number {
  let lights = 0;

  for (let row = 0; row < cave.length; row++) {
    for (let col = 0; col < cave[row].length; col++) {
      cave[row][col]++;
    }
  }

  do {
    for (let i = 0; i < cave.length; i++) {
      for (let j = 0; j < cave[i].length; j++) {
        if (cave[i][j] >= 10) {
          cave[i][j] = 0;
          lights += 1;
          increaseAdjacents(cave, i, j);
        }
      }
    }
  } while (pendingFlashes(cave));

  return lights;
}

function increaseAdjacents(cave: number[][], i: number, j: number) {
  /*
      |__LU__|_U_|__UP__|
      |__L___|_C_|__R___|
      |__LD__|_D_|__RD__|
  */

  // Up
  if (j > 0 && cave[i][j - 1] != 0) cave[i][j - 1] += 1;
  // Right-Up
  if (i < cave.length - 1 && j > 0 && cave[i + 1][j - 1] != 0)
    cave[i + 1][j - 1] += 1;
  // Right
  if (i < cave.length - 1 && cave[i + 1][j] != 0) cave[i + 1][j] += 1;
  // Right-Down
  if (
    i < cave.length - 1 &&
    j < cave[i + 1].length - 1 &&
    cave[i + 1][j + 1] != 0
  ) {
    cave[i + 1][j + 1] += 1;
  }
  // Down
  if (j < cave[i].length - 1 && cave[i][j + 1] != 0) cave[i][j + 1] += 1;
  // Down-Left
  if (i > 0 && j < cave[i - 1].length - 1 && cave[i - 1][j + 1] != 0)
    cave[i - 1][j + 1] += 1;
  // Left
  if (i > 0 && cave[i - 1][j] != 0) cave[i - 1][j] += 1;
  // Left-Up
  if (i > 0 && j > 0 && cave[i - 1][j - 1] != 0) cave[i - 1][j - 1] += 1;
}

function pendingFlashes(input: number[][]): boolean {
  return input.some((line) => line.some((digit) => digit >= 10));
}

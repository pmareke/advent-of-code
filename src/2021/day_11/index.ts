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
  } while (pendingFlashes(cave, 10));

  return lights;
}

function increaseAdjacents(cave: number[][], i: number, j: number) {
  if (i > 0 && cave[i - 1][j] != 0) cave[i - 1][j] += 1;

  if (i > 0 && j < cave[i - 1].length - 1 && cave[i - 1][j + 1] != 0) {
    cave[i - 1][j + 1] += 1;
  }

  if (j < cave[i].length - 1 && cave[i][j + 1] != 0) cave[i][j + 1] += 1;

  if (i < cave.length - 1 && cave[i + 1][j] != 0) {
    cave[i + 1][j] += 1;
  }

  if (i < cave.length - 1 && j > 0 && cave[i + 1][j - 1] != 0) {
    cave[i + 1][j - 1] += 1;
  }

  if (j > 0 && cave[i][j - 1] != 0) cave[i][j - 1] += 1;

  if (i > 0 && j > 0 && cave[i - 1][j - 1] != 0) cave[i - 1][j - 1] += 1;

  if (
    i < cave.length - 1 &&
    j < cave[i + 1].length - 1 &&
    cave[i + 1][j + 1] != 0
  ) {
    cave[i + 1][j + 1] += 1;
  }
}

function pendingFlashes(input: number[][], num: number) {
  return input.reduce((acc, arr) => {
    arr = arr.filter((digit) => (num < 10 ? digit == num : digit >= 10));
    acc += arr.length;
    return acc;
  }, 0);
}

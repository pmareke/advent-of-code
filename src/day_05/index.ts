import { Coordinates } from './types';
import { generateCoordinates, parseInput } from './utils';

export function solvePart1(input: string[]): number {
  const pairs = parseInput(input).filter(
    ({ x1, x2, y1, y2 }) => x1 === x2 || y1 === y2,
  );
  const { max, coordinates } = generateCoordinates(pairs);
  const forest = createForest(max);
  const map = solveForest(forest, coordinates);
  return map.flatMap((x) => x).filter((x) => x > 1).length;
}

export function solvePart2(input: string[]): number {
  const pairs = parseInput(input);
  const { max, coordinates } = generateCoordinates(pairs);
  const forest = createForest(max);
  const map = solveForest(forest, coordinates);
  return map.flatMap((x) => x).filter((x) => x > 1).length;
}

function createForest(max: number): number[][] {
  const map: number[][] = [];

  for (let i = 0; i <= max; i++) {
    map[i] = [];
    for (let j = 0; j <= max; j++) {
      map[i][j] = 0;
    }
  }

  return map;
}

function solveForest(map: number[][], pairs: Coordinates[]): number[][] {
  Object.entries(pairs).forEach(([, { x, y }]) => {
    map[y][x]++;
  });

  return map;
}

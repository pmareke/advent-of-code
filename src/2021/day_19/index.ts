import { Solver } from './utils';

export function solvePart1(input: string[]): number {
  return new Solver(input).partOne;
}

export function solvePart2(input: string[]): number {
  return new Solver(input).partTwo;
}

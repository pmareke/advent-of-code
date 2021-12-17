import { parse } from './utils';

export function solvePart1(input: string[]): number {
  const packages = parse(input);
  return packages[0].sum();
}

export function solvePart2(input: string[]) {
  return 0;
}

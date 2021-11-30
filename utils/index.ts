import { readFileSync } from 'fs';

export function readAllLines(day: string): string[] {
  return readFileSync(`./inputs/day${day}.in`)
    .toString()
    .split('\n')
    .map((s) => s.replace(/\r$/, ''))
    .filter((s) => s.length > 0);
}

export function readAllLinesAsNumbers(day: string): number[] {
  return readAllLines(day).map(Number);
}

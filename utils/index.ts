import { readFileSync } from 'fs';

export function readFile(year: string, day: string): string[] {
  return readFileSync(`./inputs/${year}/day${day}.in`).toString().split('\n');
}

export function readAllLines(year: string, day: string): string[] {
  return readFileSync(`./inputs/${year}/day${day}.in`)
    .toString()
    .split('\n')
    .map((s) => s.replace(/\r$/, ''))
    .filter((s) => s.length > 0);
}

export function readAllLinesAsNumbers(year: string, day: string): number[] {
  return readAllLines(year, day).map(Number);
}

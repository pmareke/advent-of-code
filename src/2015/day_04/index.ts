import { md5 } from './utils';

export function solvePart1(input: string[]): number {
  let result = '';
  let i = 0;
  while (!result.startsWith('00000')) {
    result = md5(`${input[0]}${i}`);
    i++;
  }
  return i - 1;
}

export function solvePart2(input: string[]): number {
  let result = '';
  let i = 0;
  while (!result.startsWith('000000')) {
    result = md5(`${input[0]}${i}`);
    i++;
  }
  return i - 1;
}

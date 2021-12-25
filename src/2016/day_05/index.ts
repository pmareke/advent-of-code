import { md5 } from './utils';

export function solvePart1(input: string[]): string {
  let result = '';
  let i = 0;
  while (result.length < 8) {
    const hash = md5(`${input[0]}${i}`);
    if (hash.startsWith('00000')) result += hash[5];
    i++;
  }
  return result;
}

export function solvePart2(input: string[]): string {
  const result = Array.from({ length: 8 }).fill(undefined);
  let i = 0;
  while (result.some((x) => x === undefined)) {
    const hash = md5(`${input[0]}${i}`);
    const key = Number(hash[5]);
    if (hash.startsWith('00000') && result[key] === undefined) {
      result[key] = hash[6];
    }
    i++;
  }
  return result.join('').slice(0, 8);
}

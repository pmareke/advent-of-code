import { Room } from './types';
import { decrypt, isReal, parseLines } from './utils';

export function solvePart1(input: string[]): number {
  return parseLines(input)
    .filter(isReal)
    .reduce((acc, room) => (acc += room.dash), 0);
}

export function solvePart2(input: string[]): number {
  // eslint-disable-next-line @typescript-eslint/no-non-null-assertion
  return parseLines(input)
    .filter(isReal)
    .map(({ name, dash }: Room) => ({
      name: decrypt(name, dash),
      id: dash,
    }))
    .find(({ name }) => name.includes('north'))!.id;
}

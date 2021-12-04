import { Game } from './types';
import { parseInput } from './utils';

export function solvePart1(input: string[]): number {
  let win = false;
  let winner = 0;
  const { numbers, boards }: Game = parseInput(input);
  for (let i = 0; i < numbers.length; i++) {
    for (let j = 0; j < boards.length; j++) {
      boards[j].play(numbers[i]);
      if (boards[j].isBingo()) {
        win = true;
        winner = j;
      }
    }
    if (win) break;
  }
  return boards[winner].result;
}

export function solvePart2(input: string[]): number {
  const winners = new Set();
  let win = false;
  let winner = 0;
  const { numbers, boards }: Game = parseInput(input);
  for (let i = 0; i < numbers.length; i++) {
    for (let j = 0; j < boards.length; j++) {
      if (!winners.has(boards[j])) {
        boards[j].play(numbers[i]);
        if (boards[j].isBingo()) {
          winners.add(boards[j]);
          if (winners.size == boards.length) {
            win = true;
            winner = j;
          }
        }
      }
    }
    if (win) break;
  }
  return boards[winner].result;
}

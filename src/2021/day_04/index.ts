import { Game } from './types';
import { parseInput } from './utils';

export function solvePart1(input: string[]): number {
  let winner = 0;
  const { numbers, boards }: Game = parseInput(input);

  loop: for (let i = 0; i < numbers.length; i++) {
    for (let j = 0; j < boards.length; j++) {
      const board = boards[j];
      board.play(numbers[i]);
      if (board.isBingo()) {
        winner = j;
        break loop;
      }
    }
  }
  return boards[winner].score;
}

export function solvePart2(input: string[]): number {
  const winners = new Set();
  let winner = 0;
  const { numbers, boards }: Game = parseInput(input);
  loop: for (let i = 0; i < numbers.length; i++) {
    for (let j = 0; j < boards.length; j++) {
      if (winners.has(boards[j])) continue;

      const board = boards[j];
      board.play(numbers[i]);
      if (board.isBingo()) {
        winners.add(board);
        if (winners.size == boards.length) {
          winner = j;
          break loop;
        }
      }
    }
  }
  return boards[winner].score;
}

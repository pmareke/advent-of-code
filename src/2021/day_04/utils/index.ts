import { BaseBingo } from '../bingo';
import { Bingo, Game } from '../types';

export function parseInput(input: string[]): Game {
  const numbers: number[] = input[0].split(',').map(Number);

  const boards: Bingo[] = [];
  let lines: string[] = [];

  input.slice(2).forEach((line) => {
    if (line === '') {
      boards.push(new BaseBingo(lines));
      lines = [];
    } else {
      lines.push(line);
    }
  });

  return {
    numbers,
    boards,
  };
}

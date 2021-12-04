import { Bingo } from '../bingo';
import { Board, Game } from '../types';

export function parseInput(input: string[]): Game {
  const numbers: number[] = input[0].split(',').map(Number);

  const matrix = input.slice(1).filter((line) => line !== '');
  const boards: Board[] = [];
  let lines: string[] = [];

  for (let index = 0; index < matrix.length; index++) {
    if (index % 5 === 0 && index !== 0) {
      boards.push(new Bingo(lines));
      lines = [];
    }
    lines.push(matrix[index]);
  }

  boards.push(new Bingo(lines));

  return {
    numbers,
    boards,
  };
}

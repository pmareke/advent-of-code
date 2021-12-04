import { solvePart1, solvePart2 } from '../src/day_04';
import { parseInput } from '../src/day_04/utils';
import { readFile } from '../utils';
import { TestCase } from '../utils/types';

const example: string[] = [
  '7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1',
  '',
  '22 13 17 11  0',
  '8  2 23  4 24',
  '21  9 14 16  7',
  '6 10  3 18  5',
  '1 12 20 15 19',
  '',
  '3 15  0  2 22',
  '9 18 13 17  5',
  '19  8  7 25 23',
  '20 11 10 24  4',
  '14 21 16 12  6',
  '',
  '14 21 17 24  4',
  '10 16 15  9 19',
  '18  8 23 26 20',
  '22 11 13  6  5',
  '2  0 12  3  7',
  '',
];

const real: string[] = readFile('04');

describe('Day Four', () => {
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 4512,
      },
      {
        name: 'real',
        input: real,
        expected: 39902,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart1(input)).toBe(expected);
      });
    });
  });

  describe('Part Two', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 1924,
      },
      {
        name: 'real',
        input: real,
        expected: 26936,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });

  describe('Parser', () => {
    const game = parseInput(example);
    it('create a Bingo game', () => {
      expect(game.boards).toHaveLength(3);
      expect(game.numbers).toHaveLength(27);
    });
    game.boards.forEach((board) => {
      it('valid boards', () => {
        expect(board.numberOfColumns).toBe(5);
        expect(board.numberOfRows).toBe(5);
      });
    });
  });
});

import { solvePart1, solvePart2 } from '../../src/2021/day_21';
import { readFile } from '../../utils';
import { TestCase } from '../../utils/types';

const example = [
  'Player 1 starting position: 4',
  'Player 2 starting position: 8',
];
const real: string[] = readFile('2021', '21');

describe('Day Twenty First', () => {
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 739785,
      },
      {
        name: 'real',
        input: real,
        expected: 504972,
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
        expected: 444356092776315,
      },
      {
        name: 'real',
        input: real,
        expected: 891324120526332,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});

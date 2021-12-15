import { solvePart1, solvePart2 } from '../../src/2021/day_15';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

const example: string[] = [
  '1163751742',
  '1381373672',
  '2136511328',
  '3694931569',
  '7463417111',
  '1319128137',
  '1359912421',
  '3125421639',
  '1293138521',
  '2311944581',
];

const real: string[] = readAllLines('2021', '15');

describe('Day Fifteenth', () => {
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 40,
      },
      {
        name: 'real',
        input: real,
        expected: 707,
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
        expected: 315,
      },
      {
        name: 'real',
        input: real,
        expected: 2942,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});

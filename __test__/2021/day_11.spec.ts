import { solvePart1, solvePart2 } from '../../src/2021/day_11';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

const example: string[] = [
  '5483143223',
  '2745854711',
  '5264556173',
  '6141336146',
  '6357385478',
  '4167524645',
  '2176841721',
  '6882881134',
  '4846848554',
  '5283751526',
];

const example2: string[] = ['11111', '19991', '19191', '19991', '11111'];

const real: string[] = readAllLines('2021', '11');

describe('Day Eleven', () => {
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 1656,
      },
      {
        name: 'real',
        input: real,
        expected: 1721,
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
        expected: 195,
      },
      {
        name: 'real',
        input: real,
        expected: 298,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});

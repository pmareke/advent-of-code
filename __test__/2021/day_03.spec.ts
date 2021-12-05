import { solvePart1, solvePart2 } from '../../src/2021/day_03';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

const example: string[] = [
  '00100',
  '11110',
  '10110',
  '10111',
  '10101',
  '01111',
  '00111',
  '11100',
  '10000',
  '11001',
  '00010',
  '01010',
];
const real: string[] = readAllLines('2021', '03');

describe('Day Three', () => {
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 198,
      },
      {
        name: 'real',
        input: real,
        expected: 2035764,
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
        expected: 230,
      },
      {
        name: 'real',
        input: real,
        expected: 2817661,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});

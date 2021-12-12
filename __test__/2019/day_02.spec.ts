import { solvePart1, solvePart2 } from '../../src/2019/day_02';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day Two', () => {
  const example = [1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50];
  const real = readAllLines('2019', '02')[0].split(',').map(Number);
  describe('Part One', () => {
    const testCases: TestCase<number>[] = [
      {
        name: 'example',
        input: example,
        expected: 3500,
      },
      {
        name: 'real',
        input: real,
        noun: 12,
        verb: 2,
        expected: 3716250,
      },
    ];

    testCases.forEach(({ name, input, noun, verb, expected }) => {
      it(`${name}`, () => {
        expect(solvePart1([...input], noun ?? 9, verb ?? 10)).toBe(expected);
      });
    });
  });

  describe('Part Two', () => {
    const testCases: TestCase<number>[] = [
      {
        name: 'real',
        input: real,
        expected: 6472,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2([...input])).toBe(expected);
      });
    });
  });
});

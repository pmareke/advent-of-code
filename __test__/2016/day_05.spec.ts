import { solvePart1, solvePart2 } from '../../src/2016/day_05';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day Five', () => {
  const example = ['abc'];
  const real = readAllLines('2016', '05');

  describe.skip('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: '18f47a30',
      },
      {
        name: 'real',
        input: real,
        expected: '4543c154',
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
        expected: '05ace8e3',
      },
      {
        name: 'real',
        input: real,
        expected: '1050cbbd',
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});

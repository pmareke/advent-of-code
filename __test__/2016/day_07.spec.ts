import { solvePart1, solvePart2 } from '../../src/2016/day_07';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day Seven', () => {
  const example = [
    'abba[mnop]qrst',
    'abcd[bddb]xyyx',
    'aaaa[qwer]tyui',
    'ioxxoj[asdfgh]zxcvbn',
  ];

  const example2 = [
    'aba[bab]xyz',
    'xyx[xyx]xyx',
    'aaa[kek]eke',
    'zazbz[bzb]cdb',
  ];
  const real = readAllLines('2016', '07');

  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 2,
      },
      {
        name: 'real',
        input: real,
        expected: 118,
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
        input: example2,
        expected: 3,
      },
      {
        name: 'real',
        input: real,
        expected: 260,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});

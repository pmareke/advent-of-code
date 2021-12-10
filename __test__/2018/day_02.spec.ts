import { solvePart1, solvePart2 } from '../../src/2018/day_02';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day One', () => {
  const real = readAllLines('2018', '02');
  describe('Part One', () => {
    const example = [
      'abcdef',
      'bababc',
      'abbcde',
      'abcccd',
      'aabcdd',
      'abcdee',
      'ababab',
    ];
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 12,
      },
      {
        name: 'real',
        input: real,
        expected: 4940,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart1(input)).toBe(expected);
      });
    });
  });

  describe('Part Two', () => {
    const example = [
      'abcde',
      'fghij',
      'klmno',
      'pqrst',
      'fguij',
      'axcye',
      'wvxyz',
    ];
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 'fgij',
      },
      {
        name: 'real',
        input: real,
        expected: 'wrziyfdmlumeqvaatbiosngkc',
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});

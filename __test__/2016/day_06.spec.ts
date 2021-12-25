import { solvePart1, solvePart2 } from '../../src/2016/day_06';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day Six', () => {
  const example = [
    'eedadn',
    'drvtee',
    'eandsr',
    'raavrd',
    'atevrs',
    'tsrnev',
    'sdttsa',
    'rasrtv',
    'nssdts',
    'ntnada',
    'svetve',
    'tesnvt',
    'vntsnd',
    'vrdear',
    'dvrsen',
    'enarar',
  ];
  const real = readAllLines('2016', '06');

  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 'easter',
      },
      {
        name: 'real',
        input: real,
        expected: 'qzedlxso',
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
        expected: 'advent',
      },
      {
        name: 'real',
        input: real,
        expected: 'ucmifjae',
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});

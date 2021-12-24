import { solvePart1, solvePart2 } from '../../src/2016/day_04';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

describe('Day Four', () => {
  const example = [
    'aaaaa-bbb-z-y-x-123[abxyz]',
    'a-b-c-d-e-f-g-h-987[abcde]',
    'not-a-real-room-404[oarel]',
    'totally-real-room-200[decoy]',
  ];
  const real = readAllLines('2016', '04');

  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 1514,
      },
      {
        name: 'real',
        input: real,
        expected: 361724,
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
        name: 'real',
        input: real,
        expected: 482,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });
});

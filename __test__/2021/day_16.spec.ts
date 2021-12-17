import { solvePart1, solvePart2 } from '../../src/2021/day_16';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

const example: string[] = [];

const real: string[] = readAllLines('2021', '16');

describe.skip('Day Sixteenth', () => {
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: '38006F45291200',
        input: ['38006F45291200'],
        expected: 9,
      },
      /* {
        name: '8A004A801A8002F478',
        input: ['8A004A801A8002F478'],
        expected: 16,
      },
      {
        name: '620080001611562C8802118E34',
        input: ['620080001611562C8802118E34'],
        expected: 12,
      },
      {
        name: 'C0015000016115A2E0802F182340',
        input: ['C0015000016115A2E0802F182340'],
        expected: 23,
      },
      {
        name: 'A0016C880162017C3686B18A3D4780',
        input: ['A0016C880162017C3686B18A3D4780'],
        expected: 31,
      },
      {
        name: 'real',
        input: real,
        expected: 0,
      }, */
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

import { solvePart1 } from '../../src/2021/day_13';
import { readFile } from '../../utils';
import { TestCase } from '../../utils/types';

const example: string[] = [
  '6,10',
  '0,14',
  '9,10',
  '0,3',
  '10,4',
  '4,11',
  '6,0',
  '6,12',
  '4,1',
  '0,13',
  '10,12',
  '3,4',
  '3,0',
  '8,4',
  '1,10',
  '2,14',
  '8,10',
  '9,0',
  '',
  'fold along y=7',
  'fold along x=5',
];

const real: string[] = readFile('2021', '13');

describe('Day Thirteen', () => {
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 17,
      },
      {
        name: 'real',
        input: real,
        expected: 675,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart1(input)).toBe(expected);
      });
    });
  });
});

import {
  calculateNumber,
  createDecode,
  solvePart1,
  solvePart2,
} from '../../src/2021/day_08';
import { readAllLines } from '../../utils';
import { TestCase } from '../../utils/types';

const example: string[] = [
  'be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe',
  'edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc',
  'fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg',
  'fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb',
  'aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea',
  'fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb',
  'dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe',
  'bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef',
  'egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb',
  'gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce',
];

const real: string[] = readAllLines('2021', '08');

describe('Day Seven', () => {
  describe('Part One', () => {
    const testCases: TestCase<string>[] = [
      {
        name: 'example',
        input: example,
        expected: 26,
      },
      {
        name: 'real',
        input: real,
        expected: 525,
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
        expected: 61229,
      },
    ];

    testCases.forEach(({ name, input, expected }) => {
      it(`${name}`, () => {
        expect(solvePart2(input)).toBe(expected);
      });
    });
  });

  describe('Create Decode map', () => {
    const input =
      'acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf';
    const want = {
      '8': 'acedgfb',
      '5': 'cdfbe',
      '2': 'gcdfa',
      '3': 'fbcad',
      '7': 'dab',
      '9': 'cefabd',
      '6': 'cdfgeb',
      '4': 'eafb',
      '0': 'cagedb',
      '1': 'ab',
    };

    it('should creates a valid decode', () => {
      expect(createDecode(input)).toEqual(want);
    });
  });

  describe('Calculate Number', () => {
    const want = 9781;
    const decode = createDecode(
      'edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc',
    );
    it('should calcualtes the 4 digits', () => {
      expect(calculateNumber(decode, 'fcgedb cgb dgebacf gc')).toBe(want);
    });
  });
});

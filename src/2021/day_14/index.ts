import { calculateOcurrences, createPolymer, step } from './utils';

export function solvePart1(input: string[], times = 10): number {
  const polymer = createPolymer(input);

  for (let i = 0; i < times; i++)
    polymer.template = step({
      template: polymer.template,
      pairs: polymer.pairs,
    });

  const [min, max] = calculateOcurrences(polymer);

  return max - min;
}

export function solvePart2(input: string[]) {
  return solvePart1(input, 40);
}

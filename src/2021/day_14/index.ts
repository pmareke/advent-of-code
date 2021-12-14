import { calculateOcurrences, createPolymer, step } from './utils';

export function solvePart1(input: string[], times = 10): number {
  const polymer = createPolymer(input);
  let { template } = polymer;
  const { pairs } = polymer;

  for (let i = 0; i < times; i++) template = step(template, pairs);

  const [min, max] = calculateOcurrences(template);

  return max - min;
}

export function solvePart2(input: string[]) {
  return solvePart1(input, 40);
}

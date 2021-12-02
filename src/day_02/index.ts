import { NewSubmarine, OldSubmarine } from './submarine';

export function solvePart1(input: string[]): number {
  const submarine = new OldSubmarine(input);
  submarine.run();
  return submarine.result;
}

export function solvePart2(input: string[]): number {
  const submarine = new NewSubmarine(input);
  submarine.run();
  return submarine.result;
}

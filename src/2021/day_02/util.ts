import { Command } from './types';

export function parseCommands(input: string[]): Command[] {
  return input
    .map((line) => line.split(' '))
    .map(
      (line) =>
        ({
          direction: line[0],
          distance: Number(line[1]),
        } as Command),
    );
}

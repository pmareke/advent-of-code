type Output = {
  horizontal: number;
  deep: number;
  aim: number;
};

type Command = {
  direction: Direction;
  units: number;
};

type Direction = 'forward' | 'up' | 'down';

export function solvePart1(input: string[], partTwo = false): number {
  const { horizontal, deep } = parseCommand(input).reduce(
    (acc, { direction, units }) => {
      if (direction === 'forward') {
        acc.horizontal += units;
        if (partTwo) acc.deep += units * acc.aim;
      }
      if (partTwo) {
        if (direction === 'up') acc.aim -= units;
        if (direction === 'down') acc.aim += units;
      } else {
        if (direction === 'up') acc.deep -= units;
        if (direction === 'down') acc.deep += units;
      }
      return acc;
    },
    { horizontal: 0, deep: 0, aim: 0 } as Output,
  );

  return horizontal * deep;
}

export function solvePart2(input: string[]): number {
  return solvePart1(input, true);
}

function parseCommand(input: string[]): Command[] {
  return input
    .map((line) => line.split(' '))
    .map(
      (line) =>
        ({
          direction: line[0],
          units: Number(line[1]),
        } as Command),
    );
}

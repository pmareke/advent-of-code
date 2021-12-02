type Output = {
  horizontal: number;
  deep: number;
  aim: number;
};

type Command = {
  direction: Direction;
  distance: number;
};

type Direction = 'forward' | 'up' | 'down';

export function solvePart1(input: string[], partTwo = false): number {
  const { horizontal, deep } = parseCommand(input).reduce(
    (acc, { direction, distance }) => {
      if (direction === 'forward') {
        acc.horizontal += distance;
        if (partTwo) acc.deep += distance * acc.aim;
      }
      if (partTwo) {
        if (direction === 'up') acc.aim -= distance;
        if (direction === 'down') acc.aim += distance;
      } else {
        if (direction === 'up') acc.deep -= distance;
        if (direction === 'down') acc.deep += distance;
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
          distance: Number(line[1]),
        } as Command),
    );
}

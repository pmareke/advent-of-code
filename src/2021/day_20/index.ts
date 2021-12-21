export function solvePart1(input: string[], rounds = 2): number {
  return run(input, rounds);
}

export function solvePart2(input: string[]): number {
  return solvePart1(input, 50);
}

const run = (input: string[], steps: number) => {
  const key = (x: number, y: number): string => '_' + x + '_' + y;
  const pattern = input[0];
  let map: { [key: string]: number | undefined } = {};
  let min = -100;
  let max = input.length + 100;
  let sum = 0;

  input
    .slice(1)
    .map((line, i) =>
      line
        .split('')
        .map(
          (character, j) => (map[key(j, i)] = character == '#' ? 1 : undefined),
        ),
    );

  const step = () => {
    const newMap: { [key: string]: number | undefined } = {};
    min -= 1;
    max += 1;
    map = newMap;
    for (let y = min; y <= max; y++)
      for (let x = min; x <= max; x++) {
        let s = '';
        for (let i = -1; i <= 1; i++)
          for (let j = -1; j <= 1; j++)
            s += map[key(x + j, y + i)] == 1 ? '1' : '0';
        const patternIndex = parseInt(s, 2);
        if (pattern[patternIndex] == '#') newMap[key(x, y)] = 1;
      }
  };

  for (let i = 0; i < steps; i++) step();

  for (let y = -steps; y < input.length + steps; y++) {
    for (let x = -steps; x < input.length + steps; x++) {
      if (map[key(x, y)] == 1) sum++;
    }
  }

  return sum;
};

export function solvePart1(input: string[], partTwo = false): string {
  let map: Map<string, number> = new Map();
  const result = [];

  for (let i = 0; i < input[0].length; i++) {
    for (let j = 0; j < input.length; j++) {
      map.set(input[j][i], (map.get(input[j][i]) ?? 0) + 1);
    }
    const sorted = new Map([...map.entries()].sort((a, b) => b[1] - a[1]));
    const letter = partTwo
      ? [...sorted.keys()][sorted.size - 1]
      : [...sorted.keys()][0];

    result.push(letter);
    map = new Map();
  }

  return result.join('');
}

export const solvePart2 = (input: string[]): string => solvePart1(input, true);

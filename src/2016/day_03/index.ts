export function solvePart1(input: string[]): number {
  const columns = parse(input);
  return columns.reduce((acc, current) => {
    const [x, y, z] = current;
    if (x + y > z && x + z > y && y + z > x) acc++;
    return acc;
  }, 0);
}

export function solvePart2(input: string[]): number {
  const columns = parse(input);
  let valid = 0;
  for (let i = 0; i < columns[0].length; i++) {
    for (let j = 0; j < columns.length; j += 3) {
      const x = columns[j][i];
      const y = columns[j + 1][i];
      const z = columns[j + 2][i];
      if (x + y > z && x + z > y && y + z > x) valid++;
    }
  }
  return valid;
}

function parse(input: string[]): number[][] {
  return input.reduce((acc, current) => {
    const row = current
      .trim()
      .split(/ /g)
      .filter((s) => s !== '')
      .map(Number);
    acc.push(row);
    return acc;
  }, [] as number[][]);
}

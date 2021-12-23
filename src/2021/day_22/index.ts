export function solvePart1(input: string[]): number {
  const cubes = input.reduce((acc, line) => {
    acc = parseLine(acc, line);
    return acc;
  }, new Set<string>() as Set<string>);
  return cubes.size;
}

export function solvePart2(input: string[]): number {
  const cubes = input.reduce((acc, line) => {
    acc = parseLine2(acc, line);
    return acc;
  }, {} as { [key: string]: boolean });
  return Object.values(cubes).filter((v) => v).length;
}

function parseLine(acc: Set<string>, line: string): Set<string> {
  const [status, region] = line.split(' ');
  const [x, y, z] = region
    .split(/,/g)
    .map((t) => t.split('=')[1].split('..').map(Number));

  for (let i = x[0]; i <= x[1]; i++) {
    if (x[0] < -50 || x[1] > 50) continue;
    for (let j = y[0]; j <= y[1]; j++) {
      if (y[0] < -50 || y[1] > 50) continue;
      for (let k = z[0]; k <= z[1]; k++) {
        if (y[0] < -50 || y[1] > 50) continue;
        if (status === 'on') {
          acc.add(`${i},${j},${k}`);
        } else {
          acc.delete(`${i},${j},${k}`);
        }
      }
    }
  }
  return acc;
}

function parseLine2(
  acc: { [key: string]: boolean },
  line: string,
): { [key: string]: boolean } {
  const [status, region] = line.split(' ');
  const [x, y, z] = region
    .split(/,/g)
    .map((t) => t.split('=')[1].split('..').map(Number));

  for (let i = x[0]; i <= x[1]; i++) {
    for (let j = y[0]; j <= y[1]; j++) {
      for (let k = z[0]; k <= z[1]; k++) {
        const key = `${i},${j},${k}`;
        if (status === 'on') {
          acc[key] = true;
        } else if (status === 'off') {
          acc[key] = false;
        }
      }
    }
  }
  return acc;
}

export function solvePart1(input: string[]): number {
  const map = input.map((line) => line.split('').map(Number));
  let lowers = 0;

  for (let i = 0; i < map.length; i++) {
    for (let j = 0; j < map[i].length; j++) {
      const values = [
        [0, 1],
        [1, 0],
        [0, -1],
        [-1, 0],
      ];
      const points = values
        .filter(
          ([x, y]) =>
            x + i >= 0 &&
            x + i < map.length &&
            y + j >= 0 &&
            y + j < map[0].length,
        )
        .map(([h, k]) => map[h + i][k + j]);

      if (map[i][j] < Math.min(...points)) {
        lowers += 1 + map[i][j];
      }
    }
  }

  return lowers;
}

export function solvePart2(input: string[]): number {
  const map = generateMap(input.map((line) => line.split('').map(Number)));
  const neighbords: number[] = [];

  for (let i = 0; i < map.length; i++) {
    for (let j = 0; j < map[i].length; j++) {
      neighbords.push(findNeighbords(map, j, i));
    }
  }

  return neighbords
    .sort((a, b) => b - a)
    .slice(0, 3)
    .reduce((acc, current) => (acc *= current));
}

function generateMap(numMap: number[][]): boolean[][] {
  const map: boolean[][] = new Array(numMap.length)
    .fill(undefined)
    .map(() => Array(numMap[0].length).fill(true));

  for (let y = 0; y < numMap.length; y++) {
    for (let x = 0; x < numMap[y].length; x++) {
      if (numMap[y][x] === 9) {
        map[y][x] = false;
      }
    }
  }
  return map;
}

function findNeighbords(
  map: boolean[][],
  x: number,
  y: number,
  total = 0,
): number {
  if (map[y][x]) {
    map[y][x] = false;
    total++;

    if (y > 0) total = findNeighbords(map, x, y - 1, total);
    if (y < map.length - 1) total = findNeighbords(map, x, y + 1, total);
    if (x > 0) total = findNeighbords(map, x - 1, y, total);
    if (x < map[0].length - 1) total = findNeighbords(map, x + 1, y, total);
  }
  return total;
}

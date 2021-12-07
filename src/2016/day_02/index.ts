const keypad = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
];

const keypad2 = [
  [0, 0, 1, 0, 0],
  [0, 2, 3, 4, 0],
  [5, 6, 7, 8, 9],
  [0, 'A', 'B', 'C', 0],
  [0, 0, 'D', 0, 0],
];

export function solvePart1(input: string[]): number {
  let x = 1;
  let y = 1;

  const key = input.reduce((acc, current) => {
    current.split('').reduce(
      (acc, current) => {
        switch (current) {
          case 'U':
            y = y === 0 ? 0 : y - 1;
            break;
          case 'D':
            y = y === 2 ? 2 : y + 1;
            break;
          case 'L':
            x = x === 0 ? 0 : x - 1;
            break;
          case 'R':
            x = x === 2 ? 2 : x + 1;
            break;
          default:
            break;
        }
        acc.x = x;
        acc.y = y;
        return acc;
      },
      { x: 0, y: 0 },
    );
    acc += `${keypad[y][x]}`;
    return acc;
  }, '');

  return Number(key);
}

export function solvePart2(input: string[]): string {
  let x = 0;
  let y = 2;

  const key = input.reduce((acc, current) => {
    current.split('').reduce(
      (acc, current) => {
        switch (current) {
          case 'U':
            y = y === 0 || keypad2[x][y - 1] === 0 ? y : y - 1;
            break;
          case 'D':
            y = y === 4 || keypad2[x][y + 1] === 0 ? y : y + 1;
            break;
          case 'L':
            x = x === 0 || keypad2[x - 1][y] === 0 ? x : x - 1;
            break;
          case 'R':
            x = x === 4 || keypad2[x + 1][y] === 0 ? x : x + 1;
            break;
          default:
            break;
        }
        acc.x = x;
        acc.y = y;
        return acc;
      },
      { x: 0, y: 0 },
    );
    acc += `${keypad2[y][x]}`;
    return acc;
  }, '');

  return key;
}

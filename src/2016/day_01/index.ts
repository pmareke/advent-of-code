export function solvePart1(input: string[], partTwo = false): number {
  const coordinates: string[] = input[0].split(', ');

  const DX = [0, 1, 0, -1];
  const DY = [-1, 0, 1, 0];
  let d = 0;
  let x = 0;
  let y = 0;
  const seen = new Set();

  loop: for (let index = 0; index < coordinates.length; index++) {
    d = (d + (coordinates[index].substring(0, 1) === 'L' ? 3 : 1)) % 4;
    const distance = Number(coordinates[index].substring(1));
    if (partTwo) {
      for (let i = 0; i < distance; i++) {
        x += DX[d];
        y += DY[d];
        if (seen.has(`(${x},${y})`)) {
          break loop;
        }
        seen.add(`(${x},${y})`);
      }
    } else {
      x += DX[d] * distance;
      y += DY[d] * distance;
    }
  }

  return Math.abs(x) + Math.abs(y);
}

export function solvePart2(input: string[]): number {
  return solvePart1(input, true);
}

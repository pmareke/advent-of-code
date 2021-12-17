import { createTargetArea, Target } from './utils';

export function solvePart1(input: string[]): number {
  const targetArea = createTargetArea(input[0]);
  return Math.max(...solve(targetArea));
}

export function solvePart2(input: string[]) {
  const targetArea = createTargetArea(input[0]);
  return solve(targetArea).length;
}

function solve(target: Target): number[] {
  const points = [];
  const { x2, y1 } = target;
  for (let y = y1; y < -y1; y++) {
    for (let x = x2; x > 0; x--) {
      const point = fly(target, x, y);
      if (point != null) points.push(point);
    }
  }
  return points;
}

function fly(target: Target, dx: number, dy: number) {
  const { x1, x2, y1, y2 } = target;
  let [x, y, maxY] = [0, 0, -Infinity];
  while (x <= x2 && y >= y1) {
    x += dx;
    y += dy;
    maxY = Math.max(maxY, y);
    dx -= Math.sign(dx);
    dy--;
    if (x >= x1 && x <= x2 && y >= y1 && y <= y2) return maxY;
  }
}

export type Target = {
  x1: number;
  x2: number;
  y1: number;
  y2: number;
};

export function createTargetArea(input: string): Target {
  const [x, y] = input.split('target area: ')[1].split(', ');
  const [minX, maxX] = x.split('x=')[1].split('..').map(Number);
  const [minY, maxY] = y.split('y=')[1].split('..').map(Number);

  return {
    x1: minX,
    x2: maxX,
    y1: minY,
    y2: maxY,
  };
}

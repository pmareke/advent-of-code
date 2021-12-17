export type Target = {
  x1: number;
  x2: number;
  y1: number;
  y2: number;
};

export function createTargetArea(input: string): Target {
  const REGEX = /target area: x=(\d+)..(\d+), y=(-?\d+)..(-?\d+)/g;
  // eslint-disable-next-line @typescript-eslint/no-non-null-assertion
  const [x1, x2, y1, y2] = REGEX.exec(input)!
    .slice(1, 5)
    .map((x) => parseInt(x));
  return {
    x1,
    x2,
    y1,
    y2,
  };
}

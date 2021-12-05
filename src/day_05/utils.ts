import { Coordinates, Forest, Points } from './types';

export function parseInput(input: string[]): Points[] {
  return input.reduce<Points[]>((acc, line) => {
    acc.push(getCoordinates(line));
    return acc;
  }, []);
}

function getCoordinates(line: string): Points {
  const coordinates = line
    .split(' -> ')
    .map((c) => c.split(','))
    .flatMap((c) => c)
    .map(Number);

  return {
    x1: coordinates[0],
    y1: coordinates[1],
    x2: coordinates[2],
    y2: coordinates[3],
  };
}

export function generateCoordinates(pairs: Points[]): Forest {
  let max = 0;

  const coordinates = pairs.reduce<Coordinates[]>((acc, { x1, x2, y1, y2 }) => {
    max = Math.max(max, x1, x2, y1, y2);

    if (x1 === x2) {
      for (let y = Math.min(y1, y2); y <= Math.max(y1, y2); y++) {
        acc.push({ x: x1, y });
      }
    } else if (y1 === y2) {
      for (let x = Math.min(x1, x2); x <= Math.max(x1, x2); x++) {
        acc.push({ x, y: y1 });
      }
    } else {
      const stepX = x1 < x2 ? 1 : -1;
      const stepY = y1 < y2 ? 1 : -1;
      for (let i = 0; i <= Math.abs(x1 - x2); i++) {
        const x = x1 + i * stepX;
        const y = y1 + i * stepY;
        acc.push({ x, y });
      }
    }

    return acc;
  }, []);

  return {
    max,
    coordinates,
  };
}

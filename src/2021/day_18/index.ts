import {
  addNodetoTree,
  magnitude,
  makeTree,
  parseLines,
  reduce,
} from './utils';

export function solvePart1(input: string[]): number {
  const lines = parseLines(input);
  let tree = makeTree(lines[0]);

  for (let i = 1; i < lines.length; i++) {
    tree = reduce(addNodetoTree(tree, makeTree(lines[i])));
  }
  return magnitude(tree);
}

export function solvePart2(input: string[]): number {
  const lines = parseLines(input);

  let maxMagnitude = 0;
  for (let i = 0; i < lines.length; i++) {
    for (let j = 0; j < lines.length; j++) {
      if (i == j) continue;
      const mag = magnitude(
        reduce(addNodetoTree(makeTree(lines[i]), makeTree(lines[j]))),
      );
      maxMagnitude = Math.max(maxMagnitude, mag);
    }
  }
  return maxMagnitude;
}

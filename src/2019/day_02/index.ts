export function solvePart1(
  input: number[],
  noun: number,
  verb: number,
): number {
  input[1] = noun;
  input[2] = verb;

  for (let i = 0; i < input.length; i += 4) {
    const [op, d1, d2, d3] = input.slice(i, i + 4);
    if (op === 1) {
      input[d3] = input[d1] + input[d2];
    }
    if (op === 2) {
      input[d3] = input[d1] * input[d2];
    }
    if (op === 99) {
      return input[0];
    }
  }
  return 0;
}

export function solvePart2(input: number[]): number {
  for (let i = 0; i < 100; i++) {
    for (let j = 0; j < 100; j++) {
      if (solvePart1([...input], i, j) === 19690720) return 100 * i + j;
    }
  }
  return -1;
}

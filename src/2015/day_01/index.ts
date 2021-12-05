export function solvePart1(input: string[]): number {
  return input[0]
    .split('')
    .reduce((acc, current) => (acc += current === '(' ? 1 : -1), 0);
}

export function solvePart2(input: string[]): number {
  const x = input[0].split('');
  let acc = 0;

  for (let index = 0; index < x.length; index++) {
    acc += x[index] === '(' ? 1 : -1;
    if (acc === -1) return index + 1;
  }

  return 0;
}

export function solvePart1(input: string[]): number {
  return input.reduce((acc, current) => {
    const [rules, sentence] = current.split(': ');
    const [values, x] = rules.split(' ');
    const [min, max] = values.split('-').map(Number);
    const times = sentence.split('').filter((l) => l === x).length;
    if (times >= min && times <= max) acc++;
    return acc;
  }, 0);
}

export function solvePart2(input: string[]): number {
  return input.reduce((acc, current) => {
    const [rules, sentence] = current.split(': ');
    const [values, x] = rules.split(' ');
    const [min, max] = values.split('-').map(Number);
    if (
      (sentence[min - 1] === x && sentence[max - 1] !== x) ||
      (sentence[min - 1] !== x && sentence[max - 1] === x)
    )
      acc++;
    return acc;
  }, 0);
}

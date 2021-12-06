export function solvePart1(num: string[]): number {
  const input = num[0].split('');
  let sum = 0;
  for (let i = 0; i < input.length; i++) {
    const next = (i + 1) % input.length;
    if (input[i] == input[next]) {
      sum += Number(input[i]);
    }
  }
  return sum;
}

export function solvePart2(num: string[]): number {
  const input = num[0].split('');
  let sum = 0;
  for (let i = 0; i < input.length; i++) {
    const next = (i + input.length / 2) % input.length;
    if (input[i] == input[next]) {
      sum += Number(input[i]);
    }
  }
  return sum;
}

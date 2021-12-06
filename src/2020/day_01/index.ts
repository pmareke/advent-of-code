export function solvePart1(input: number[]): number {
  for (let i = 0; i < input.length; i++) {
    for (let j = 1; j < input.length; j++) {
      if (input[i] + input[j] === 2020) {
        return input[i] * input[j];
      }
    }
  }
  return 0;
}

export function solvePart2(input: number[]): number {
  for (let i = 0; i < input.length; i++) {
    for (let j = 1; j < input.length; j++) {
      for (let k = 2; k < input.length; k++) {
        if (input[i] + input[j] + input[k] === 2020) {
          return input[i] * input[j] * input[k];
        }
      }
    }
  }
  return 0;
}

export function solvePart1(input: string[]): number {
  const numbers = input[0].split(',').map(Number);
  return play(80, numbers);
}

export function solvePart2(input: string[]): number {
  const numbers = input[0].split(',').map(Number);
  return play(256, numbers);
}

function play(days: number, initialState: number[]): number {
  const lanternfishs = Array(9).fill(0);

  initialState.forEach((i) => {
    lanternfishs[i]++;
  });

  for (let i = 0; i < days; i++) {
    const zeros = lanternfishs[0];

    lanternfishs.forEach((_, index) => {
      lanternfishs[index] = lanternfishs[index + 1]; // grow up
    });

    lanternfishs[6] += zeros; // every day new lanternfishs reset.
    lanternfishs[8] = zeros; // every day new lanternfishs born.
  }

  return lanternfishs.reduce((a, b) => a + b);
}

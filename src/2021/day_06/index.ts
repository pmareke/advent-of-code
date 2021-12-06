export function solvePart1(input: string[]): number {
  const numbers = input[0].split(',').map(Number);
  return play(80, numbers);
}

export function solvePart2(input: string[]): number {
  const numbers = input[0].split(',').map(Number);
  return play(256, numbers);
}

function play(days: number, initialState: number[]): number {
  const lanternfishsByAge = Array(9).fill(0);

  initialState.forEach((i) => {
    lanternfishsByAge[i]++;
  });

  for (let i = 0; i < days; i++) {
    const zeros = lanternfishsByAge[0];

    lanternfishsByAge.forEach((_, index) => {
      lanternfishsByAge[index] = lanternfishsByAge[index + 1]; // get older
    });

    lanternfishsByAge[6] += zeros; // every day new lanternfishs reset.
    lanternfishsByAge[8] = zeros; // every day new lanternfishs born.
  }

  return lanternfishsByAge.reduce((a, b) => a + b);
}

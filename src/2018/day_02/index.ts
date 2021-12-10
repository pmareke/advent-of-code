export function solvePart1(input: string[]): number {
  const times = input.reduce(
    (acc, current) => {
      let isTwo = false;
      let isThree = false;
      new Set(current).forEach((letter) => {
        if (countCharacters(letter, current) === 2 && !isTwo) {
          isTwo = true;
          acc[0]++;
        }
        if (countCharacters(letter, current) === 3 && !isThree) {
          acc[1]++;
          isThree = true;
        }
      });
      return acc;
    },
    [0, 0],
  );

  return times[0] * times[1];
}

function countCharacters(char: string, word: string): number {
  return word.split('').reduce((acc, ch) => (ch === char ? acc + 1 : acc), 0);
}

export function solvePart2(input: string[]): string {
  return '';
}

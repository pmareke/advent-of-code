export function solvePart1(input: string[]): number {
  const common = mostCommon(input);
  const gamma = parseInt(common, 2);
  const epsilon = Math.pow(2, input[0].length) - 1 - gamma;
  return gamma * epsilon;
}

export function solvePart2(input: string[]): number {
  const oxygen = reccursion(input, 0, (x, y) => x === y);
  const CO2 = reccursion(input, 0, (x, y) => x !== y);
  return parseInt(oxygen, 2) * parseInt(CO2, 2);
}

function mostCommon(input: string[]): string {
  const commonNumbers = Array.from<number>({ length: input[0].length }).fill(0);

  input.forEach((group) => {
    group
      .split('')
      .forEach((num, index) => (commonNumbers[index] += Number(num)));
  });

  const length = input.length;
  return commonNumbers.reduce(
    (acc, times) => (acc += length - times > length / 2 ? '0' : '1'),
    '',
  );
}

function reccursion(
  input: string[],
  start: number,
  callback: (x: string, y: string) => boolean,
): string {
  if (input.length === 1) return input[0];
  const common = mostCommon(input)[start];
  return reccursion(
    input.filter((x) => callback(x[start], common)),
    ++start,
    callback,
  );
}

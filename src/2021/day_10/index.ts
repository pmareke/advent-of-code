const open = ['(', '[', '{', '<'];
const close = [')', ']', '}', '>'];

export function solvePart1(input: string[]): number {
  const points: { [key: string]: number } = {
    ')': 3,
    ']': 57,
    '}': 1197,
    '>': 25137,
  };

  return input.reduce((acc, line) => {
    const opens: string[] = [];
    const chars = line.split('');
    let isValid = true;

    for (let i = 0; i < chars.length; i++) {
      const element = chars[i];
      if (open.includes(element)) {
        opens.push(element);
        continue;
      }

      const last = opens.pop() ?? '';
      if (isValid && open.indexOf(last) !== close.indexOf(element)) {
        acc += points[element];
        isValid = false;
      }
    }

    return acc;
  }, 0);
}

export function solvePart2(input: string[]): number {
  const points: { [key: string]: number } = {
    ')': 1,
    ']': 2,
    '}': 3,
    '>': 4,
  };

  const scores = input.reduce((acc, line) => {
    const chars = line.split('');
    const opens: string[] = [];
    let isValid = true;

    for (let i = 0; i < chars.length; i++) {
      const element = chars[i];
      if (open.includes(element)) {
        opens.push(element);
        continue;
      }

      const last = opens.pop() ?? '';
      if (isValid && open.indexOf(last) !== close.indexOf(element)) {
        isValid = false;
      }
    }

    if (isValid) {
      const score = opens.reverse().reduce((acc, current) => {
        const x = acc * 5;
        acc = x + points[close[open.indexOf(current)]];
        return acc;
      }, 0);
      acc.push(score);
    }
    return acc;
  }, [] as number[]);

  const sortedScores = scores.sort((a, b) => a - b);
  const middle = Math.floor(sortedScores.length / 2);

  return sortedScores[middle];
}

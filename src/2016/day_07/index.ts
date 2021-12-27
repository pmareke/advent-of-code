export function solvePart1(input: string[]): number {
  let result = 0;
  for (let i = 0; i < input.length; i++) {
    if (isTLS(input[i])) result++;
  }
  return result;
}

export function solvePart2(input: string[]): number {
  let result = 0;
  for (let i = 0; i < input.length; i++) {
    if (isSSL(input[i])) result++;
  }
  return result;
}

function isTLS(ip: string): boolean {
  const PATTERN = /\[(.*?)\]/g;
  const brackets =
    ip.match(PATTERN)?.map((x) => x.slice(1, x.length - 1)) ?? [];

  if (brackets.some(isValid)) return false;

  return ip
    .split(PATTERN)
    .filter((i) => !brackets.includes(i))
    .some(isValid);
}

function isSSL(ip: string): boolean {
  const PATTERN = /\[(.*?)\]/g;
  const brackets =
    ip.match(PATTERN)?.map((x) => x.slice(1, x.length - 1)) ?? [];
  const blocks = ip.split(PATTERN).filter((i) => !brackets.includes(i));

  const candidates = brackets.reduce<string[]>((acc, current) => {
    acc.push(...findCandidates(current));
    return acc;
  }, []);

  const candidates2 = blocks.reduce<string[]>((acc, current) => {
    acc.push(...findCandidates(current));
    return acc;
  }, []);

  return candidates.some((c1) =>
    candidates2.some((c2) => c1[0] === c2[1] && c2[0] === c1[1]),
  );
}

function isValid(input: string): boolean {
  for (let j = 0; j < input.length; j++) {
    if (
      input[j] !== input[j + 1] &&
      input[j] == input[j + 3] &&
      input[j + 1] === input[j + 2]
    ) {
      return true;
    }
  }
  return false;
}

function findCandidates(input: string): string[] {
  return input.split('').reduce<string[]>((acc, current, idx) => {
    if (current !== input[idx + 1] && current == input[idx + 2]) {
      acc.push(`${current}${input[idx + 1]}${input[idx + 2]}`);
    }
    return acc;
  }, []);
}

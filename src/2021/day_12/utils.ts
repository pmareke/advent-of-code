export function createPaths(input: string[]): Map<string, string[]> {
  return input.reduce((acc, nodes) => {
    const [start, end] = nodes.split('-');
    acc.set(start, [...(acc.get(start) ?? []), end]);
    acc.set(end, [...(acc.get(end) ?? []), start]);
    return acc;
  }, new Map());
}

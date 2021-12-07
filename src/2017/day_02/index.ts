export function solvePart1(num: string[]): number {
  return num.reduce((acc, current) => {
    const nums = current.split('\t').map(Number);
    acc += Math.max(...nums) - Math.min(...nums);
    return acc;
  }, 0);
}

export function solvePart2(num: string[]): number {
  return num.reduce((acc, current) => {
    const nums = current
      .split('\t')
      .map(Number)
      .sort((a, b) => (a > b ? 1 : -1));

    for (let i = 0; i < nums.length; i++) {
      for (let j = 1; j < nums.length; j++) {
        if ((i !== j && nums[j] % nums[i]) === 0) {
          acc += nums[j] / nums[i];
          break;
        }
      }
    }
    return acc;
  }, 0);
}
